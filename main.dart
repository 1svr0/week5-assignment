import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Define a list of strings representing the cities in Rwanda
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
  // Define a variable to keep track of the currently selected city
  String selectedCity = 'Kigali';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rwandan Cities'),
      ),
      body: Column(
        children: [
          // DropdownButton is a pre-built widget that provides a dropdown menu
          DropdownButton<String>(
            value: selectedCity, // Set the initial value of the dropdown
            items: rwandaCities.map((String city) {
              return DropdownMenuItem<String>( // For each city in the list, create a dropdown menu item
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (String? newValue) { // When the user selects a new value from the dropdown, update the state
              setState(() {
                selectedCity = newValue!; // Set the selected city to the new value
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
