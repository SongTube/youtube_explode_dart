import 'dart:collection';

import 'package:equatable/equatable.dart';

import '../channels/channel_id.dart';
import '../common/common.dart';
import '../reverse_engineering/responses/responses.dart';
import 'video_id.dart';

/// YouTube video metadata.
class Video with EquatableMixin {
  /// Video ID.
  final VideoId id;

  /// Video URL.
  String get url => 'https://www.youtube.com/watch?v=$id';

  /// Video title.
  final String title;

  /// Video author.
  final String author;

  /// Video author Id.
  final ChannelId channelId;

  /// Video upload date.
  final DateTime uploadDate;

  /// Video description.
  final String description;

  /// Duration of the video.
  final Duration duration;

  /// Available thumbnails for this video.
  final ThumbnailSet thumbnails;

  /// Search keywords used for this video.
  final UnmodifiableListView<String> keywords;

  /// Engagement statistics for this video.
  final Engagement engagement;

  /// Used internally.
  /// Shouldn't be used in the code.
  final WatchPage watchPage;

  /// Returns true if the watch page is available for this video.
  bool get hasWatchPage => watchPage != null;

  /// Initializes an instance of [Video]
  Video(
      this.id,
      this.title,
      this.author,
      this.channelId,
      this.uploadDate,
      this.description,
      this.duration,
      this.thumbnails,
      Iterable<String> keywords,
      this.engagement,
      [this.watchPage])
      : keywords = UnmodifiableListView(keywords);

  @override
  String toString() => 'Video ($title)';

  @override
  List<Object> get props => [id];

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id.value,
      'title': title,
      'author': author,
      'channelId': channelId.value,
      'uploadDate': uploadDate.toString(),
      'description': description,
      'duration': duration.inSeconds.toString(),
      'thumbnails': id.value,
      'engagement': engagement.toMap(),
    };
  }

  /// Create an instance of this model from Map
  // ignore: prefer_constructors_over_static_methods
  static Video fromMap(Map<String, dynamic> map) {
    return Video(
      VideoId(map['id']),
      map['title'],
      map['author'],
      ChannelId(map['channelId']),
      DateTime.parse(map['uploadDate']),
      map['description'],
      Duration(seconds: int.parse(map['duration'])),
      ThumbnailSet(map['thumbnails']),
      null,
      Engagement.fromMap(map['engagement']),
      null
    );
  }
}
