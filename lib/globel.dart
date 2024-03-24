import 'dart:io';

import 'package:flutter/material.dart';

class Global {
  static String name = '';
  static String email = '';
  static String phonne = '';
  static String add1 = '';
  static String add2 = '';
  static String add3 = '';
  static String careerObj = '';
  static String currentDesignation = '';
  static File? imgPic;

  static String dob = '';
  static String maritalStatus = 'Single';
  static String nationality = '';

  static String courseDegree = '';
  static String schoolColIns = '';
  static String cgpa = '';
  static String passingYear = '';

  static String comName = '';
  static String sCI = '';
  static String roles = '';
  static bool EmployedStatus = true;
  static String joinDate = '';
  static String exitDate = '';
  static List<TextEditingController> Skills = [TextEditingController()];
  static String proTitle = '';
  static List<Map<String, dynamic>> technologiesList = [
    {
      'isSelect': false,
      'langName': 'Flutter',
    },
    {
      'isSelect': false,
      'langName': 'Java',
    },
    {
      'isSelect': false,
      'langName': 'Python',
    },
  ];
  static String proRoles = '';
  static String technologiesEx = '';
  static String proDesc = '';

  static List<TextEditingController> Achivements = [TextEditingController()];
  static String refName = '';
  static String designation = '';
  static String orgInstName = '';

  static String declarationDesc = '';
  static String date_decl = '';
  static String placeIntCity = '';

  static List<Map<String, dynamic>> lang = [
    {
      'isSelect': false,
      'langName': 'English',
    },
    {
      'isSelect': false,
      'langName': 'Hindi',
    },
    {
      'isSelect': false,
      'langName': 'Gujarati',
    },
  ];
}