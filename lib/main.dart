import 'package:flutter/material.dart';
import 'package:resume/screen/spalesh.dart';
import 'screen/Contact_info.dart';
import 'screen/achievement.dart';
import 'screen/buildPage.dart';
import 'screen/carrier_objective.dart';
import 'screen/declaratoin.dart';
import 'screen/eductoin.dart';
import 'screen/experiences.dart';
import 'screen/pdf_page.dart';
import 'screen/personal_detail.dart';
import 'screen/project.dart';
import 'screen/references.dart';
import 'screen/technical_skills.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.green, secondary: Colors.green)),
      debugShowCheckedModeBanner: false,
      initialRoute: 'spalesh',
      routes: {
        '/': (context) => Homepage(),
        'spalesh': (context) => spaleshScreen(),
        'build': (context) => PageSecond(),
        'page1': (context) => Contact_Info(),
        'page2': (context) => Carrier_Objective(),
        'page3': (context) => Personal_Details(),
        'page4': (context) => Eduction(),
        'page5': (context) => Experiences(),
        'page6': (context) => Technical_Skills(),
        'page7': (context) => Projects_Page(),
        'page8': (context) => Achievements_Page(),
        'page9': (context) => Refernces_Page(),
        'page10': (context) => Declaration(),
        'pdf': (context) => Resume(),
      },
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.of(context).pushNamed('build');
          },
          child: Icon(Icons.add),
        ),
        // appBar: AppBar(
        //   elevation: 0,
        //   // backgroundColor: Colors.blue,
        // ),
        body: Column(
          children: [
            Container(
              height: 50,
              color: Colors.green,
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment(0, 0),
              child: Text("Resume Builder",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 75,
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(8),
              child: Text(
                "RESUMES",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Container(
              height: 75,
              width: 75,
              child: Image.asset(
                'img/one.png',
              ),
            ),
            Text(
              "No Resumes + Create new resume.",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
