import 'package:test/test.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() {
  YoutubeExplode yt;
  setUp(() {
    yt = YoutubeExplode();
  });

  tearDown(() {
    yt.close();
  });

  test('Search a youtube video from the api', () async {
    var videos =
        await yt.search.getVideos('undead corporation megalomania').toList();
    expect(videos, isNotEmpty);
  });

  test('Search a youtube video from the search page', () async {
    var videos = await yt.search
        .getVideosFromPage('hello')
        .where((e) => e is SearchVideo) // Take only the videos.
        .cast<SearchVideo>()
        .take(10) // Take on 10 results.
        .toList();
    expect(videos, hasLength(10));
    var video = videos.first;
    expect(video.videoId, isNotNull);

    expect(video.videoTitle, isNotEmpty);
    expect(video.videoAuthor, isNotEmpty);
    expect(video.videoDescriptionSnippet, isNotEmpty);
    expect(video.videoDuration, isNotEmpty);
    expect(video.videoViewCount, greaterThan(0));
    expect(video.videoThumbnails, isNotEmpty);
  });

  test('Search a youtube videos from the search page - old', () async {
    // ignore: deprecated_member_use_from_same_package
    var searchQuery = await yt.search.queryFromPage('hello');
    expect(searchQuery.content, isNotEmpty);
    expect(searchQuery.relatedVideos, isNotEmpty);
    expect(searchQuery.relatedQueries, isNotEmpty);
  }, skip: 'Not supported anymore');

  test('Search with no results - old', () async {
    var query =
        // ignore: deprecated_member_use_from_same_package
        await yt.search.queryFromPage('g;jghEOGHJeguEPOUIhjegoUEHGOGHPSASG');
    expect(query.content, isEmpty);
    expect(query.relatedQueries, isEmpty);
    expect(query.relatedVideos, isEmpty);
    var nextPage = await query.nextPage();
    expect(nextPage, isNull);
  });

  test('Search youtube videos have thumbnails - old', () async {
    // ignore: deprecated_member_use_from_same_package
    var searchQuery = await yt.search.queryFromPage('hello');
    expect(searchQuery.content.first, isA<SearchVideo>());

    var video = searchQuery.content.first as SearchVideo;
    expect(video.videoThumbnails, isNotEmpty);
  });

  test('Search youtube videos from search page (stream) - old', () async {
    var query = await yt.search.getVideosFromPage('hello').take(30).toList();
    expect(query, hasLength(30));
  });
}
