///
abstract class StreamInfoProvider {
  ///
  static final RegExp contentLenExp = RegExp(r'clen=(\d+)');

  ///
  int get tag;

  ///
  String get url;

  ///
  String? get signature => null;

  ///
  String? get signatureParameter => null;

  ///
  // ignore: avoid_returning_null
  int? get contentLength => null;

  ///
  int? get bitrate;

  ///
  String? get container;

  ///
  String? get audioCodec => null;

  ///
  String? get videoCodec => null;

  ///
  String? get videoQualityLabel => null;

  ///
  // ignore: avoid_returning_null
  int? get videoWidth => null;

  ///
  // ignore: avoid_returning_null
  int? get videoHeight => null;

  ///
  // ignore: avoid_returning_null
  int? get framerate => null;
}
