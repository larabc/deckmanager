import 'package:flutter/material.dart';

class BlueManaTrack extends StatefulWidget {
  const BlueManaTrack({super.key});

  @override
  State<BlueManaTrack> createState() => _BlueManaTrackState();
}

class _BlueManaTrackState extends State<BlueManaTrack> {
  int _counter = 0;
  List<int> sumInts = [1, 2, 4, 7, 10, 16];

  void _incrementCounter(int element) {
    setState(() {
      _counter += element;
    });
  }

  void _decreaseCounter(int element) {
    setState(() {
      _counter -= element;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Blue mana tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...sumInts.reversed.map(
              (element) => TextButton(
                onPressed: () => _decreaseCounter(element),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(element.toString()),
                    const Icon(Icons.remove),
                  ],
                ),
              ),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ...sumInts.map(
              (element) => TextButton(
                onPressed: () => _incrementCounter(element),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(element.toString()), const Icon(Icons.add)],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
