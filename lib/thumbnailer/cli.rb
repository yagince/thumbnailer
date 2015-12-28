require 'fileutils'
require 'thor'
require 'streamio-ffmpeg'

class Thumbnailer::CLI < Thor

  desc 'gen MOVIE_DIR', 'generate thumbnails'
  option :size,       type: :string, required: true, default: '500x282',    aliases: '-s', desc: 'size of thumbnail. "{width}x{height}" ex) 125x70'
  option :output_dir, type: :string, required: true, default: 'thumbnails', aliases: '-o', desc: 'output directory path'
  def gen(movie_dir='./')
    Dir.glob(File.join(movie_dir, '**/*.mp4')) do |path|
      thumbnail_dir = "#{options[:output_dir]}/#{File.basename(path).gsub('.mp4', '')}"

      cleanup_dir thumbnail_dir

      movie = FFMPEG::Movie.new(path)
      interval = (movie.duration / 16).to_i
      interval = [interval, 1].max

      (0..1).each{|i|
        if i * interval < (movie.duration - 0.5)
          movie.screenshot("#{thumbnail_dir}/#{i}.png", { seek_time: i * interval, resolution: options[:size] }, preserve_aspect_ratio: :width)
        end
      }
    end
  end

  no_commands do
    def cleanup_dir path
      FileUtils.rm_r path if File.exists? path
      FileUtils.mkdir_p path
    end
  end
end
