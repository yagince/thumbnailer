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
  thumbnailer gen ${動画ファイルがあるディレクトリ} --thumbnail-format=THUMBNAIL_FORMAT --video-format=VIDEO_FORMAT -n, --thumbnail-count=N -o, --output-dir=OUTPUT_DIR -s, --size=SIZE

Options:
  -s, --size=SIZE                          # サムネイルのサイズ "{width}x{height}" ex) 125x70
                                           # Default: 500x282
  -o, --output-dir=OUTPUT_DIR              # 作成されたサムネイルの出力先
                                           # Default: thumbnails
  -n, --thumbnail-count=N                  # サムネイルの作成枚数
                                           # Default: 16
      --thumbnail-format=THUMBNAIL_FORMAT  # サムネイルのファイル形式 ex) png, jpg
                                           # Default: png
      --video-format=VIDEO_FORMAT          # 動画ファイルのフォーマット ex) mp4
                                           # Default: mp4

generate thumbnails
```
