require 'fileutils'
require 'thor'
require 'streamio-ffmpeg'

require 'string_ext'

class Thumbnailer::CLI < Thor

  desc 'gen MOVIE_DIR', 'generate thumbnails'
  option :size,            type: :string,  required: true, default: '500x282',    aliases: '-s',  desc: 'size of thumbnail. "{width}x{height}" ex) 125x70'
  option :output_dir,      type: :string,  required: true, default: 'thumbnails', aliases: '-o',  desc: 'output directory path'
  option :thumbnail_count, type: :numeric, required: true, default: 16,           aliases: '-n',  desc: 'number of thumbnails'
  option :thumbnail_format,type: :string,  required: true, default: 'png',                        desc: 'format of thubnail file ex) png, jpg'
  option :video_format,    type: :string,  required: true, default: 'mp4',                        desc: 'format of video file ex) mp4'
  def gen(movie_dir='./')
    video_format = options[:video_format]

    Dir.glob(File.join(movie_dir, "**/*.#{video_format}")) do |path|
      thumbnail_dir = "#{options[:output_dir]}/#{File.basename(path).gsub('.'+video_format, '')}"
      count = options[:thumbnail_count]
      puts "[START] generate thumbnail into #{thumbnail_dir} (#{count} thumbnails)".green

      cleanup_dir thumbnail_dir

      movie = FFMPEG::Movie.new(path)
      interval = interval_seq movie, count

      count.times { |i|
        seek_time = i * interval
        if seek_time < movie.duration.to_i
          movie.screenshot("#{thumbnail_dir}/#{i}.#{options[:thumbnail_format]}", { seek_time: seek_time, resolution: options[:size] }, preserve_aspect_ratio: :width)
        else
          puts "[ERROR] no thumbnail at #{seek_time} second.".pink
        end
      }
    end
  end

  no_commands do
    def cleanup_dir path
      FileUtils.rm_r path if File.exists? path
      FileUtils.mkdir_p path
    end

    def interval_seq movie, count
      [(movie.duration / count).to_i, 1].max
    end
  end
end
