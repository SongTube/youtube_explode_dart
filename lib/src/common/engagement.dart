import 'package:equatable/equatable.dart';

/// User activity statistics.
class Engagement extends Equatable {
  /// View count.
  final int viewCount;

  /// Like count.
  final int likeCount;

  /// Dislike count.
  final int dislikeCount;

  /// Initializes an instance of [Statistics]
  const Engagement(this.viewCount, this.likeCount, this.dislikeCount);

  /// Average user rating in stars (1 star to 5 stars).
  num get avgRating {
    if (likeCount + dislikeCount == 0) {
      return 0;
    }
    return 1 + 4.0 * likeCount / (likeCount + dislikeCount);
  }

  @override
  String toString() =>
      '$viewCount views, $likeCount likes, $dislikeCount dislikes';

  @override
  List<Object> get props => [viewCount, likeCount, dislikeCount];

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'viewCount': viewCount.toString(),
      'likeCount': likeCount.toString(),
      'dislikeCount': dislikeCount.toString()
    };
  }

  /// Create an instance of this Model from Map
  // ignore: prefer_constructors_over_static_methods
  static Engagement fromMap(Map<String, dynamic> map) {
    return Engagement(
      int.parse(map['viewCount']),
      int.parse(map['likeCount']),
      int.parse(map['dislikeCount'])
    );
  }

}
