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
  Future<List<dynamic>> fetchCountryData() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load country data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Countries API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Country Data'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchCountryData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Data loaded successfully
                final countryData = snapshot.data;
                return ListView.builder(
                  itemCount: countryData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final country = countryData[index];
                    return ListTile(
                      title: Text(country['name']['common']),
                      subtitle: Text(country['region']),
                      onTap: () {
                        // Add your onTap logic here
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
