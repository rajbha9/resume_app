// ignore_for_file: camel_case_types, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:resume/globel.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _declarationState();
}

class _declarationState extends State<Declaration> {
  String genderVal = '';

  TextEditingController declController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool switchVal = false;

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
                      'Declaration',
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
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: SizedBox(
                  child: Form(
                    key: globalKey,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Declaration",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 20),
                                  ),
                                  Spacer(),
                                  Switch(
                                    value: switchVal,
                                    onChanged: (val) {
                                      setState(() {
                                        switchVal = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            (switchVal)
                                ? Container(
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment(-1, -1),
                                      child: Image(
                                        height: 70,
                                        image: AssetImage('img/1.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Add Description ...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.declarationDesc = val!;
                                      },
                                      onFieldSubmitted: (val) {},
                                      keyboardType:
                                      TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "Description",
                                          border: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(width: 1))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 1,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.grey)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Date',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Enter Date ...';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (val) {
                                                  Global.date_decl = val!;
                                                },
                                                onFieldSubmitted:
                                                    (val) {},
                                                controller:
                                                dateController,
                                                keyboardType:
                                                TextInputType
                                                    .datetime,
                                                decoration: InputDecoration(
                                                    hintText:
                                                    "DD/MM/YYYY",
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                            width:
                                                            1))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Place(Interview Venue/city)',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Enter Place ...';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (val) {
                                                  Global.placeIntCity =
                                                  val!;
                                                },
                                                onFieldSubmitted:
                                                    (val) {},
                                                keyboardType:
                                                TextInputType.text,
                                                decoration: InputDecoration(
                                                    hintText: "Eg. Surat",
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                            width:
                                                            1))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              globalKey.currentState!
                                                  .reset();

                                              declController.clear();
                                              dateController.clear();
                                              placeController.clear();

                                              Global.declarationDesc = '';
                                              Global.date_decl = '';
                                              Global.placeIntCity = '';

                                              setState(() {});
                                            },
                                            child: const Text(
                                              "Clear",
                                              style:
                                              TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (globalKey.currentState!
                                                  .validate()) {
                                                globalKey.currentState!
                                                    .save();

                                                ScaffoldMessenger.of(
                                                    context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    behavior:
                                                    SnackBarBehavior
                                                        .floating,
                                                    content: Text(
                                                        'Saves done....'),
                                                    backgroundColor:
                                                    Colors.green,
                                                  ),
                                                );
                                                Navigator.of(context)
                                                    .pushNamed('pdf');
                                              } else {
                                                ScaffoldMessenger.of(
                                                    context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    behavior:
                                                    SnackBarBehavior
                                                        .floating,
                                                    content: Text(
                                                        'Pleas fill all Fields..'),
                                                    backgroundColor: Colors
                                                        .deepOrangeAccent,
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text(
                                              "Finish",
                                              style:
                                              TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                                : SizedBox(
                              height: 1,
                              width: double.infinity,
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