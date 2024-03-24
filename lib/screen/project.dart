// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resume/globel.dart';

class Projects_Page extends StatefulWidget {
  const Projects_Page({super.key});

  @override
  State<Projects_Page> createState() => _Projects_PageState();
}

class _Projects_PageState extends State<Projects_Page> {
  TextEditingController proTitleController = TextEditingController();
  TextEditingController techController = TextEditingController();
  TextEditingController proRolesController = TextEditingController();
  TextEditingController proTechExController = TextEditingController();
  TextEditingController proDescController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            color: Colors.green,
            width: double.infinity,
            child: Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment(-1, 0.5),
                    height: 100,
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
                    height: 100,
                    color: Colors.green,
                    child: Text(
                      'Projects',
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
              alignment: Alignment.topCenter,
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: SizedBox(
                    // height: 750,
                    child: Form(
                      key: globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project Title',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project Title ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.proTitle = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proTitleController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Resume Builder App",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Technologies',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            ...Global.technologiesList.map((e) {
                              return CheckboxListTile(
                                controlAffinity:
                                ListTileControlAffinity.leading,
                                title: Text('${e['langName']}'),
                                value: e['isSelect'],
                                onChanged: (val) {
                                  setState(() {
                                    e['isSelect'] = val!;
                                  });
                                },
                              );
                            }),
                            SizedBox(height: 10),
                            Text(
                              'Roles (optional)',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project In Roles ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.proRoles = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proRolesController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                'Organize team members, Code Analysis',
                              ),
                              style: TextStyle(fontSize: 20),
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Technologies',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project In uses Lang...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.technologiesEx = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proTechExController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "5 - Programmers",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Projects Description',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project Description ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.proDesc = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proDescController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Enter Your Project Description",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(height: 15),
                            // Buttons ..................
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      globalKey.currentState!.reset();

                                      proTitleController.clear();
                                      proRolesController.clear();
                                      proTechExController.clear();
                                      proDescController.clear();

                                      Global.proTitle = '';
                                      Global.proDesc = '';
                                      Global.proDesc = '';

                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 100,
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
                                            .pushNamed('page8');
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
                              ],
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