import 'package:bytebank2/main.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:bytebank2/screens/contacts_list.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dashboard_widget_test.dart';
import 'matchers.dart';
import 'mocks.dart';

void main(){
  testWidgets('Should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    await tester.pumpWidget(Bytebank2(contactDao: mockContactDao));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
    expect(transferFeatureItem, findsOneWidget);
    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();

    final contactList = find.byType(ContactsList);
    expect(contactList, findsOneWidget);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final nameTextField = find.byWidgetPredicate((widget) {
      if(widget is TextField) {
        return widget.decoration.labelText == 'Full name';
      }
      return false;
    });
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Alex');

    final accountNumberTextField = find.byWidgetPredicate((widget) {
      if(widget is TextField) {
        return widget.decoration.labelText == 'Account number';
      }
      return false;
    });
    expect(accountNumberTextField, findsOneWidget);
    await tester.enterText(nameTextField, '1000');

    final createButton = find.widgetWithText(RaisedButton, 'Create');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);
  });
}
