import 'package:flutter/material.dart';

import 'InternetConnection/InternetConnection.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InternetConnectionCheck(),
    );
  }
}
