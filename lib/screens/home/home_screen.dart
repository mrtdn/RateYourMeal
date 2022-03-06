import 'package:flutter/material.dart';

class RYM extends StatelessWidget {
  const RYM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rate Your Meal",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Comfortaa',
      ),
      home: const HomePage(title: 'Temp title'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
    );
  }
}
