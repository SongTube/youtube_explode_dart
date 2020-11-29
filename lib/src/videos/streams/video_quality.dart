/// Video quality.
enum VideoQuality {
  /// Low quality (144p).
  low144,

  /// Low quality (240p).
  low240,

  /// Medium quality (360p).
  medium360,

  /// Medium quality (480p).
  medium480,

  /// High quality (720p).
  high720,

  /// High quality (1080p).
  high1080,

  /// High quality (1440p).
  high1440,

  /// High quality (2160p).
  high2160,

  /// High quality (2880p).
  high2880,

  /// High quality (3072p).
  high3072,

  /// High quality (4320p).
  high4320
}

/// Convert video quality to enum VideoQuality
VideoQuality videoQualityFromString(String quality) {
  switch (quality) {
    case 'low144':
      return VideoQuality.low144;
      break;
    case 'low240':
      return VideoQuality.low240;
      break;
    case 'medium360':
      return VideoQuality.medium360;
      break;
    case 'medium480':
      return VideoQuality.medium480;
      break;
    case 'high720':
      return VideoQuality.high720;
      break;
    case 'high1080':
      return VideoQuality.high1080;
      break;
    case 'high1440':
      return VideoQuality.high1440;
      break;
    case 'high2160':
      return VideoQuality.high2160;
      break;
    case 'high3072':
      return VideoQuality.high3072;
      break;
    case 'high4320':
      return VideoQuality.high4320;
      break;
    default:
      break;
  }
  return null;
}