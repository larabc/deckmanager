import 'package:flutter/material.dart';

class OpponentDeckTracker extends StatefulWidget {
  const OpponentDeckTracker({super.key});

  @override
  State<OpponentDeckTracker> createState() => _OpponentDeckTrackerState();
}

class _OpponentDeckTrackerState extends State<OpponentDeckTracker> {
  final TextEditingController _controller = TextEditingController();
  int? _requiredMana;

  void _calculate() {
    final opponentCards = int.tryParse(_controller.text);
    if (opponentCards == null || opponentCards < 1) {
      setState(() {
        _requiredMana = null;
      });
      return;
    }

    int manaNeeded;
    if (opponentCards % 4 == 0) {
      manaNeeded = opponentCards - 3;
    } else {
      int nearestMultipleOf4 = (opponentCards ~/ 4) * 4;
      manaNeeded = nearestMultipleOf4 + 1;
    }

    setState(() {
      _requiredMana = manaNeeded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          "Opponent Deck Tracker (Stream of Thought)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Opponent's remaining cards",
            hintText: "Ej: 41",
          ),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: _calculate,
          child: const Text("Calculate Required Mana"),
        ),
        if (_requiredMana != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mana required to deck them with Stream of Thought: $_requiredMana",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
          ),
      ],
    );
  }
}
