import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  bool _showInputField = true;

  @override
  Widget build(BuildContext context) {
    if (_showInputField) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            PinCodeTextField(
              length: 6,
              appContext: context,
              autoFocus: true,
              backgroundColor: Colors.green,
              enableActiveFill: false,
              errorAnimationController: _errorController,
              keyboardAppearance: Brightness.dark,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: (newNumber) {
                if (newNumber.length == 6) {}
              },
            ),
            Spacer(),
            ElevatedButton(
                child: Text('HIDE'),
                onPressed: () {
                  setState(() {
                    _showInputField = !_showInputField;
                  });
                }),
            Spacer(),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('Hidden'),
        ),
      );
    }
  }
}
