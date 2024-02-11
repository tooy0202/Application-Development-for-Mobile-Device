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
      home: const MyHomePage(title: 'ข้อที่ 2'),
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
  TextEditingController name = TextEditingController();
  TextEditingController num = TextEditingController();
  List<String> _name = [];
  List<String> _num = [];
  List<Color> colorGrid = [Colors.green, Colors.yellow, Colors.blue];

  @override
  Widget build(BuildContext context) {
    re() {
      setState(() {
        name.text = '';
        num.text = '';
      });
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
                height: 250,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกข้อมูลสินค้า';
                        } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
                          return 'ข้อมูลไม่ถูกต้อง';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "กรอกข้อมูลสินค้า",
                      ),
                    ),
                    TextFormField(
                      controller: num,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกราคาสินค้า';
                        } else if (!RegExp(r"^[0-9]").hasMatch(value)) {
                          return 'ราคาสินค้าไม่ถูกต้อง';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "ราคาสินค้า",
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
                                                    _name.add(name.text);
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
            Container(
              width: 400,
              height: 400,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(20),
                itemCount: _name.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: GridTile(
                        child: Container(
                          color: colorGrid[index],
                        ),
                        header: Text('สินค้าที่ ${index + 1}'),
                        footer: GridTileBar(
                          backgroundColor: Colors.black38,
                          title: Text(_name[index]),
                          subtitle: Text(_num[index]),
                          trailing: const Icon(Icons.shopping_cart),
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
