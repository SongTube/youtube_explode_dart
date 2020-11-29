import 'package:test/test.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() {

  YoutubeExplode yt;
  setUpAll(() {
    yt = YoutubeExplode();
  });

  tearDownAll(() {
    yt.close();
  });

  test('Trasform VideoOnlyStreamInfo to Map', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.videoOnly.toList()[0].toMap();
    expect(map, isNotEmpty);
  });

  test('Trasform valid Map to VideoOnlyStreamInfo', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.videoOnly.toList()[0].toMap();
    var streamInfo = VideoOnlyStreamInfo.fromMap(map);
    expect(streamInfo, isNotNull);
  });

  test('Trasform AudioOnlyStreamInfo to Map', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.audioOnly.toList()[0].toMap();
    expect(map, isNotEmpty);
  });

  test('Trasform valid Map to AudioOnlyStreamInfo', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.audioOnly.toList()[0].toMap();
    var streamInfo = AudioOnlyStreamInfo.fromMap(map);
    expect(streamInfo, isNotNull);
  });

  test('Trasform MuxedStreamInfo to Map', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.muxed.toList()[0].toMap();
    expect(map, isNotEmpty);
  });

  test('Trasform valid Map to MuxedStreamInfo', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.muxed.toList()[0].toMap();
    var streamInfo = MuxedStreamInfo.fromMap(map);
    expect(streamInfo, isNotNull);
  });

  test('Transform StreamManifest to Map', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.toMap();
    expect(map, isNotEmpty);
  });

  test('Trasform valid Map to StreamManifest', () async {
    var manifest = await yt.videos.streamsClient.getManifest('rsAAeyAr-9Y');
    var map = manifest.toMap();
    var newManifest = StreamManifest.fromMap(map);
    expect(newManifest, isNotNull);
  });

}