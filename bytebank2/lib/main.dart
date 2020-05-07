import 'package:bytebank2/components/transaction_auth_dialog.dart';
import 'package:bytebank2/database/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:uuid/uuid.dart';


void main() {
  runApp(Bytebank2(contactDao: ContactDao()));
//  print(Uuid().v4());
}

class Bytebank2 extends StatelessWidget {

  final ContactDao contactDao;

  Bytebank2({@required this.contactDao});

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
      home: Dashboard(contactDao: contactDao),
    );

  }
}


