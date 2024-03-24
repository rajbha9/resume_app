import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume/main.dart';

class spaleshScreen extends StatefulWidget {
  const spaleshScreen({super.key});

  @override
  State<spaleshScreen> createState() => _spaleshScreenState();
}


class _spaleshScreenState extends State<spaleshScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(height: 300,width: 300,child: Image.asset('img/handshake.png',color: Colors.white,)),
      ),
    );
  }
}
