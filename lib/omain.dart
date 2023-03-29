import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kabbik/searchpage.dart';
import 'package:kabbik/main.dart';
//import 'dart:math';

import 'audios.dart';

// import 'searchpage.dart';
// import 'audios.dart';
// import 'audio_service.dart';
// import 'wmain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const AudiosPage(),
    );
  }
}

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0C1B3E),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Subscribe'),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
