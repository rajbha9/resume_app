// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:resume/globel.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  bool isTrue = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController comNameController = TextEditingController();
  TextEditingController sCIController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  TextEditingController joinController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            height: 200,
            color: Colors.green,
            width: double.infinity,
            child: Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                      'Experiences',
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
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    height: 700,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Company Name',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Company Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.comName = val!;
                            },
                            onFieldSubmitted: (val) {},
                            controller: comNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "New Enterprise, San Francisco",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'School/College/Institute',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Role Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.sCI = val!;
                            },
                            onFieldSubmitted: (val) {},
                            keyboardType: TextInputType.text,
                            controller: sCIController,
                            decoration: InputDecoration(
                                hintText: "Quality Test Engineer",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Roles (optional)',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Roles Detail ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.roles = val!;
                            },
                            onFieldSubmitted: (val) {},
                            controller: rolesController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:
                              'Working with  team Memebers to come up with new concepts and product analysis... ',
                            ),
                            style: TextStyle(fontSize: 22),
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Employed Status',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Row(
                            children: [
                              // False
                              GestureDetector(
                                onTap: () {
                                  isTrue = false;
                                  Global.EmployedStatus = isTrue;
                                  setState(() {});
                                  // print(isTrue);
                                },
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        (isTrue == false)
                                            ? Icons.radio_button_checked_rounded
                                            : Icons.radio_button_off_rounded,
                                        size: 15,
                                        color: (isTrue == false)
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Previously\nEmployed',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: (isTrue == false)
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // True
                              GestureDetector(
                                onTap: () {
                                  isTrue = true;
                                  Global.EmployedStatus = isTrue;
                                  setState(() {});
                                  // print(isTrue);
                                },
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Icon(
                                        (isTrue == true)
                                            ? Icons.radio_button_checked_rounded
                                            : Icons.radio_button_off_rounded,
                                        size: 15,
                                        color: (isTrue == true)
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Currently\nEmployed',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: (isTrue == true)
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          (isTrue == false)
                              ? Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date Joined',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter Your Joining Date ...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.joinDate = val!;
                                      },
                                      onFieldSubmitted: (val) {},
                                      keyboardType:
                                      TextInputType.datetime,
                                      controller: joinController,
                                      decoration: InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          border: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(width: 1))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date Exit',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter Your Ending Date ...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.exitDate = val!;
                                      },
                                      onFieldSubmitted: (val) {},
                                      keyboardType:
                                      TextInputType.datetime,
                                      decoration: InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          border: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(width: 1))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                              : Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date Joined',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter Your Joining Date ...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.joinDate = val!;
                                      },
                                      controller: joinController,
                                      onFieldSubmitted: (val) {},
                                      keyboardType:
                                      TextInputType.datetime,
                                      decoration: InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          border: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(width: 1))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      globalKey.currentState!.reset();

                                      comNameController.clear();
                                      sCIController.clear();
                                      rolesController.clear();
                                      joinController.clear();
                                      endController.clear();

                                      Global.comName = '';
                                      Global.sCI = '';
                                      Global.roles = '';
                                      Global.joinDate = '';
                                      Global.exitDate = '';

                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
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
                                          .pushNamed('page6');
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
        ],
      ),
    );
  }
}