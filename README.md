![author](https://img.shields.io/badge/AUTHOR-EMRE%20UTKU%20UYGUC-red)
![author](https://img.shields.io/badge/CONTACT-emreuyguc@gmail.com-yellowgreen)
![author](https://img.shields.io/badge/-FLUTTER-blue)
![GitHub](https://img.shields.io/github/license/emreuyguc/Flutter_digital_lcd_widget)

# Flutter Digital Lcd Widget

Digital Lcd Style Widget For Numbers.

## About

With this plugin you can create digital lcd style number widgets.
Supports various phone sizes. Settings are available for a responsive design.

## Usage 

1. Installing

* Local
```dart
dependencies:
  digital_lcd:
    path: ../digital_lcd/
```
  
* Package
```dart
dependencies:
  digital_lcd: ^1.0.1
```

2. Import

```dart
import 'package:digital_lcd/digital_lcd.dart';
import 'package:digital_lcd/hex_color.dart';   //if you want use Hex Color codes this is required
```

3. Example

```dart
Lcd(context).Number(
    number: 1837837, //Your number variable
    digitHorizontalMargin:8 ,//Each time this value is increased, the digits are shrinks. default 8
    digitCount:10, //Each time this value is increased, the digits are shrinks for width.
    lcdPadding: EdgeInsets.symmetric(horizontal:0),//this value only provides spaces to the left and right of the numbers. it also reduces proportionally the numbers
    lcdMargin: EdgeInsets.only(top:50),
    digitAlignment: MainAxisAlignment.center, //if you have extra width, use it for better ui
    lcdWidth: MediaQuery.of(context).size.width,// numbers automatically fit to width by count of digit. if you only use this value, the height of the lcd is automatically adjusted
    lcdHeight:110 , // you may need to use scaleFactor if you use this value.
    scaleFactor :MediaQuery.of(context).size.height < MediaQuery.of(context).size.width ? 0.38: 0.2,//if you use lcdHeight , set this value for better ui
    segmentWidth : 10,// Thickness of each segment default 10 , best value range 5-12
    lcdDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [HexColor("#A2AC89"), HexColor("#ABAE75")]
                      )
                  ),
     activeColor: Colors.black87.withOpacity(0.6),
     inactiveColor: Colors.black26.withOpacity(0.08),
),

```
## Images
* Horizontal
![](https://i.ibb.co/Pj6ht32/aaa.png)


* Vertical
![](https://i.ibb.co/Khf6P0K/bbbb.png)
