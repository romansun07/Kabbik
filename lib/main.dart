import 'dart:async';

import 'package:audio_service/audio_service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'omain.dart';

late AudioHandler _audioHandler;

Future<void> main() async {
  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );
  runApp(const Wmain());
}
// class MyAudioHandler extends BaseAudioHandler
//     with QueueHandler, // mix in default queue callback implementations
//     SeekHandler { // mix in default seek callback implementations

//   // The most common callbacks:
//   Future<void> play() async {
//     // All 'play' requests from all origins route to here. Implement this
//     // callback to start playing audio appropriate to your app. e.g. music.
//   }
//   Future<void> pause() async {}
//   Future<void> stop() async {}
//   Future<void> seek(Duration position) async {}
//   Future<void> skipToQueueItem(int i) async {}
// }

class Wmain extends StatelessWidget {
  const Wmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kabbik Audio Service',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final audioPlayer = AudioPlayer();
  // //bool audioHandler = false;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;

  // @override
  // void initState() {
  //   _audioHandler.onPlayerStateChanged.listen((state) {
  //     setState(() {
  //       isPlaying = state == PlayerState.playing;
  //     });
  //   });
  //   _audioHandler.onDurationChanged.listen((newDuration) {
  //     setState(() {
  //       duration = newDuration;
  //     });
  //   });
  //   audioPlayer.onPositionChanged.listen((newPosition) {
  //     setState(() {
  //       position = newPosition;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0C1B3E),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Subscribe'),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 400,
                  child: Image.network(
                      'https://i.scdn.co/image/ab67616d0000b273d9892243ac1beb60589f1115'),
                ),
                Column(
                  children: const [
                    Text(
                      'নিজ দায়িত্বে হাসুন: ট্রেইলার',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'ইমন চৌধুরী',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'অর্চনা রানী সাহা, মাজহারুল হক মুজাহির',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // StreamBuilder<MediaItem?>(
                //   stream: _audioHandler.mediaItem,
                //   builder: (context, snapshot) {
                //     final mediaItem = snapshot.data;
                //     return Text(mediaItem?.title ?? '');
                //   },
                // ),
                // Slider(
                //   min: 0,
                //   max: duration.inSeconds.toDouble(),
                //   value: position.inSeconds.toDouble(),
                //   onChanged: (value) async {
                //     final position = Duration(seconds: value.toInt());
                //     await _audioHandler.seek(position);
                //     await _audioHandler.resume();
                //   },
                // ),
                StreamBuilder<bool>(
                  stream: _audioHandler.playbackState
                      .map((state) => state.playing)
                      .distinct(),
                  builder: (context, snapshot) {
                    final playing = snapshot.data ?? false;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _button(Icons.replay_10_rounded, _audioHandler.rewind),
                        if (playing)
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: _pbutton(Icons.pause, _audioHandler.pause))
                        else
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child:
                                _pbutton(Icons.play_arrow, _audioHandler.play),
                          ),
                        _button(Icons.forward_10_rounded,
                            (_audioHandler.fastForward)),
                      ],
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        // IconButton(
                        //   onPressed: null,
                        //   icon: Icon(Icons.speed_sharp),
                        // ),
                        Text(
                          '1.0x',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Speed',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.alarm,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Sleep Time',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                    // Text(
                    //   'Play List',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                Column(
                  children: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.featured_play_list,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Play List',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                // A seek bar.
                // StreamBuilder<MediaState>(
                //   stream: _mediaStateStream,
                //   builder: (context, snapshot) {
                //     final mediaState = snapshot.data;
                //     return SeekBar(
                //       duration: mediaState?.mediaItem?.duration ?? Duration.zero,
                //       position: mediaState?.position ?? Duration.zero,
                //       onChangeEnd: (newPosition) {
                //         _audioHandler.seek(newPosition);
                //       },
                //     );
                //   },
                // ),
                // Display the processing state.
                // StreamBuilder<AudioProcessingState>(
                //   stream: _audioHandler.playbackState
                //       .map((state) => state.processingState)
                //       .distinct(),
                //   builder: (context, snapshot) {
                //     final processingState =
                //         snapshot.data ?? AudioProcessingState.idle;
                //     return Text(
                //         "Processing state: ${describeEnum(processingState)}");
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Stream<MediaState> get _mediaStateStream =>
  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: onPressed,
      );
  IconButton _pbutton(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),
        iconSize: 30.0,
        color: Colors.black,
        onPressed: onPressed,
      );
}

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  static final _item = MediaItem(
    id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  final _player = AudioPlayer();

  /// Initialise our audio handler.
  AudioPlayerHandler() {
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    // ... and also the current media item via mediaItem.
    mediaItem.add(_item);

    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
