import 'package:flutter/material.dart';
import 'package:flutter_material_search_app/city_search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FMS',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: CitySearch(),
    );
  }
}
