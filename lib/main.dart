import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Resume'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'images/pic.png',
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            const Textname(
              Textn: 'Athit Suntalodom',
              Textl: 'อธิศ สุนทโรดม',
              Textr: 'อายุ     : 22',
              Textb: 'ชื่อเล่น : ตุ้ย',
              Textbday: 'วันเดือนปีเกิด: 17 พฤษจิกายน 2544',
              Textfb: 'FB : athit suntalodom',
              Textgm: 'GM : tooy0303@gmail.com',
              Texthm: 'HM : athit_su65@live.rmutl.ac.th',
            ),
          ],
        ),
      ),
    );
  }
}

class Textname extends StatelessWidget {
  const Textname(
      {super.key,
      required this.Textn,
      required this.Textl,
      required this.Textr,
      required this.Textb,
      required this.Textbday,
      required this.Textfb,
      required this.Textgm,
      required this.Texthm});
  final String Textn;
  final String Textl;
  final String Textr;
  final String Textb;
  final String Textbday;
  final String Textfb;
  final String Textgm;
  final String Texthm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          Textn,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          Textl,
          style: const TextStyle(
              fontSize: 15,
              height: 0.001,
              color: Color.fromARGB(255, 158, 158, 158)),
        ),
        Text(
          Textr,
          style: const TextStyle(
            height: 4,
            fontSize: 13,
          ),
        ),
        Text(
          Textb,
          style: const TextStyle(
            height: -1,
            fontSize: 13,
          ),
        ),
        Text(
          Textbday,
          style: const TextStyle(
            height: 2,
            fontSize: 13,
          ),
        ),
        Text(
          Textfb,
          style: const TextStyle(
            height: 3,
            fontSize: 12,
          ),
        ),
        Text(
          Textgm,
          style: const TextStyle(
            height: 0,
            fontSize: 12,
          ),
        ),
        Text(
          Texthm,
          style: const TextStyle(
            height: 3,
            fontSize: 12,
          ),
        )
      ]),
    );
  }
}
