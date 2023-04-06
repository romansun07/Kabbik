import 'dart:async';
import 'dart:math';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';

import 'package:rxdart/rxdart.dart';
import 'Allmain.dart';
import 'audiomedia.dart';

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
  runApp(const AudioPage());
}

class MyAudioHandler extends BaseAudioHandler
    with
        QueueHandler, // mix in default queue callback implementations
        SeekHandler {
  // mix in default seek callback implementations

  // The most common callbacks:
  Future<void> play() async {
    // All 'play' requests from all origins route to here. Implement this
    // callback to start playing audio appropriate to your app. e.g. music.
  }
  Future<void> pause() async {}
  Future<void> stop() async {}
  Future<void> seek(Duration position) async {}
  Future<void> skipToQueueItem(int i) async {}
}

class AudioPage extends StatelessWidget {
  const AudioPage({Key? key}) : super(key: key);

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
  // bool isPlaying = false;
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

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.playerStateStream.listen((state) {
      if (state.playing != isPlaying) {
        setState(() {
          isPlaying = state.playing;
        });
      }
    });

    player.durationStream.listen((newDuration) {
      setState(() {
        duration = newDuration!;
      });
    });

    player.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

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
                //     // await _audioHandler.resume();
                //   },
                // ),

                // Slider(
                //   min: 0,
                //   max: duration.inSeconds.toDouble(),
                //   value: position.inSeconds.toDouble(),
                //   onChanged: (value) {
                //     final position = Duration(seconds: value.toInt());
                //     player.seek(position);
                //     //player.resume();
                //   },
                // ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position.inSeconds)),
                      Text(formatTime((duration - position).inSeconds)),
                    ],
                  ),
                ),

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
                        Row(
                          children: [
                            _button(Icons.skip_previous, _audioHandler.rewind),
                            _button(Icons.replay_10_rounded,
                                _audioHandler.skipToPrevious),
                            if (playing)
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: _pbutton(
                                      Icons.pause, _audioHandler.pause))
                            else
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: _pbutton(
                                    Icons.play_arrow, _audioHandler.play),
                              ),
                            _button(Icons.forward_10_rounded,
                                (_audioHandler.fastForward)),
                            _button(
                                Icons.skip_next, (_audioHandler.skipToNext)),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showSliderDialog(
                      context: context,
                      title: "Adjust volume",
                      divisions: 10,
                      min: 0.0,
                      max: 1.0,
                      value: player.volume,
                      stream: player.volumeStream,
                      onChanged: player.setVolume,
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<double>(
                      stream: player.speedStream,
                      builder: (context, snapshot) => IconButton(
                        icon: Text(
                          "${snapshot.data?.toStringAsFixed(1)}x",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          showSliderDialog(
                            context: context,
                            title: "Adjust speed",
                            divisions: 6,
                            min: -0.0,
                            max: 2,
                            value: player.speed,
                            stream: player.speedStream,
                            onChanged: player.setSpeed,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        // Text(
                        //   '1.0x',
                        //   style: TextStyle(color: Colors.white),
                        // ),
                        // Text(
                        //   'Speed',
                        //   style: TextStyle(color: Colors.white),
                        // )

                        // StreamBuilder<double>(
                        //   stream: _audioHandler.,
                        //   builder: (context, snapshot) => IconButton(
                        //     icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                        //         style: const TextStyle(
                        //             fontWeight: FontWeight.bold)),
                        //     onPressed: () {
                        //       showSliderDialog(
                        //         context: context,
                        //         title: "Adjust speed",
                        //         divisions: 10,
                        //         min: 0.5,
                        //         max: 1.5,
                        //         value: player.speed,
                        //         stream: player.speedStream,
                        //         onChanged: player.setSpeed,
                        //       );
                        //     },
                        //   ),
                        // ),
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
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: const Color(0xff1c164f),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Play List',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Title(
                                          color: Colors.white,
                                          child: const Text(
                                            'Title 1',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        StreamBuilder<bool>(
                                          stream: _audioHandler.playbackState
                                              .map((state) => state.playing)
                                              .distinct(),
                                          builder: (context, snapshot) {
                                            final playing =
                                                snapshot.data ?? false;
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (playing)
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 15,
                                                      child: _ppbutton(
                                                          Icons.pause,
                                                          _audioHandler.pause))
                                                else
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.pink,
                                                    radius: 15,
                                                    child: _ppbutton(
                                                        Icons.play_arrow,
                                                        _audioHandler.play),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 300,
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.featured_play_list),
                      label: const Text("Play List"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
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

  IconButton _ppbutton(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),
        iconSize: 15.0,
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
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    // ... and also the current media item via mediaItem.
    mediaItem.add(_item);

    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

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









class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    Key? key,
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  SeekBarState createState() => SeekBarState();
}

class SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: Colors.blue.shade100,
            inactiveTrackColor: Colors.grey.shade300,
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            inactiveTrackColor: Colors.transparent,
          ),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  // TODO: Replace these two by ValueStream.
  required double value,
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => SizedBox(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: const TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

T? ambiguate<T>(T? value) => value;
