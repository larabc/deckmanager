import 'package:flutter/material.dart';

class HighTides extends StatefulWidget {
  const HighTides({super.key});

  @override
  State<HighTides> createState() => _HighTidesState();
}

class _HighTidesState extends State<HighTides> {
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
          'High Tides played this turn',
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
