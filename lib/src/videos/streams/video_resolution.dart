/// Width and height of a video.
class VideoResolution {
  /// Viewport width.
  final int width;

  /// Viewport height.
  final int height;

  /// Initializes an instance of [VideoResolution]
  const VideoResolution(this.width, this.height);

  @override
  String toString() => '${width}x$height';

  /// Transform to Map
  Map<String, dynamic> toMap() {
    return {
      'width': width.toString(),
      'height': height.toString()
    };
  }

  /// Return VideoResolution from Map
  // ignore: prefer_constructors_over_static_methods
  static VideoResolution fromMap(Map<String, dynamic> map) {
    return VideoResolution(
      int.parse(map['width']),
      int.parse(map['height'])
    );
  }

}
