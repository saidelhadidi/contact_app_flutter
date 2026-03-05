import 'package:contact_app/home_screen.dart';
import 'package:contact_app/models/contacts_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ContactsManager(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {HomeScreen.routeName: (context) => HomeScreen()},
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
