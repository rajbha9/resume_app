// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume/globel.dart';

class Contact_Info extends StatefulWidget {
  const Contact_Info({super.key});

  @override
  State<Contact_Info> createState() => _Contact_InfoState();
}

class _Contact_InfoState extends State<Contact_Info> {
  bool isTrue = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController add3Controller = TextEditingController();
  TextEditingController picController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("Resume WorkSpace"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            child: Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTrue = false;
                            });
                          },
                          child: Text(
                            "Photo",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 5,
                          width: 218,
                          color:
                          (isTrue == false) ? Colors.yellow : Colors.blue,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTrue = true;
                            });
                          },
                          child: Text(
                            "Contact",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 5,
                          width: 205,
                          color: (isTrue == true) ? Colors.yellow : Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: (isTrue == true)
                ? Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          // Contact
                          Row(
                            children: [
                              Expanded(
                                  flex: 1, child: Icon(Icons.person)),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Name ...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.name = val!;
                                  },
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  decoration:
                                  InputDecoration(hintText: "Name"),
                                  onFieldSubmitted: (val) {},
                                ),
                              ),
                            ],
                          ),
                          //Mail
                          Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.mail)),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Email Address...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.email = val!;
                                  },
                                  controller: emailController,
                                  keyboardType:
                                  TextInputType.emailAddress,
                                  decoration:
                                  InputDecoration(hintText: "Email"),
                                  onFieldSubmitted: (val) {},
                                ),
                              ),
                            ],
                          ),
                          //Phone
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Icon(Icons.phone_android)),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Phone Number...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.phonne = val!;
                                  },
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration:
                                  InputDecoration(hintText: "Phone"),
                                  onFieldSubmitted: (val) {},
                                ),
                              ),
                            ],
                          ),
                          // Location 1
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(Icons.location_on),
                              ),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Address(Street or Building No)...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.add1 = val!;
                                  },
                                  controller: add1Controller,
                                  keyboardType:
                                  TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                      hintText:
                                      "Address (Street, Building No)"),
                                  onFieldSubmitted: (val) {},
                                ),
                              ),
                            ],
                          ),
                          // Location 2
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.transparent,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Address(City Name)...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.add2 = val!;
                                  },
                                  controller: add2Controller,
                                  keyboardType:
                                  TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                      hintText: "Address Line 2"),
                                  onFieldSubmitted: (val) {},
                                ),
                              ),
                            ],
                          ),
                          // Location 3
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.transparent,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Address(state name and Pin code)...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.add3 = val!;
                                  },
                                  controller: add3Controller,
                                  keyboardType:
                                  TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                      hintText: "Address Line 3"),
                                  onFieldSubmitted: (val) {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    globalKey.currentState!.reset();

                                    nameController.clear();
                                    phoneController.clear();
                                    emailController.clear();
                                    add1Controller.clear();
                                    add2Controller.clear();
                                    add3Controller.clear();

                                    Global.name = '';
                                    Global.phonne = '';
                                    Global.email = '';
                                    Global.add1 = '';
                                    Global.add2 = '';
                                    Global.add3 = '';

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
                                          .pushNamed('page2');
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
                : Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Form(
                    key: globalKey,
                    child: Container(
                      height: 280,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          (Global.imgPic != null)
                              ? CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                            FileImage(Global.imgPic!),
                          )
                              : CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blueGrey,
                              backgroundImage:
                              AssetImage('img/pic2.png')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.green,
                                onPressed: () async {
                                  final ImagePicker picker =
                                  ImagePicker();

                                  XFile? res = await picker.pickImage(
                                      source: ImageSource.camera);

                                  String? path = res!.path;
                                  // file = File(path);
                                  Global.imgPic = File(path);

                                  setState(() {
                                    print(Global.imgPic);
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.camera),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.green,
                                onPressed: () async {
                                  final ImagePicker picker =
                                  ImagePicker();

                                  XFile? res = await picker.pickImage(
                                      source: ImageSource.gallery);

                                  String? path = res!.path;
                                  Global.imgPic = File(path);
                                  setState(() {});
                                },
                                mini: true,
                                child: const Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}