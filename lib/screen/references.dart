// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resume/globel.dart';

class Refernces_Page extends StatefulWidget {
  const Refernces_Page({super.key});

  @override
  State<Refernces_Page> createState() => _Refernces_PageState();
}

class _Refernces_PageState extends State<Refernces_Page> {
  TextEditingController refNameController = TextEditingController();
  TextEditingController refDesiController = TextEditingController();
  TextEditingController refOrgController = TextEditingController();

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
                      'References',
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
            flex: 9,
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Container(
                // height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: SizedBox(
                    // height: 400,
                    child: Form(
                      key: globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'References Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Reference Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.refName = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Suresh Shah",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Designation',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            TextFormField(
                              controller: refDesiController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter designation ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.designation = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Marketing Manager, ID-342332",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Organization/Institute',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            TextFormField(
                              controller: refOrgController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Organization Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.orgInstName = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Green Energy Pvt. Ltd",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
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

                                        refNameController.clear();
                                        refDesiController.clear();
                                        refOrgController.clear();

                                        Global.refName = '';
                                        Global.designation = '';
                                        Global.orgInstName = '';

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
                                              .pushNamed('page10');
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