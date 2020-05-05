import 'package:bytebank2/components/transaction_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:uuid/uuid.dart';


void main() {
  runApp(Bytebank2());
  print(Uuid().v4());
}

class Bytebank2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            accentColor: Colors.blueAccent[700],
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary,
            )
        ),
      home: Dashboard(),
    );

  }
}


