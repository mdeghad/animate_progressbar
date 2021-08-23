import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animate_progress_button/animate_progress_button.dart';
import 'package:animate_progress_button/icon_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProgressButtonHomePage(title: 'Progress Button'),
    );
  }
}

class ProgressButtonHomePage extends StatefulWidget {
  ProgressButtonHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProgressButtonHomePageState createState() => _ProgressButtonHomePageState();
}

class _ProgressButtonHomePageState extends State<ProgressButtonHomePage> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;


  Widget buildTextWithIcon() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle:
        IconedButton(
          text: "Login",
          color: Color.fromRGBO(84, 157, 255, 1),
        icon: Icon(Icons.send, color: Colors.white,)),
      ButtonState.loading:
      IconedButton(text: "Loading", color: Color.fromRGBO(84, 157, 255, 1)),
      ButtonState.fail:
      IconedButton(
          color: Colors.blue),
      ButtonState.success: IconedButton(
          text: "",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Color.fromRGBO(84, 157, 255, 1))
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         //   buildCustomButton(),
            Container(
              height: 32,
            ),
            buildTextWithIcon(),
            Container(
              height: 32,
            ),
           // buildTextWithIconWithMinState(),
          ],
        ),
      ),
    );
  }

  void onPressedCustomButton() {
    setState(() {
      switch (stateOnlyText) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.fail;
          break;
        case ButtonState.success:
          stateOnlyText = ButtonState.idle;
          break;
        case ButtonState.fail:
          stateOnlyText = ButtonState.success;
          break;
      }
    });
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          });
        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }

  void onPressedIconWithMinWidthStateText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIconMinWidthState = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIconMinWidthState = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          });
        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIconMinWidthState = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIconMinWidthState = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIconMinWidthState = stateTextWithIconMinWidthState;
    });
  }
}