import 'streams.dart';

/// YouTube media stream that only contains audio.
class AudioOnlyStreamInfo implements AudioStreamInfo {
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
  final String audioCodec;

  /// Initializes an instance of [AudioOnlyStreamInfo]
  AudioOnlyStreamInfo(this.tag, this.url, this.container, this.size,
      this.bitrate, this.audioCodec);

  @override
  String toString() => 'Audio-only ($tag | $container)';

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'streamType': 'audioOnly',
      'tag': tag,
      'url': url.toString(),
      'container': container.name,
      'size': size.totalBytes,
      'bitrate': bitrate.bitsPerSecond,
      'audioCodec': audioCodec
    };
  }

  /// Initialize this model from Map
  // ignore: prefer_constructors_over_static_methods
  static AudioOnlyStreamInfo fromMap(Map<String, dynamic> map) {
    return AudioOnlyStreamInfo(
      map['tag'], Uri.parse(map['url']),
      StreamContainer.parse(map['container']),
      FileSize(map['size']), Bitrate(map['bitrate']),
      map['audioCodec'],
    );
  }

}
