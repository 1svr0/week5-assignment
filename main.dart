import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<String> rwandaCities = [
  'Kigali',
  'Butare',
  'Gitarama',
  'Ruhengeri',
  'Gisenyi'
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rwanda Cities',
      theme: ThemeData(
        primarySwatch: Color(0xfff36321),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCity = 'Kigali';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rwandan Cities'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedCity,
            items: rwandaCities.map((String city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCity = newValue!;
              });
            },
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: rwandaCities.map((String city) {
                return Card(
                  child: Center(
                    child: Text(
                      city,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
