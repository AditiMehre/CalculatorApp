import 'dart:ui';
import 'package:flutter/material.dart';
class PastelColors {
  static const Color pastelPink = Color(0xFFFFC0CB); // A soft pink
  static const Color pastelOrange = Color(0xFFFFDAB9); // A soft orange
  static const Color pastelYellow = Color(0xFFFFFFE0); // A soft yellow
  static const Color pastelGreen = Color(0xFFBFD8B8); // A soft green
  static const Color pastelBlue = Color(0xFFAEC6CF); // A soft blue
  static const Color pastelPurple = Color(0xFFD1B3C4); // A soft purple
  static const Color pastelRed = Color(0xFFF9A1B3); // A soft red
  static const Color pastelGrey = Color(0xFFCFCFC4); // A soft grey
  static const Color pastelBrown = Color(0xFFC6A664); // A soft brown
  // Additional pastel colors for numbers
  static const Color pastelOne = Color(0xFFAFF8D8); // Number 1
  static const Color pastelTwo = Color(0xFFDBBADD); // Number 2
  static const Color pastelThree = Color(0xFFB2CEFE); // Number 3
  static const Color pastelFour = Color(0xFFFBCB8F); // Number 4
  static const Color pastelFive = Color(0xFFFAE3D9); // Number 5
  static const Color pastelSix = Color(0xFFBBDED6); // Number 6
  static const Color pastelSeven = Color(0xFF8AC6D1); // Number 7
  static const Color pastelEight = Color(0xFFCCABD8); // Number 8
  static const Color pastelNine = Color(0xFF97C1A9); // Number 9
  static const Color pastelZero = Color(0xFFD3E0EA); // Number 0
}

  final Map<String, Color> buttonColors = {
    'D': PastelColors.pastelPink,
    'C': PastelColors.pastelOrange,
    '%': PastelColors.pastelYellow,
    '×': PastelColors.pastelGreen,
    '÷': PastelColors.pastelBlue,
    '+': PastelColors.pastelPurple,
    '-': PastelColors.pastelRed,
    '=': PastelColors.pastelGrey,
    '.': PastelColors.pastelBrown,
    '1': PastelColors.pastelOne,
    '2': PastelColors.pastelTwo,
    '3': PastelColors.pastelThree,
    '4': PastelColors.pastelFour,
    '5': PastelColors.pastelFive,
    '6': PastelColors.pastelSix,
    '7': PastelColors.pastelSeven,
    '8': PastelColors.pastelEight,
    '9': PastelColors.pastelNine,
    '0': PastelColors.pastelZero,
  };