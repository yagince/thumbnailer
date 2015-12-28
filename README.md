# Thumbnailer

動画ファイルからサムネイル作成する君

## Installation

Add this line to your application's Gemfile:

### for Mac OSX

```
brew install ffmpeg
gem install specific_install
gem specific_install yagince/thumbnailer
```

## Usage

```
$ bin/thumbnailer help gen

Usage:
  thumbnailer gen MOVIE_DIR -n, --thumbnail-count=N -o, --output-dir=OUTPUT_DIR -s, --size=SIZE

Options:
  -s, --size=SIZE              # size of thumbnail. "{width}x{height}" ex) 125x70
                               # Default: 500x282
  -o, --output-dir=OUTPUT_DIR  # output directory path
                               # Default: thumbnails
  -n, --thumbnail-count=N      # number of thumbnails
                               # Default: 16

generate thumbnails
```
