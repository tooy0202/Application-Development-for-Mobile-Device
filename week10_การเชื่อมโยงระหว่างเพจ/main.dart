import 'package:flutter/material.dart';

class ItemList {
  String imageProfile = '';
  String profileName = '';
  String imageUrl = '';
  bool likeImage = false;
  String school = '';
  String schoolname = '';
  String role = '';
  String rolename = '';
  String age = '';
  String birthday = '';
  String height = '';
  String combatclass = '';

  ItemList({
    required this.imageProfile,
    required this.profileName,
    required this.imageUrl,
    required this.likeImage,
    required this.school,
    required this.role,
    required this.age,
    required this.birthday,
    required this.height,
    required this.combatclass,
    required this.schoolname,
    required this.rolename,
  });
}

List<ItemList> _itemList = [
  ItemList(
    imageProfile:
        'https://static.miraheze.org/bluearchivewiki/thumb/1/13/Saki_%28Swimsuit%29.png/266px-Saki_%28Swimsuit%29.png',
    profileName: 'Sorai Saki',
    imageUrl:
        'https://static.miraheze.org/bluearchivewiki/thumb/f/f3/Saki_%28Swimsuit%29_00.png/147px-Saki_%28Swimsuit%29_00.png',
    likeImage: false,
    role:
        'https://static.miraheze.org/bluearchivewiki/thumb/2/2b/Icon_role_support.png/50px-Icon_role_support.png',
    school:
        'https://static.miraheze.org/bluearchivewiki/thumb/5/5a/SRT.png/50px-SRT.png',
    age: '15',
    birthday: 'April 9',
    height: '161cm',
    combatclass: 'Striker',
    rolename: 'Support/Back',
    schoolname: 'SRT',
  ),
  ItemList(
    imageProfile:
        'https://static.miraheze.org/bluearchivewiki/thumb/2/24/Neru.png/266px-Neru.png',
    profileName: 'Mikamo Neru',
    imageUrl:
        'https://static.miraheze.org/bluearchivewiki/thumb/a/a2/Neru_00.png/217px-Neru_00.png',
    likeImage: false,
    role:
        'https://static.miraheze.org/bluearchivewiki/6/65/Icon_role_attacker.png',
    school:
        'https://static.miraheze.org/bluearchivewiki/thumb/2/2a/Millennium.png/50px-Millennium.png',
    age: '17',
    birthday: 'August 17',
    height: '146cm',
    combatclass: 'Striker',
    rolename: 'Attacker/Front',
    schoolname: 'Millennium',
  ),
  ItemList(
    imageProfile:
        'https://static.miraheze.org/bluearchivewiki/thumb/7/72/Ako.png/266px-Ako.png',
    profileName: 'Amau Ako',
    imageUrl:
        'https://static.miraheze.org/bluearchivewiki/thumb/9/9f/Ako_00.png/100px-Ako_00.png',
    likeImage: false,
    role:
        'https://static.miraheze.org/bluearchivewiki/thumb/2/2b/Icon_role_support.png/50px-Icon_role_support.png',
    school:
        'https://static.miraheze.org/bluearchivewiki/thumb/b/bd/Gehenna.png/50px-Gehenna.png',
    age: '17',
    birthday: 'December 22',
    height: '165cm',
    combatclass: 'Special',
    rolename: 'Support/Back',
    schoolname: 'Gehenna',
  ),
  ItemList(
    imageProfile:
        'https://static.miraheze.org/bluearchivewiki/thumb/b/b3/Kazusa.png/266px-Kazusa.png',
    profileName: 'Kyoyama Kazusa',
    imageUrl:
        'https://static.miraheze.org/bluearchivewiki/thumb/f/fe/Kazusa_00.png/180px-Kazusa_00.png',
    likeImage: false,
    role:
        'https://static.miraheze.org/bluearchivewiki/6/65/Icon_role_attacker.png',
    school:
        'https://static.miraheze.org/bluearchivewiki/thumb/9/9c/Trinity.png/50px-Trinity.png',
    age: '15',
    birthday: 'August 5',
    height: '155cm',
    combatclass: 'Striker',
    rolename: 'Attacker/Back',
    schoolname: 'Trinity',
  ),
  ItemList(
    imageProfile:
        'https://static.miraheze.org/bluearchivewiki/thumb/6/62/Kikyou.png/266px-Kikyou.png',
    profileName: 'Kiryuu Kikyou',
    imageUrl:
        'https://static.miraheze.org/bluearchivewiki/thumb/6/6c/Kikyou_00.png/172px-Kikyou_00.png',
    likeImage: false,
    role:
        'https://static.miraheze.org/bluearchivewiki/thumb/2/2b/Icon_role_support.png/50px-Icon_role_support.png',
    school:
        'https://static.miraheze.org/bluearchivewiki/thumb/3/36/Hyakkiyako.png/50px-Hyakkiyako.png',
    age: '16',
    birthday: 'August 8',
    height: '160cm',
    combatclass: 'Striker',
    rolename: 'Support/Back',
    schoolname: 'Hyakkiyako',
  ),
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueArchive',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
        brightness: Brightness.light,
      ),
      home: ProductPage(title: 'MomoTalk'),
    );
  }
}

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProductPage> createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 251, 151, 199),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _itemList[index];
              return GestureDetector(
                onTap: () async {
                  bool liked = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(item: item),
                    ),
                  );
                  if (liked != null) {
                    setState(() {
                      item.likeImage = liked;
                    });
                  }
                },
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(item.imageProfile),
                    ),
                    title: Text(
                      item.profileName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        item.likeImage ? Icons.favorite : Icons.favorite_border,
                        color: item.likeImage ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _itemList[index].likeImage =
                              !_itemList[index].likeImage;
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

class NextPage extends StatefulWidget {
  final ItemList item;

  const NextPage({Key? key, required this.item}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  late bool _liked;

  @override
  void initState() {
    super.initState();
    _liked = widget.item.likeImage;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _liked);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Next Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 251, 151, 199),
        ),
        body: Center(
          child: Container(
            height: 655,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 400,
                    child: Image.network(
                      widget.item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        child: Table(
                          children: [
                            const TableRow(
                              children: [
                                TableCell(
                                    child: Center(
                                        child: Text(
                                  'School',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                                TableCell(
                                    child: Center(
                                        child: Text(
                                  'Role',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                    child: Center(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        widget.item.school,
                                        width: 100,
                                        height: 100,
                                      ),
                                      Text(widget.item.schoolname),
                                    ],
                                  ),
                                )),
                                TableCell(
                                    child: Center(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        widget.item.role,
                                        width: 100,
                                        height: 100,
                                      ),
                                      Text(widget.item.rolename),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            //----------------------------
                            TableRow(
                              children: [
                                const TableCell(
                                    child: Center(
                                        child: Text(
                                  'Full Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                                TableCell(
                                    child: Center(
                                  child: Text(widget.item.profileName),
                                )),
                              ],
                            ),
                            //----------------------------
                            TableRow(
                              children: [
                                const TableCell(
                                    child: Center(
                                        child: Text(
                                  'Age',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                                TableCell(
                                    child: Center(
                                  child: Text(widget.item.age),
                                )),
                              ],
                            ),
                            //------------------------------
                            TableRow(
                              children: [
                                const TableCell(
                                    child: Center(
                                        child: Text(
                                  'Birthday',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                                TableCell(
                                    child: Center(
                                  child: Text(widget.item.birthday),
                                )),
                              ],
                            ),
                            //---------------------------
                            TableRow(
                              children: [
                                const TableCell(
                                    child: Center(
                                        child: Text(
                                  'Height',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                                TableCell(
                                    child: Center(
                                  child: Text(widget.item.height),
                                )),
                              ],
                            ),
                            //-----------------------------
                            TableRow(
                              children: [
                                const TableCell(
                                    child: Center(
                                        child: Text(
                                  'Combat Class',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                                TableCell(
                                    child: Center(
                                  child: Text(widget.item.combatclass),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _liked = !_liked;
            });
          },
          backgroundColor: Colors.white,
          child: Icon(
            _liked ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
