import 'package:equatable/equatable.dart';

import 'channel_id.dart';

/// YouTube channel metadata.
class Channel with EquatableMixin {
  /// Channel ID.
  final ChannelId id;

  /// Channel URL.
  String get url => 'https://www.youtube.com/channel/$id';

  /// Channel title.
  final String title;

  /// URL of the channel's logo image.
  final String logoUrl;

  /// Initializes an instance of [Channel]
  Channel(this.id, this.title, this.logoUrl);

  /// Transform Channel instance to Map
  Map<String, dynamic> toMap(Channel channel) {
    return {
      'id': id,
      'title': title,
      'logoUrl': logoUrl
    };
  }

  /// Get a Channel instance from Map
  Channel fromMap(Map<String, dynamic> map) {
    return Channel(
      map['id'],
      map['title'],
      map['logoUrl']
    );
  }

  @override
  String toString() => 'Channel ($title)';

  @override
  List<Object> get props => [id];
}
