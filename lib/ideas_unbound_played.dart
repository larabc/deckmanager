import 'package:flutter/material.dart';

class IdeasUnboundPlayed extends StatefulWidget {
  const IdeasUnboundPlayed({super.key});

  @override
  State<IdeasUnboundPlayed> createState() => _IdeasUnboundPlayedState();
}

class _IdeasUnboundPlayedState extends State<IdeasUnboundPlayed> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ideas unbound played this turn',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _decreaseCounter,
              child: const Icon(Icons.remove),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
