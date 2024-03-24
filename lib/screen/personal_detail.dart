// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:resume/globel.dart';

class Personal_Details extends StatefulWidget {
  const Personal_Details({super.key});

  @override
  State<Personal_Details> createState() => _Personal_DetailsState();
}

class _Personal_DetailsState extends State<Personal_Details> {
  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

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
                  SizedBox(
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
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.green,
                    child: Text(
                      'Personal Details',
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
                    // height: 600,
                    child: Form(
                      key: globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'DOB',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.dob = val!;
                              },
                              controller: dobController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  hintText: "DD/MM/YYYY",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            Text(
                              'Marital Status',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            // Radio Button .........
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    title: Text('Single'),
                                    // subtitle: Text('Status'),
                                    value: 'Single',
                                    groupValue: Global.maritalStatus,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.maritalStatus = val!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    title: Text('married'),
                                    // subtitle: Text('Status'),
                                    value: 'married',
                                    groupValue: Global.maritalStatus,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.maritalStatus = val!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Languages Known',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            const SizedBox(height: 20),
                            ...Global.lang.map((e) {
                              return CheckboxListTile(
                                controlAffinity:
                                ListTileControlAffinity.leading,
                                title: Text('${e['langName']}'),
                                value: e['isSelect'],
                                onChanged: (val) {
                                  setState(() {
                                    e['isSelect'] = val;
                                  });
                                },
                              );
                            }),
                            Text(
                              'Nationality',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Nationality ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.nationality = val!;
                              },
                              controller: nationalityController,
                              decoration: InputDecoration(
                                  hintText: "Indian",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        globalKey.currentState!.reset();

                                        dobController.clear();
                                        nationalityController.clear();

                                        Global.dob = '';
                                        Global.nationality = '';

                                        setState(() {});
                                      },
                                      child: const Text(
                                        "Clear",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          globalKey.currentState!.save();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              behavior:
                                              SnackBarBehavior.floating,
                                              content: Text('Saves done....'),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                          Navigator.of(context)
                                              .pushNamed('page4');
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              behavior:
                                              SnackBarBehavior.floating,
                                              content: Text(
                                                  'Pleas fill all Fields..'),
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