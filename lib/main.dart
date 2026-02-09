import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const EcoLogApp());

class EcoLogApp extends StatelessWidget {
  const EcoLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: EcoLog());
  }
}

class EcoLog extends StatefulWidget {
  @override
  State<EcoLog> createState() => _EcoLogState();
}

Color randomColor() {
  return Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
}

class _EcoLogState extends State<EcoLog> {
  final List<String> _data = [];
  final TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EcoLog – App Multiplataforma")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _input,
              decoration: const InputDecoration(labelText: "Nombre del punto"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _data.add(_input.text);
                _input.clear();
              });
            },
            child: const Text("Registrar"),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: _data.map((item) {
                  return Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: randomColor(),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
