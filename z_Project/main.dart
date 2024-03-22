import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class calculatMain {
  String name = '';
  String urlpic = '';
  String pageName = '';
  calculatMain(
      {required this.name, required this.urlpic, required this.pageName});
}

List<calculatMain> _itemlist = [
  calculatMain(
    name: 'สี่เหลี่ยมจัตุรัส',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069410119614614/D8EiuBeHeamAAAAABJRU5ErkJggg.png?ex=660d992f&is=65fb242f&hm=8168c7a472ea73940287975ecf3792d1acd641a0ee55f06173b0fb55b2da1930&=&format=webp&quality=lossless',
    pageName: 'square',
  ),
  calculatMain(
    name: 'สี่เหลี่ยมผืนผ้า',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069525119172668/wnqRvjJLHgAAAAASUVORK5CYII.png?ex=660d994a&is=65fb244a&hm=05950e901342c14c276fd557e4b139420ab5440e4a283128b4d54c9809f5c139&=&format=webp&quality=lossless',
    pageName: 'rectangle',
  ),
  calculatMain(
    name: 'สี่เหลี่ยมด้านขนาน',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069638474563604/FEABFGATAQx8NmkEloECKIACKIACsymAgTburhvFEABFEABFGATAQx8NmkEloECKIACKIACsymAgTburhvFEABFEABFGATAQx8NmkEloECKIACKIACsymAgTburhvFEABFEABFGATAQx8NmkEloECKIACKIACsymAgTburhvFEABFEABFGATAQx8NmkEloECKIACKIACsymAgTburhvFEABFEABFGATAQx8NmkEloECKIACKIACsynwH6oUq8ffZqgCAAAAAElFTkSuQmCC.png?ex=660d9965&is=65fb2465&hm=cfaaf65f5756be852fa416c0dcf16e606d978ba88890817536eece0c75dc4cd1&=&format=webp&quality=lossless',
    pageName: 'parallelogram',
  ),
  calculatMain(
    name: 'สามเหลี่ยมมุมฉาก',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069281782567053/U32qgXy0ACSAAJ6DIBFHe63DtoGxJAAkgACSABJIAExkgAxd0YgeHpSAAJIAEkgASQABLQZQIo7nS5d9A2JIAEkAASQAJIAAmMkQCKuzECw9ORABJAAkgACSABJKDLBFDc6XLvoG1IAAkgASSABJAAEhgjARR3YwSGpyMBJIAEkAASQAJIQJcJoLjT5d5B25AAEkACSAAJIAEkMEYCKO7GCAxPRwJIAAkgASSABJCALhNAcafLvYO2IQEkgASQABJAAkhgjARQ3I0RGJ6OBJAAEkACSAAJIAFdJoDiTpd7B21DAkgACSABJIAEkMAYCaC4GyMwPB0JIAEkgASQABJAArpMAMWdLvcO2oYEkAASQAJIAAkggTESQHE3RmB4OhJAAkgACSABJIAEdJkAijtd7h20DQkgASSABJAAEkACYySA4m6MwPB0JIAEkAASQAJIAAnoMgEUd7rcO2gbEkACSAAJIAEkgATGSADF3RiB4elIAAkgASSABJAAEt..png?ex=660d9910&is=65fb2410&hm=44c446a9b489fccaf2533baa6e1175e64f11e27d8657d98b6ea9f5b2e4c5f40f&=&format=webp&quality=lossless',
    pageName: 'right_triangle',
  ),
  calculatMain(
    name: 'สามเหลี่ยมมุมแหลม',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069764546822206/csMOUcAAAAABJRU5ErkJggg.png?ex=660d9983&is=65fb2483&hm=1fd62663c3eaf875782251ad118966b04d96f70679371f97bdc555c2cd8a4be1&=&format=webp&quality=lossless',
    pageName: 'acute_triangle',
  ),
  calculatMain(
    name: 'สามเหลี่ยมมุมป้าน',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220070073318768701/3vDTi4wNd5YAAAAASUVORK5CYII.png?ex=660d99cd&is=65fb24cd&hm=bf5c1dde84d1b539bf55b3039037ca836683ef9b34181b6476bec99817690d92&=&format=webp&quality=lossless',
    pageName: 'obtuse_triangle',
  ),
  calculatMain(
    name: 'วงกลม',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069890791047370/AVxxp78P0QIkgASQABLIIgIo3FnkbDQVCSABJIAE0p8ACnf6xAtQAJIAAkggSwigMKdRc5GU5EAEkACSCD9CaBwp78P0QIkgASQABLIIgIo3FnkbDQVCSABJIAE0p8ACnf6xAtQAJIAAkggSwigMKdRc5GU5EAEkACSCD9CaBwp78P0QIkgASQABLIIgIo3FnkbDQVCSABJIAE0p8ACnf6xAtQAJIAAkggSwigMKdRc5GU5EAEkACSCD9CaBwp78P0QIkgASQABLIIgIo3FnkbDQVCSABJIAE0p8ACnf6xAtQAJIAAkggSwigMKdRc5GU5EAEkACSCD9CaBwp78P0QIkgASQABLIIgIo3FnkbDQVCSABJIAE0p8ACnf6xAtQAJIAAkggSwigMKdRc5GU5EAEkACSCD9CfwfM8pebon3QboAAAAASUVORK5CYII.png?ex=660d99a1&is=65fb24a1&hm=d354c9db6dedf036baee60637dbd95246b10b3f204a238c5823fd83830fab117&=&format=webp&quality=lossless',
    pageName: 'circle',
  ),
  calculatMain(
    name: 'หกเหลี่ยม',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220070235554713601/heFF8pTdDz8eAAAAABJRU5ErkJggg.png?ex=660d99f3&is=65fb24f3&hm=31a1ad0f44d4791464f4b3881bca8dc524fc5b4af3516c04e1a4b8db4bb0e4cc&=&format=webp&quality=lossless',
    pageName: 'hexagon',
  ),
  calculatMain(
    name: 'แปดเหลี่ยม',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220070149344858294/JoAJYAKYwIQlgEV8wroeVxwTwAQwAUxA3gn8P1RuzgBoRFp3AAAAAElFTkSuQmCC.png?ex=660d99df&is=65fb24df&hm=51e5ade72c56563070c3e4bba9d192be1136b3efcac5e7800ae453ddca098e25&=&format=webp&quality=lossless',
    pageName: 'octagon',
  ),
  calculatMain(
    name: 'สิบสองเหลี่ยม',
    urlpic:
        'https://media.discordapp.net/attachments/813453780011319337/1220069987830464562/wPJrlPvt795gAAAABJRU5ErkJggg.png?ex=660d99b8&is=65fb24b8&hm=8ccebb965bf66a1b4d3e59fa76be96ce3c22393b33ec69f15f465f76821ae6f1&=&format=webp&quality=lossless',
    pageName: 'dodecagon',
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // เปลี่ยน MaterialApp เป็น GetMaterialApp
      title: 'คำนวณพื้นที่รูปทรงเลขขาคณิต',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          backgroundColor: Color.fromARGB(
              255, 255, 255, 255), // กำหนดสีพื้นหลังของแอปพลิเคชัน
          // คุณยังสามารถกำหนดสีอื่น ๆ เช่น primary, secondary ได้ตามต้องการ
        ),
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      initialRoute: '/', // กำหนดเส้นทางเริ่มต้นของแอปพลิเคชัน
      //getPages เพื่อกำหนดเส้นทางของแอปพลิเคชันและหน้าที่เกี่ยวข้องกับแต่ละเส้นทาง และเรียกใช้งานฟังก์ชัน
      //Get.toNamed() เพื่อเปลี่ยนไปยังหน้าต่างๆ ในแอปพลิเคชัน
      getPages: [
        GetPage(
          name: '/',
          page: () => MainPage(),
        ),
        GetPage(
          name: '/square',
          page: () => CalculationPage(
            shapeName: 'สี่เหลี่ยมจัตุรัส',
            formula: 'square',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'square')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/rectangle',
          page: () => CalculationPage(
            shapeName: 'สี่เหลี่ยมผืนผ้า',
            formula: 'rectangle',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'rectangle')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/parallelogram',
          page: () => CalculationPage(
            shapeName: 'สี่เหลี่ยมด้านขนาน',
            formula: 'parallelogram',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'parallelogram')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/right_triangle',
          page: () => CalculationPage(
            shapeName: 'สามเหลี่ยมมุมฉาก',
            formula: 'right_triangle',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'right_triangle')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/acute_triangle',
          page: () => CalculationPage(
            shapeName: 'สามเหลี่ยมมุมแหลม',
            formula: 'acute_triangle',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'acute_triangle')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/obtuse_triangle',
          page: () => CalculationPage(
            shapeName: 'สามเหลี่ยมมุมป้าน',
            formula: 'obtuse_triangle',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'obtuse_triangle')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/circle',
          page: () => CalculationPage(
            shapeName: 'วงกลม',
            formula: 'circle',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'circle')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/hexagon',
          page: () => CalculationPage(
            shapeName: 'หกเหลี่ยม',
            formula: 'hexagon',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'hexagon')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/octagon',
          page: () => CalculationPage(
            shapeName: 'แปดเหลี่ยม',
            formula: 'octagon',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'octagon')
                .urlpic,
          ),
        ),
        GetPage(
          name: '/dodecagon',
          page: () => CalculationPage(
            shapeName: 'สิบสองเหลี่ยม',
            formula: 'dodecagon',
            imageUrl: _itemlist
                .firstWhere((item) => item.pageName == 'dodecagon')
                .urlpic,
          ),
        ),
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 17, 0, 255),
          highlightColor: const Color.fromARGB(255, 206, 23, 23),
          child: Text(
            'คำนวณพื้นที่รูปทรงเลขขาคณิต',
            style: TextStyle(
                fontSize: 18, fontFamily: GoogleFonts.kanit().fontFamily),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _itemlist.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCard(context, _itemlist[index]);
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, calculatMain item) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/${item.pageName}',
            arguments: {
              'shapeName': item.name,
              'formula': item.pageName,
              'imageUrl': item.urlpic,
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              item.urlpic,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              item.pageName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontFamily: GoogleFonts.kanit().fontFamily),
            ),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontFamily: GoogleFonts.kanit().fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculationPage extends StatefulWidget {
  final String shapeName;
  final String formula;
  final String imageUrl;

  CalculationPage({
    required this.shapeName,
    required this.formula,
    required this.imageUrl,
  });

  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  TextEditingController sideController = TextEditingController();
  TextEditingController baseController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController radiusController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double result = 0.0;

  void _calculateArea() {
    setState(() {
      switch (widget.formula) {
        case 'square': //สี่เหลี่ยมจัตุรัส
          double side = double.tryParse(sideController.text) ?? 0.0;
          if (side <= 0) {
            result = 0.0;
            return;
          }
          result = side * side;
          break;
        case 'rectangle': //สี่เหลี่ยมผืนผ้า
        case 'parallelogram': //สี่เหลี่ยมด้านขนาน
          double base = double.tryParse(baseController.text) ?? 0.0;
          double height = double.tryParse(heightController.text) ?? 0.0;
          if (base <= 0 || height <= 0) {
            result = 0.0;
            return;
          }
          result = base * height;
          break;
        case 'right_triangle': //สามเหลี่ยมมุมฉาก
        case 'acute_triangle': //สามเหลี่ยมมุมแหลม
        case 'obtuse_triangle': //สามเหลี่ยมมุมป้าน
          double base = double.tryParse(baseController.text) ?? 0.0;
          double height = double.tryParse(heightController.text) ?? 0.0;
          if (base <= 0 || height <= 0) {
            result = 0.0;
            return;
          }
          result = 0.5 * base * height;
          break;
        case 'circle': //วงกลม
          double radius = double.tryParse(radiusController.text) ?? 0.0;
          if (radius <= 0) {
            result = 0.0;
            return;
          }
          result = 3.14 * radius * radius;
          break;
        case 'hexagon': // คำนวณพื้นที่ของหกเหลี่ยม
        case 'octagon': // คำนวณพื้นที่ของแปดเหลี่ยม
        case 'dodecagon': // คำนวณพื้นที่ของสิบสองเหลี่ยม
          double side = double.tryParse(sideController.text) ?? 0.0;
          if (side <= 0) {
            result = 0.0;
            return;
          }
          if (widget.formula == 'hexagon') {
            result = (3 * sqrt(3) / 2) * pow(side, 2);
          } else if (widget.formula == 'octagon') {
            result = 2 * (1 + sqrt(2)) * pow(side, 2);
          } else if (widget.formula == 'dodecagon') {
            result = 3 * (sqrt(3) + 2 * sqrt(2)) * pow(side, 2);
          }
          break;
        default:
          result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String heightTOwidth = '';
    String longTObase = '';
    if (widget.formula == 'rectangle') {
      heightTOwidth = 'กว้าง';
    } else {
      heightTOwidth = 'ความสูง';
    }
    if (widget.formula == 'rectangle') {
      longTObase = 'ยาว';
    } else {
      longTObase = 'ฐาน';
    }
    // สร้าง Widget สำหรับแสดงรูปภาพ
    Widget imageWidget = widget.imageUrl.isNotEmpty
        ? Image.network(
            widget.imageUrl,
            width: 500,
            height: 400,
          )
        : SizedBox.shrink();
    ; // ถ้าไม่มี URL ของรูปภาพ ให้ใช้ SizedBox.shrink() เพื่อไม่แสดงอะไร

    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวณพื้นที่ ${widget.shapeName}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'สูตรคำนวณ: ${widget.formula}',
                    style: TextStyle(fontSize: 18),
                  ),
                  imageWidget,
                  SizedBox(height: 20),
                  if (widget.formula == 'rectangle' ||
                      widget.formula == 'parallelogram' ||
                      widget.formula == 'right_triangle' ||
                      widget.formula == 'acute_triangle' ||
                      widget.formula == 'obtuse_triangle') ...[
                    TextFormField(
                      controller: baseController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกข้อมูลให้ครบ';
                        } else if (double.tryParse(value) == null ||
                            double.parse(value) < 1) {
                          return 'กรุณากรอกข้อมูลให้ถูกต้อง';
                        }
                        return null; // คืนค่า null เมื่อข้อมูลถูกต้อง
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: longTObase),
                    ),
                    TextFormField(
                      controller: heightController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกข้อมูลให้ครบ';
                        } else if (double.tryParse(value) == null ||
                            double.parse(value) < 1) {
                          return 'กรุณากรอกข้อมูลให้ถูกต้อง';
                        }
                        return null; // คืนค่า null เมื่อข้อมูลถูกต้อง
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: heightTOwidth),
                    ),
                  ],
                  if (widget.formula == 'square' ||
                      widget.formula == 'hexagon' ||
                      widget.formula == 'octagon' ||
                      widget.formula == 'dodecagon') ...[
                    TextFormField(
                      controller: sideController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกข้อมูลให้ครบ';
                        } else if (double.tryParse(value) == null ||
                            double.parse(value) < 1) {
                          return 'กรุณากรอกข้อมูลให้ถูกต้อง';
                        }
                        return null; // คืนค่า null เมื่อข้อมูลถูกต้อง
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'ด้าน'),
                    ),
                  ],
                  if (widget.formula == 'circle') ...[
                    TextFormField(
                      controller: radiusController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกข้อมูลให้ครบ';
                        } else if (double.tryParse(value) == null ||
                            double.parse(value) < 1) {
                          return 'กรุณากรอกข้อมูลให้ถูกต้อง';
                        }
                        return null; // คืนค่า null เมื่อข้อมูลถูกต้อง
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'รัศมี'),
                    ),
                  ],
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculateArea();
                      }
                    },
                    child: Text('คำนวณ'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'พื้นที่: $result',
                    style: TextStyle(fontSize: 20),
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
