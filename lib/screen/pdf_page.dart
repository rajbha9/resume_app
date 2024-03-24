/// Resume Design ....................

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume/globel.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final pdf = pw.Document();
  final image = pw.MemoryImage(
    Global.imgPic!.readAsBytesSync(),
  );

  @override
  void initState() {
    super.initState();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(
            height: 850,
            width: double.infinity,
            color: PdfColor.fromInt(0Xffd9166a),
            child: pw.Column(
              children: [
                // User pic,name,email
                pw.Container(
                  padding: pw.EdgeInsets.all(10),
                  margin: pw.EdgeInsets.all(5),
                  decoration: pw.BoxDecoration(
                      color: PdfColors.lightBlueAccent,
                      borderRadius: pw.BorderRadius.only(
                          topRight: pw.Radius.circular(30),
                          bottomLeft: pw.Radius.circular(30))),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // User Pic
                      pw.Align(
                        alignment: pw.Alignment(0, 0),
                        child: pw.Container(
                          height: 55,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(10)),
                          child: (Global.imgPic != null)
                              ? pw.Image(
                                  image,
                                  fit: pw.BoxFit.cover,
                                  // height: 80,
                                )
                              : pw.Image('img/pic.png' as pw.ImageProvider,
                                  fit: pw.BoxFit.cover, height: 80),
                        ),
                      ),
                      pw.SizedBox(
                        width: 35,
                      ),
                      // User Name & Email
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            Global.name ??
                                '', // ignore: dead_null_aware_expression
                            style: pw.TextStyle(
                                fontSize: 25,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.white),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Text(
                            Global.currentDesignation,
                            style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Container(
                            height: 1,
                            width: 200,
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    width: 1, color: PdfColors.black)),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Text(
                            '* ${Global.email}',
                            style: pw.TextStyle(fontSize: 14),
                          ),
                          pw.SizedBox(height: 5),
                        ],
                      ),
                    ],
                  ),
                ),
                //Bottom Part...................................
                pw.Container(
                  height: 500,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(
                        top: 10, bottom: 25, left: 5, right: 5),
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // Left Side Bar .......................................
                        pw.Expanded(
                          flex: 6,
                          child: pw.Container(
                            padding: pw.EdgeInsets.all(9),
                            height: 650,
                            width: double.infinity,
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.only(
                                  topLeft: pw.Radius.circular(50),
                                  bottomLeft: pw.Radius.circular(10)),
                              color: PdfColors.lightBlueAccent,
                            ),
                            child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(height: 10),
                                // Language
                                pw.Text(
                                  'Personal Details',
                                  style: pw.TextStyle(
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Mo : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Text(Global.phonne),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'DOB : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Text(Global.dob),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Marital Status : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Text(Global.maritalStatus),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Nationality : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Text(Global.nationality),
                                  ],
                                ),
                                pw.SizedBox(height: 10),
                                // Language
                                pw.Text(
                                  'Languages Known',
                                  style: pw.TextStyle(
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                ...Global.lang.map((e) {
                                  if (e['isSelect'] == true) {
                                    return pw.Text(' ${e['langName']}');
                                  } else {
                                    return pw.Container();
                                  }
                                }),
                                pw.SizedBox(height: 10),
                                // Education : ...........
                                pw.Text('Education',
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.white)),
                                pw.Text('Degree/Course : ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text(Global.courseDegree),
                                pw.Text('College : ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text(Global.schoolColIns),
                                pw.Row(
                                  children: [
                                    pw.Text('Per/CGPA : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.Text(Global.cgpa),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text('Passing Year : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.Text(Global.passingYear),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                // Skills....
                                pw.Text(
                                  'Skills',
                                  style: pw.TextStyle(
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                ...Global.Skills.map((e) {
                                  return (e.text != null)
                                      ? pw.Text(e.text)
                                      : pw.Container();
                                }),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Text(
                                  'Achievements',
                                  style: pw.TextStyle(
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                ...Global.Achivements.map((e) {
                                  return (e.text != null)
                                      ? pw.Text(e.text)
                                      : pw.Container();
                                }),
                                pw.SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Right Side Bar .......................................
                        pw.Expanded(
                          flex: 10,
                          child: pw.Container(
                            padding: pw.EdgeInsets.all(10),
                            width: double.infinity,
                            height: 650,
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.only(
                                  bottomRight: pw.Radius.circular(10)),
                              color: PdfColors.lightBlueAccent,
                            ),
                            child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                // Carrier Objective.................
                                pw.Text(
                                  'Carrier Objective',
                                  style: pw.TextStyle(
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(Global.careerObj),
                                // 'Historically, surnames evolved as a way to sort people into groups - by occupation, place of origin, clan affiliation, patronage, parentage, adoption, and even physical characteristics (like red hair). Many of the modern surnames in the dictionary can be traced back to Britain and Ireland.'),
                                pw.SizedBox(height: 10),
                                // Experience .........................
                                pw.Text(
                                  'Work Experience',
                                  style: pw.TextStyle(
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Starting : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Text(Global.joinDate),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    if (Global.EmployedStatus != true)
                                      pw.Row(
                                        children: [
                                          pw.Text(
                                            'Ending : ',
                                            style: pw.TextStyle(
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Text(Global.exitDate),
                                        ],
                                      )
                                    else
                                      pw.Container(),
                                  ],
                                ),
                                // Currently ..................
                                (Global.EmployedStatus == true)
                                    ? pw.Text(
                                        'Currently',
                                        style: pw.TextStyle(
                                            fontSize: 18,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.brown),
                                      )
                                    : pw.Container(),
                                pw.Text(
                                  Global.comName,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(
                                  Global.sCI,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(Global.roles),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Text(
                                  'Projects',
                                  style: pw.TextStyle(
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(
                                  'Project Title : ',
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  Global.proTitle,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.Text(
                                  'Technologies : ',
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                ...Global.technologiesList.map((e) {
                                  return pw.Text(
                                    e['langName'],
                                    style: pw.TextStyle(fontSize: 12),
                                  );
                                }),
                                pw.Text(
                                  'Roles : ',
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  Global.proRoles,
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.Text(
                                  'Project Desc : ',
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  Global.proDesc,
                                  style: pw.TextStyle(fontSize: 12),
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
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() async {
                  Directory? res = await getExternalStorageDirectory();

                  String path = res!.path;

                  File file = File('$path/resume.pdf');

                  await file.writeAsBytes(await pdf.save()).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        content: Text("Saved successfully"),
                      ),
                    );
                  });
                });
              },
              child: const Icon(Icons.download,color: Colors.black,),
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () async {
                Printing.layoutPdf(onLayout: (format) {
                  return pdf.save();
                });
              },
              child: const Icon(Icons.print,color: Colors.black),
            ),
          ],
        ),
        body: Container(
          height: 850,
          width: double.infinity,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // User pic,name,email
                Container(
                  height: 170,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Pic
                      Align(
                        alignment: Alignment(0, 0),
                        child: SizedBox(
                          height: 280,
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      // User Name & Email
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Global.name ??
                                '', // ignore: dead_null_aware_expression
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            Global.currentDesignation,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 1,
                            width: 200,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '* ${Global.email}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 25, left: 5, right: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Side Bar .......................................
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.all(9),
                          height: 650,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(10)),
                            color: Colors.amber,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              // Language
                              Text(
                                'Personal Details',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Mo : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(Global.phonne),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'DOB : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(Global.dob),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Marital Status : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(Global.maritalStatus),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Nationality : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(Global.nationality),
                                ],
                              ),
                              SizedBox(height: 10),
                              // Language
                              Text(
                                'Languages Known',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ...Global.lang.map((e) {
                                if (e['isSelect'] == true) {
                                  return Text(' ${e['langName']}');
                                } else {
                                  return Container();
                                }
                              }),
                              SizedBox(height: 10),
                              // Education : ...........
                              Text('Education',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70)),
                              Text('Degree/Course : ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(Global.courseDegree),
                              Text('College : ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(Global.schoolColIns),
                              Row(
                                children: [
                                  Text('Per/CGPA : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(Global.cgpa),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Passing Year : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(Global.passingYear),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // Skills....
                              Text(
                                'Skills',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ...Global.Skills.map((e) {
                                return (e.text != null)
                                    ? Text(e.text)
                                    : Container();
                              }),
                              // Text('1. C'),
                              // Text('2. C++'),
                              // Text('3. Java'),
                              // Text('4. PHP'),
                              // Text('5. Python'),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Achievements',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ...Global.Achivements.map((e) {
                                return (e.text != null)
                                    ? Text(e.text)
                                    : Container();
                              }),
                              // Text('1. C Certificate'),
                              // Text('2. C++ Certificate'),
                              // Text('3. Java Certificate'),
                              // Text('4. PHP Certificate'),
                              // Text('5. Python Certificate'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right Side Bar .......................................
                      Expanded(
                        flex: 10,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 650,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                            color: Colors.amber,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Carrier Objective.................
                              Text(
                                'Carrier Objective',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              Text(Global.careerObj),
                              // 'Historically, surnames evolved as a way to sort people into groups - by occupation, place of origin, clan affiliation, patronage, parentage, adoption, and even physical characteristics (like red hair). Many of the modern surnames in the dictionary can be traced back to Britain and Ireland.'),
                              SizedBox(height: 10),
                              // Experience .........................
                              Text(
                                'Work Experience',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Starting : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(Global.joinDate),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  if (Global.EmployedStatus != true)
                                    Row(
                                      children: [
                                        Text(
                                          'Ending : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(Global.exitDate),
                                      ],
                                    )
                                  else
                                    Container(),
                                ],
                              ),
                              // Currently ..................
                              (Global.EmployedStatus == true)
                                  ? Text(
                                      'Currently',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown),
                                    )
                                  : Container(),
                              Text(
                                Global.comName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Global.sCI,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(Global.roles),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Projects',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              Text(
                                'Project Title : ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Global.proTitle,
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Technologies : ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...Global.technologiesList.map((e) {
                                return Text(
                                  e['langName'],
                                  style: TextStyle(fontSize: 12),
                                );
                              }),
                              Text(
                                'Roles : ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Global.proRoles,
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Project Desc : ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Global.proDesc,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
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
    );
  }
}
