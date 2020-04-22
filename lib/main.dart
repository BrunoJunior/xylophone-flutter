import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  static List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Colors.purple,
  ];

  static List<NoteButton> getButtons() => colors
      .asMap()
      .entries
      .map((entry) => NoteButton(note: entry.key + 1, color: entry.value))
      .toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getButtons(),
          ),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  final int note;
  final Color color;
  static AudioCache player = AudioCache();
  NoteButton({@required this.note, @required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        enableFeedback: false,
        onTap: () => player.play('note$note.wav'),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
