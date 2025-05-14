import 'package:deck_manager/blue_mana_track.dart';
import 'package:deck_manager/high_tides.dart';
import 'package:deck_manager/ideas_unbound_played.dart';
import 'package:deck_manager/opponent_deck_track.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'High Tide deck manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Key _highTideKey = UniqueKey();
  Key _blueManaKey = UniqueKey();
  Key _ideasUnboundKey = UniqueKey();
  Key _opponentDeckKey = UniqueKey();

  void _reset() {
    setState(() {
      _highTideKey = UniqueKey();
      _blueManaKey = UniqueKey();
      _ideasUnboundKey = UniqueKey();
      _opponentDeckKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: HighTides(key: _highTideKey),
                  ),
                ),
                SizedBox(height: 12),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: BlueManaTrack(key: _blueManaKey),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: IdeasUnboundPlayed(key: _ideasUnboundKey),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: OpponentDeckTracker(key: _opponentDeckKey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        child: Icon(Icons.replay),
      ),
    );
  }
}
