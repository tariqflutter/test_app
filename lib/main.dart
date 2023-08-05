import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(HelloApp());
}

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelloScreen(),
    );
  }
}

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  List<String> _emojis = [
    '👋',
    '🌞',
    '😃',
    '🌈',
    '🚀',
    '❤️',
    '🎉',
    '🍀',
  ];
  String _currentEmoji = '👋';

  void _changeColorsAndEmoji() {
    setState(() {
      _backgroundColor = _generateRandomColor();
      _textColor = _generateRandomColor();
      _currentEmoji = _emojis[Random().nextInt(_emojis.length)];
    });
  }

  Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColorsAndEmoji,
      child: Scaffold(
        body: Container(
          color: _backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _currentEmoji,
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 20),
                Text(
                  'Hello there',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
