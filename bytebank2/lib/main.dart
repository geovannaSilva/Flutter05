import 'package:bytebank2/components/transaction_auth_dialog.dart';
import 'package:bytebank2/database/contact_dao.dart';
import 'package:bytebank2/webclients/transaction_webclient.dart';
import 'package:bytebank2/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:uuid/uuid.dart';


void main() {
  runApp(Bytebank2(
      contactDao: ContactDao(),
      transactionWebClient: TransactionWebClient(),
  ));
}

class Bytebank2 extends StatelessWidget {

  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  Bytebank2({
    @required this.contactDao,
    @required this.transactionWebClient,
  });

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      transactionWebClient: transactionWebClient,
      contactDao: contactDao,
      child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.green[900],
              accentColor: Colors.blueAccent[700],
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueAccent[700],
                textTheme: ButtonTextTheme.primary,
              )
          ),
        home: Dashboard(),
      ),
    );

  }
}


