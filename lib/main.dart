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

class Punto {
  final String nombre;
  final Color color;

  Punto(this.nombre, this.color);
}

class _EcoLogState extends State<EcoLog> {
  final List<Punto> _data = [];
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
                _data.add(Punto(_input.text, randomColor()));
                _input.clear();
              });
            },
            child: const Text("Registrar"),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 16,
                runSpacing: 26,
                children: _data.asMap().entries.map((entry) {
                  int index = entry.key;
                  Punto item = entry.value;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: item.color,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          item.nombre,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // 🔴 Botón borrar en esquina inferior derecha
                      Positioned(
                        bottom: -4,
                        right: -4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _data.removeAt(index);
                            });
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
