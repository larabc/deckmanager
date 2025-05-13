import 'package:flutter/material.dart';

class BlueManaTrack extends StatefulWidget {
  const BlueManaTrack({super.key});

  @override
  State<BlueManaTrack> createState() => _BlueManaTrackState();
}

class _BlueManaTrackState extends State<BlueManaTrack> {
  int _counter = 0;
  final List<int> sumInts = [1, 2, 4, 7, 10, 16];

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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 500;

    // Botones de restar
    final decreaseButtons = sumInts.reversed.map(
      (element) => TextButton(
        onPressed: () => _decreaseCounter(element),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text(element.toString()), const Icon(Icons.remove)],
        ),
      ),
    );

    // Botones de sumar
    final increaseButtons = sumInts.map(
      (element) => TextButton(
        onPressed: () => _incrementCounter(element),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text(element.toString()), const Icon(Icons.add)],
        ),
      ),
    );

    final counterWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '$_counter',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Blue mana tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        isSmallScreen
            ? Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 2,
              runSpacing: 2,
              children: [
                ...decreaseButtons,
                Row(
                  children: [counterWidget],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                ...increaseButtons,
              ],
            )
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [...decreaseButtons, counterWidget, ...increaseButtons],
            ),
      ],
    );
  }
}
