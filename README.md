# Thumbnailer

動画ファイルからサムネイル作成する君

## Installation

Add this line to your application's Gemfile:

### for Mac OSX

```
brew install ffmpeg
gem install bundler specific_install
gem specific_install https://github.com/yagince/thumbnailer
```

## Usage

```
Usage:
  thumbnailer gen MOVIE_DIR --thumbnail-format=THUMBNAIL_FORMAT --video-format=VIDEO_FORMAT -n, --thumbnail-count=N -o, --output-dir=OUTPUT_DIR -s, --size=SIZE

Options:
  -s, --size=SIZE                          # size of thumbnail. "{width}x{height}" ex) 125x70
                                           # Default: 500x282
  -o, --output-dir=OUTPUT_DIR              # output directory path
                                           # Default: thumbnails
  -n, --thumbnail-count=N                  # number of thumbnails
                                           # Default: 16
      --thumbnail-format=THUMBNAIL_FORMAT  # format of thubnail file ex) png, jpg
                                           # Default: png
      --video-format=VIDEO_FORMAT          # format of video file ex) mp4
                                           # Default: mp4

generate thumbnails
```
