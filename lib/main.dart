import 'package:flutter/material.dart';

void main() => runApp(const EcoLogApp());

class EcoLogApp extends StatelessWidget {
  const EcoLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcoLog(),
    );
  }
}

class EcoLog extends StatefulWidget {
  @override
  State<EcoLog> createState() => _EcoLogState();
}

class _EcoLogState extends State<EcoLog> {
  final List<String> _data = [];
  final TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoLog – App Multiplataforma"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _input,
              decoration: const InputDecoration(
                labelText: "Nombre del punto",
              ),
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
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(_data[index])),
            ),
          ),
        ],
      ),
    );
  }
}
