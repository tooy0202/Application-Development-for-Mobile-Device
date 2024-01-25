import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ข้อที่ 1'),
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
  TextEditingController _cmController = TextEditingController();
  String _showName = "name";
  String sexUser = "";
  bool sex = false;
  List<String> sec = ['182', '307'];
  String secUser = "";
  double ageSlider = 1;
  bool checkAptitudeC = false;
  bool checkAptitudeCplus = false;
  bool checkAptitudePy = false;
  bool checkAptitudeDa = false;
  String scheckAptitudeC = "";
  String scheckAptitudeCplus = "";
  String scheckAptitudePy = "";
  String scheckAptitudeDa = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 200,
              child: Column(
                children: [
                  TextField(
                    controller: _cmController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('ชาย'),
                        Switch(
                          value: sex,
                          onChanged: (bool value) {
                            setState(() {
                              sex = value;
                              sexUser = value == true ? "หญิง" : "ชาย";
                            });
                          },
                        ),
                        const Text('หญิง'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio(
                          value: sec[0],
                          groupValue: secUser,
                          onChanged: (value) {
                            setState(() {
                              secUser = value.toString();
                            });
                          },
                        ),
                        const Text('Sec 182'),
                        Radio(
                          value: sec[1],
                          groupValue: secUser,
                          onChanged: (value) {
                            setState(() {
                              secUser = value.toString();
                            });
                          },
                        ),
                        const Text('Sec 307'),
                      ],
                    ),
                  ),
                  const Text(
                    'Age',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Slider(
                    value: ageSlider,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (double value) {
                      setState(() {
                        ageSlider = value;
                      });
                    },
                  ),
                  const Text(
                    'ความถนัดในภาษาคอมพิวเตอร์',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'C',
                        ),
                        Checkbox(
                          value: checkAptitudeC,
                          onChanged: (bool? value) {
                            setState(() {
                              checkAptitudeC = value!;
                              scheckAptitudeC = value == true ? "C" : "";
                            });
                          },
                        ),
                        const Text(
                          'C++',
                        ),
                        Checkbox(
                          value: checkAptitudeCplus,
                          onChanged: (bool? value) {
                            setState(() {
                              checkAptitudeCplus = value!;
                              scheckAptitudeCplus = value == true ? "C++" : "";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Python',
                        ),
                        Checkbox(
                          value: checkAptitudePy,
                          onChanged: (bool? value) {
                            setState(() {
                              checkAptitudePy = value!;
                              scheckAptitudePy = value == true ? "Python" : "";
                            });
                          },
                        ),
                        const Text(
                          'Dark',
                        ),
                        Checkbox(
                          value: checkAptitudeDa,
                          onChanged: (bool? value) {
                            setState(() {
                              checkAptitudeDa = value!;
                              scheckAptitudeDa = value == true ? "Dark" : "";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showName = _cmController.text;
                      });
                    },
                    child: const Text('บันทึก'),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'แสดงผล',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                const Text('ชื่อ-นามสกุล'),
                                Text(_showName),
                                Text('เพศ : $sexUser'),
                                Text('Sec : $secUser'),
                                Text('อายุ : ${ageSlider.toStringAsFixed(0)}'),
                                const Text('ความถนัด'),
                                Text(
                                    '$scheckAptitudeC $scheckAptitudeCplus $scheckAptitudeDa $scheckAptitudePy'),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
