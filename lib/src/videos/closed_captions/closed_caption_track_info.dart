import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../extensions/helpers_extension.dart';
import 'closed_caption_format.dart';
import 'language.dart';

part 'closed_caption_track_info.g.dart';

/// Metadata associated with a certain [ClosedCaptionTrack]
@JsonSerializable()
class ClosedCaptionTrackInfo extends Equatable {
  /// Manifest URL of the associated track.
  final Uri url;

  /// Language of the associated track.
  final Language language;

  /// Whether the associated track was automatically generated.
  final bool isAutoGenerated;

  /// Track format
  final ClosedCaptionFormat format;

  /// Initializes an instance of [ClosedCaptionTrackInfo]
  const ClosedCaptionTrackInfo(this.url, this.language,
      {this.isAutoGenerated = false, this.format})
      : assert(format != null);

  /// Returns this auto-translated to another language.
  /// Keeping the same format.
  ClosedCaptionTrackInfo autoTranslate(String lang) {
    return ClosedCaptionTrackInfo(
        url.replaceQueryParameters({'tlang': lang}),
        Language(lang, ''),
        isAutoGenerated: isAutoGenerated,
        format: format);
  }

  @override
  String toString() => 'CC Track ($language)';

  @override
  List<Object> get props => [url, language, isAutoGenerated];


  ///
  factory ClosedCaptionTrackInfo.fromJson(Map<String, dynamic> json) =>
      _$ClosedCaptionTrackInfoFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$ClosedCaptionTrackInfoToJson(this);
}
