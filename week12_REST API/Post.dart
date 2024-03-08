import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  String _responseText = '';

  Future<void> postData() async {
    Map<String, dynamic> data = {
      'title': _titleController.text,
      'body': _bodyController.text,
      'userId': int.parse(_userIdController.text)
    };

    String jsonData = jsonEncode(data);

    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // ถ้าสำเร็จ
      setState(() {
        _responseText = 'Post successful! Response: ${response.body}';
      });
      print('Post successful! Response: ${response.body}');
    } else {
      // ถ้าไม่สำเร็จ
      setState(() {
        _responseText = 'Post failed! Response code: ${response.statusCode}';
      });
      print('Post failed! Response code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Post Data Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Enter Title'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'Enter Body'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _userIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter User ID'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  postData();
                },
                child: Text('Post Data'),
              ),
              SizedBox(height: 20),
              Text(_responseText),
            ],
          ),
        ),
      ),
    );
  }
}
