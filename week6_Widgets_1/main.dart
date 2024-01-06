import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Widgets',
      theme: ThemeData(
        focusColor: Color.fromARGB(255, 255, 0, 64),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 64)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab Widgets'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _devalue() {
    setState(() {
      _counter--;
    });
  }

  void _setzero() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 228, 3, 51),
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.music_note_sharp, size: 70, color: Colors.cyan),
                Icon(Icons.sync, size: 70, color: Colors.teal),
                Icon(Icons.favorite, size: 70, color: Colors.pinkAccent),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 0, 64).withAlpha(_counter),
            ),
            child: Center(
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Container(
            child: Column(children: [
              OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                  onSurface: Colors.white,
                  elevation: 5,
                  foregroundColor: Colors.teal,
                  textStyle: const TextStyle(fontSize: 20),
                  shadowColor: Colors.white38,
                  side: BorderSide(color: Colors.teal, width: 1.2),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                ),
                onPressed: _setzero,
                child: const Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.cyan,
                  onSurface: Colors.white,
                  elevation: 5,
                  foregroundColor: Colors.cyan,
                  textStyle: const TextStyle(fontSize: 20),
                  side: BorderSide(color: Colors.cyan, width: 2.0),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  shadowColor: Colors.white38,
                ),
                onPressed: _incrementCounter,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    '+1',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 0, 64),
                  onSurface: Colors.white,
                  elevation: 5,
                  foregroundColor: Color.fromARGB(255, 255, 0, 64),
                  textStyle: const TextStyle(fontSize: 20),
                  shadowColor: Colors.white38,
                ),
                onPressed: _devalue,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    '-1',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
