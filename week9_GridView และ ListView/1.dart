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
  final formName = GlobalKey<FormState>();
  final formsearch = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController searchname = TextEditingController();
  List<String> _name = [];
  List<String> _age = [];
  List<String> _num = [];
  String showname = "";
  String shownum = "";
  String showage = "";
  int i = 0;

  @override
  Widget build(BuildContext context) {
    re() {
      setState(() {
        name.text = '';
        age.text = '';
        num.text = '';
      });
    }

    searchName([String temp = ""]) {
      int j = 0;
      while (j < _name.length) {
        if (_name[j] == temp) {
          setState(() {
            showname = _name[j];
            showage = _age[j];
            shownum = _num[j];
          });
          break; // หลังจากพบค่าที่ตรงกันให้หยุดการวนลูปทันที
        }
        j++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: formName,
              child: Container(
                width: 400,
                height: 335,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกข้อมูลชื่อนามสกุล';
                        } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
                          return 'ชื่อนามสกุลไม่ถูกต้อง';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "ชื่อ-นามสกุล",
                      ),
                    ),
                    TextFormField(
                      controller: age,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกข้อมูล อายุ';
                        } else if (!RegExp(r"^[0-9]").hasMatch(value)) {
                          return 'อายุไม่ถูกต้อง';
                        } else if (value.length > 3) {
                          return 'อายุไม่ถูกต้อง';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "อายุ",
                      ),
                    ),
                    TextFormField(
                      controller: num,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกข้อมูล เบอร์โทรศัพท์';
                        } else if (!RegExp(r"^[0-9]").hasMatch(value)) {
                          return 'เบอร์โทรศัพท์ไม่ถูกต้อง';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "เบอร์โทรศัพท์",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (formName.currentState!.validate()) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'คุณต้องการเพิ่มข้อมูลตามนี้ใช้หรือไม่',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, 'OK');
                                                },
                                                child: const Text('ย้อนกลับ')),
                                            TextButton(
                                                onPressed: () {
                                                  formName.currentState!.save();
                                                  setState(() {
                                                    i++;
                                                    _name.add(name.text);
                                                    _age.add(age.text);
                                                    _num.add(num.text);
                                                    re();
                                                  });
                                                  Navigator.pop(context, 'OK');
                                                },
                                                child: const Text('ยืนยัน')),
                                          ],
                                        );
                                      });
                                }
                              },
                              child: Text('Submit'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formName.currentState != null) {
                                  formName.currentState!.reset();
                                  re();
                                }
                              },
                              child: Text('Reset'),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: formsearch,
              child: Container(
                width: 400,
                height: 200,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    TextFormField(
                      controller: searchname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกข้อมูลชื่อนามสกุล';
                        } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
                          return 'ชื่อนามสกุลไม่ถูกต้อง';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "ค้นหา ชื่อ-นามสกุล",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        searchName(searchname.text);
                      },
                      child: Text('ค้นหา'),
                    ),
                    Text('ชื่อ-นามสกุล $showname',
                        style: TextStyle(fontSize: 14)),
                    Text('อายุ $showage', style: TextStyle(fontSize: 14)),
                    Text('เบอร์โทร $shownum', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
