library digital_lcd;

import 'package:flutter/material.dart';
import 'hex_color.dart';
import 'digit_clipper.dart';

class Lcd {

  BuildContext context;
  Decoration defaultDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [HexColor("#A2AC89"), HexColor("#ABAE75")]));

  EdgeInsetsGeometry lcdMargin = EdgeInsets.only(top: 0, left: 0);
  EdgeInsetsGeometry lcdPadding = EdgeInsets.symmetric(horizontal: 0, vertical: 0);
  Color activeColor = Colors.black87.withOpacity(0.6);
  Color inactiveColor = Colors.black26.withOpacity(0.08);
  Map<String,Color> ust,ustSol,ustSag,alt,altSol,altSag,ustOrta,altOrta;

  Lcd(this.context){
    this.ust = {
      "1": inactiveColor,
      "2": activeColor,
      "3": activeColor,
      "4": inactiveColor,
      "5": activeColor,
      "6": activeColor,
      "7": activeColor,
      "8": activeColor,
      "9": activeColor,
      "0": activeColor,
      "":inactiveColor,
      "-":inactiveColor
    };
    this.ustSol = {
      "1": inactiveColor,
      "2": inactiveColor,
      "3": inactiveColor,
      "4": activeColor,
      "5": activeColor,
      "6": activeColor,
      "7": inactiveColor,
      "8": activeColor,
      "9": activeColor,
      "0": activeColor,
      "":inactiveColor,
      "-":inactiveColor
    };

    this.ustSag = {
      "1": activeColor,
      "2": activeColor,
      "3": activeColor,
      "4": activeColor,
      "5": inactiveColor,
      "6": inactiveColor,
      "7": activeColor,
      "8": activeColor,
      "9": activeColor,
      "0": activeColor,
      "":inactiveColor,
      "-":inactiveColor
    };
    this.ustOrta = {
      "1": inactiveColor,
      "2": activeColor,
      "3": activeColor,
      "4": activeColor,
      "5": activeColor,
      "6": activeColor,
      "7": inactiveColor,
      "8": activeColor,
      "9": activeColor,
      "0": inactiveColor,
      "":inactiveColor,
      "-":activeColor
    };
    this.altOrta = {
      "1": inactiveColor,
      "2": activeColor,
      "3": activeColor,
      "4": activeColor,
      "5": activeColor,
      "6": activeColor,
      "7": inactiveColor,
      "8": activeColor,
      "9": activeColor,
      "0": inactiveColor,
      "":inactiveColor,
      "-":activeColor
    };
    this.altSol = {
      "1": inactiveColor,
      "2": activeColor,
      "3": inactiveColor,
      "4": inactiveColor,
      "5": inactiveColor,
      "6": activeColor,
      "7": inactiveColor,
      "8": activeColor,
      "9": inactiveColor,
      "0": activeColor,
      "":inactiveColor,
      "-":inactiveColor
    };
    this.altSag = {
      "1": activeColor,
      "2": inactiveColor,
      "3": activeColor,
      "4": activeColor,
      "5": activeColor,
      "6": activeColor,
      "7": activeColor,
      "8": activeColor,
      "9": activeColor,
      "0": activeColor,
      "":inactiveColor,
      "-":inactiveColor
    };
    this.alt = {
      "1": inactiveColor,
      "2": activeColor,
      "3": activeColor,
      "4": inactiveColor,
      "5": activeColor,
      "6": activeColor,
      "7": inactiveColor,
      "8": activeColor,
      "9": activeColor,
      "0": activeColor,
      "":inactiveColor,
      "-":inactiveColor
    };

  }

  Widget Number({
    Decoration lcdDecoration,
    @required int number,
    int digitCount,
    double lcdWidth,
    double lcdHeight,
    EdgeInsetsGeometry lcdMargin,
    EdgeInsetsGeometry lcdPadding,
    double digitHorizontalMargin = 8,
    MainAxisAlignment digitAlignment = MainAxisAlignment.center,
    Color activeColor,
    Color inactiveColor,
    double scaleFactor = 1,
    double segmentWidth = 10,
    double segmentHeight = 1,
  }) {

    double digitSegmentWidth, digitSegmentHeight;
    List<int> numbers = number.toString().split('').map((num) => int.parse(num)).toList();


    if (lcdDecoration == null) {
      lcdDecoration = defaultDecoration;
    }
    if (activeColor == null) {
      activeColor = this.activeColor;
    }
    if (inactiveColor == null) {
      inactiveColor = this.inactiveColor;
    }
    if (lcdMargin == null) {
      lcdMargin = this.lcdMargin;
    }

    if (lcdPadding == null) {
      lcdPadding = this.lcdPadding;
    }

    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      digitSegmentWidth = ((lcdWidth * 0.5) - (lcdPadding.horizontal/2) )* scaleFactor;
      digitSegmentHeight = digitSegmentWidth* (segmentWidth / 100);
    } else {
      digitSegmentWidth =  (((lcdHeight !=null ? lcdWidth : lcdWidth / digitCount )  - (lcdPadding.horizontal/2) )) * scaleFactor;
      digitSegmentHeight = digitSegmentWidth * (segmentWidth / 100);
    }


    List<Widget> numberList = [];
    for (int i = 0; i < digitCount; i++) {
      String digitData;
      if(numbers.length + i >= digitCount ){
        digitData = numbers[i - (digitCount-numbers.length)].toString();
      }
      else{
        digitData = "";
      }
      numberList.add(
          Digit(
            elementH: digitSegmentHeight ,
            elementW: digitSegmentWidth * 0.49,
            digit: digitData,
            horizontalMargin: digitHorizontalMargin,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
          )
      );

    }
    return (Container(
        width: lcdWidth,
        height: lcdHeight,
        margin: lcdMargin,
        padding: lcdPadding,
        decoration: lcdDecoration,
        child: Row(
          mainAxisAlignment: digitAlignment,
          children: numberList,
        )));
  }

  Widget Digit(
      {double elementW,
      double elementH,
      Color inactiveColor,
      Color activeColor,
      String digit,
      double horizontalMargin}) {

    double vertical_elementW;
    double vertical_elementH;



    elementW -= horizontalMargin;

    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      elementW = elementW * 0.625;
      elementH = elementH * 0.6;
      vertical_elementW = elementW * 0.93; // change FOR Digit height
      vertical_elementH = elementH;
    } else {
      vertical_elementW = elementW * 0.9722;//change FOR Digit height
      vertical_elementH = elementH;
    }

    vertical_elementW -= elementW * 0.1; //change FOR Digit height

    return (Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin / 2 ),
      width: elementW,
      height: 2 * vertical_elementW ,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: RotatedBox(
              quarterTurns: 4,
              child: ClipPath(
                child: Container(
                  width: elementW,
                  height: elementH,
                  color: ust[digit],
                ),
                clipper: DigitClipper(),
              ),
            ),
            left: 0,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: ClipPath(
              child: Container(
                width: vertical_elementW,
                height: vertical_elementH,
                color: ustSol[digit],
              ),
              clipper: DigitClipper(),
            ),
          ),
          Positioned(
            child: RotatedBox(
              quarterTurns: 1,
              child: ClipPath(
                child: Container(
                  width: vertical_elementW,
                  height: vertical_elementH,
                  color: ustSag[digit],
                ),
                clipper: DigitClipper(),
              ),
            ),
            left: elementW - elementH,
          ),
          Positioned(
              child: RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  child: Container(
                    width: elementW,
                    height: elementH * 0.5,
                    color: ustOrta[digit],
                  ),
                  clipper: DigitClipper(),
                ),
              ),
              top: vertical_elementW - elementH * 0.5),
          Positioned(
              child: RotatedBox(
                quarterTurns: 4,
                child: ClipPath(
                  child: Container(
                    width: elementW,
                    height: elementH * 0.5,
                    color: altOrta[digit],
                  ),
                  clipper: DigitClipper(),
                ),
              ),
              top: vertical_elementW),
          Positioned(
            child: RotatedBox(
              quarterTurns: 3,
              child: ClipPath(
                child: Container(
                  width: vertical_elementW,
                  height: vertical_elementH,
                  color: altSol[digit],
                ),
                clipper: DigitClipper(),
              ),
            ),
            top: vertical_elementW,
          ),
          Positioned(
            child: RotatedBox(
              quarterTurns: 1,
              child: ClipPath(
                child: Container(
                  width: vertical_elementW,
                  height: vertical_elementH,
                  color: altSag[digit],
                ),
                clipper: DigitClipper(),
              ),
            ),
            top: vertical_elementW,
            left: elementW - elementH,
          ),
          Positioned(
            child: RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                child: Container(
                  width: elementW,
                  height: elementH,
                  color: alt[digit],
                ),
                clipper: DigitClipper(),
              ),
            ),
            top: 2 * vertical_elementW - elementH,
          ),
        ],
      ),
    ));
  }
}
