// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:resume/globel.dart';

class Technical_Skills extends StatefulWidget {
  const Technical_Skills({super.key});

  @override
  State<Technical_Skills> createState() => _Technical_SkillsState();
}

class _Technical_SkillsState extends State<Technical_Skills> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int skillLimit = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.green,
            width: double.infinity,
            child: Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment(-1, 0.5),
                    height: 80,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('build');
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, 0.5),
                    height: 80,
                    color: Colors.green,
                    child: Text(
                      'Technical Skills',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              height: 500,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 620,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'Enter Your Skills',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            ...Global.Skills.map(
                                  (e) => Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: TextField(
                                        controller: e,
                                        decoration: InputDecoration(
                                          hintText: 'Enter hobby',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          skillLimit--;
                                          Global.Skills.remove(e);
                                          print('Remove : ${Global.Skills}');
                                        });
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ........................................
                            SizedBox(height: 20),
                            // Button Add ...........
                            ((skillLimit < 10) && (skillLimit > -1))
                                ? Padding(
                              padding: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    skillLimit++;
                                    Global.Skills.add(
                                        TextEditingController());
                                    print('Add : ${Global.Skills}');
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.green)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (globalKey.currentState!.validate()) {
                                      globalKey.currentState!.save();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text('Saves done....'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamed('page7');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                          Text('Pleas fill all Fields..'),
                                          backgroundColor:
                                          Colors.deepOrangeAccent,
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}