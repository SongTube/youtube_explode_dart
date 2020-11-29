import 'bitrate.dart';
import 'filesize.dart';
import 'framerate.dart';
import 'stream_container.dart';
import 'video_quality.dart';
import 'video_resolution.dart';
import 'video_stream_info.dart';

/// YouTube media stream that only contains video.
class VideoOnlyStreamInfo implements VideoStreamInfo {
  @override
  final int tag;

  @override
  final Uri url;

  @override
  final StreamContainer container;

  @override
  final FileSize size;

  @override
  final Bitrate bitrate;

  @override
  final String videoCodec;

  @override
  final String videoQualityLabel;

  @override
  final VideoQuality videoQuality;

  @override
  final VideoResolution videoResolution;

  @override
  final Framerate framerate;

  /// Initializes an instance of [VideoOnlyStreamInfo]
  VideoOnlyStreamInfo(
      this.tag,
      this.url,
      this.container,
      this.size,
      this.bitrate,
      this.videoCodec,
      this.videoQualityLabel,
      this.videoQuality,
      this.videoResolution,
      this.framerate);

  @override
  String toString() => 'Video-only ($tag | $videoQualityLabel | $container)';

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'streamType': 'videoOnly',
      'tag': tag,
      'url': url.toString(),
      'container': container.name,
      'size': size.totalBytes,
      'bitrate': bitrate.bitsPerSecond,
      'videoCodec': videoCodec,
      'videoQualityLabel': videoQualityLabel,
      'videoQuality': videoQuality.toString(),
      'videoResolution': videoResolution.toMap(),
      'framerate': framerate.framesPerSecond.toString()
    };
  }

  /// Initialize this model from Map
  // ignore: prefer_constructors_over_static_methods
  static VideoOnlyStreamInfo fromMap(Map<String, dynamic> map) {
    return VideoOnlyStreamInfo(
      map['tag'], Uri.parse(map['url']),
      StreamContainer.parse(map['container']),
      FileSize(map['size']), Bitrate(map['bitrate']),
      map['videoCodec'], map['videoQualityLabel'],
      videoQualityFromString(map['videoQuality']),
      VideoResolution.fromMap(map['videoResolution']),
      Framerate(double.parse(map['framerate']))
    );
  }

}
