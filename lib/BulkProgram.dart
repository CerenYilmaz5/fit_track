import 'package:flutter/material.dart';



class Bulkprogram{
  const Bulkprogram({
    required this.sparedDays,
  });

  final int sparedDays;

  static List<List<String>> TwoDayProgram = [
    ["Bench Press 3 x 10", "Dumbell Press 3x12", "Lat Pulldown(Wide Grip) 3x10", "Two handed Cable Row 3*12" ],
    ["Squat 5*12" , "Leg Extensions 4*15", "Hamstring Curl 3*15", "Calf Pushdowns 3*15"]
  ];

  static List<List<String>> ThreeDayProgram = [
    ["Bench Press 3 x 10", "Dumbell Press 3x12", "Cable Flies 3*15" ],
    ["Lat Pulldown(Wide Grip) 3x10","Machine Rows 3*10" ,"Two handed Cable Row 3*12"],
    ["Squat 5*12" , "Leg Extensions 4*15", "Hamstring Curl 3*15", "Calf Pushdowns 3*15"]
  ];

  static List<List<String>> FourDayProgram = [
    ["Bench Press 3 x 10", "Dumbell Press 3x12", "Cable Flies 3*15" ],
    ["Lat Pulldown(Wide Grip) 3x10","Machine Rows 3*10" ,"Two handed Cable Row 3*12"],
    ["Squat 5*12" , "Leg Extensions 4*15", "Hamstring Curl 3*15", "Calf Pushdowns 3*15"],
    ["Bicep Curls 3*10", "Cable Pushdowns 3*12"]
  ];

  static List<List<String>> FiveDayProgram = [
    ["Bench Press 3 x 10", "Dumbell Press 3x12", "Cable Flies 3*15" ],
    ["Lat Pulldown(Wide Grip) 3x10","Machine Rows 3*10" ,"Two handed Cable Row 3*12"],
    ["Squat 5*12" , "Leg Extensions 4*15"],
    ["Bicep Curls 3*10", "Cable Pushdowns 3*12"],
    ["Hamstring Curl 3*15", "Calf Pushdowns 3*15"]
  ];

  List<List<String>> getProgram(){
    switch (sparedDays){
      case 2:
        return TwoDayProgram;
      case 3:
        return ThreeDayProgram;
      case 4:
        return FourDayProgram;
      case 5:
        return FiveDayProgram;
      default:
        return [[]];
    }
  }


}