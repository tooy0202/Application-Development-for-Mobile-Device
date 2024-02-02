import 'package:flutter/material.dart';
import 'dart:math';

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
      home: const MyHomePage(title: 'วันนี้กินอะไรดี'),
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
  final formName = GlobalKey<FormState>();
  TextEditingController nemu1 = TextEditingController();
  TextEditingController nemu2 = TextEditingController();
  TextEditingController nemu3 = TextEditingController();
  TextEditingController email = TextEditingController();
  List<String> nemu = [''];
  List<int> numMenu = [1, 2, 3];
  int numMenuC = 1;
  Random rng = Random();
  int randomNumber = 0;
  String menu = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    void add() {
      if (nemu1 != null) {
        nemu.add(nemu1.text);
      }
      if (nemu2 != null) {
        nemu.add(nemu2.text);
      }
      if (nemu3 != null) {
        nemu.add(nemu3.text);
      }
    }

    void Ra() {
      int i = 0;
      while (i <= numMenuC) {
        randomNumber = rng.nextInt(nemu.length);
        i++;
      }
      menu = nemu[randomNumber];
    }

    void Re() {
      setState(() {
        nemu1.text = '';
        nemu2.text = '';
        nemu3.text = '';
        email.text = '';
        numMenuC = 1;
        menu = '';
        nemu.clear();
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: Column(
                children: [
                  Form(
                    key: formName,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกข้อมูล Email';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'รูปแบบอีเมลไม่ถูกต้อง';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                        TextFormField(
                          controller: nemu1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกเมนูที่ต้องการทาน';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "เมนูที่ 1",
                          ),
                        ),
                        TextFormField(
                          controller: nemu2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกเมนูที่ต้องการทาน';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "เมนูที่ 2",
                          ),
                        ),
                        TextFormField(
                          controller: nemu3,
                          decoration: const InputDecoration(
                            labelText: "เมนูที่ 3",
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text('เลือกจำนวนการสุ่ม'),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio(
                                  value: numMenu[0],
                                  groupValue: numMenuC,
                                  onChanged: (value) {
                                    numMenuC = value as int;
                                  }),
                              const Text('1'),
                              Radio(
                                  value: numMenu[1],
                                  groupValue: numMenuC,
                                  onChanged: (value) {
                                    numMenuC = value as int;
                                  }),
                              const Text('2'),
                              Radio(
                                  value: numMenu[2],
                                  groupValue: numMenuC,
                                  onChanged: (value) {
                                    numMenuC = value as int;
                                  }),
                              const Text('3'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    if (formName.currentState!.validate()) {
                      setState(() {
                        _email = email.text;
                      });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'นี้คือเมนูที่คุณเลือก ${nemu1.text} ${nemu2.text} ${nemu3.text}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                      'คุณต้องการสุ่มแมนูอาหารเป็นจำนวน $numMenuC ครั้งหรือไม่',
                                      style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: const Text('เลือกใหม่')),
                                TextButton(
                                    onPressed: () {
                                      formName.currentState!.save();
                                      setState(() {
                                        add();
                                        Ra();
                                      });
                                      Navigator.pop(context, 'OK');
                                      nemu.clear();
                                    },
                                    child: const Text('ยืนยัน')),
                              ],
                            );
                          });
                    }
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formName.currentState != null) {
                      formName.currentState!.reset();
                      Re();
                    }
                  },
                  child: Text('Reset'),
                ),
              ]),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${menu == "" ? "" : "ยินดีด้วยคุณ $_email ได้ทาน"}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    '${menu == "" ? "" : "$menu"}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
