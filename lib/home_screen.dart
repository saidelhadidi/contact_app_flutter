import 'package:contact_app/add_contact_sheet.dart';
import 'package:contact_app/contact_card.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF29384D),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/home_icon.png",
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Expanded(
              child: contacts.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 80),
                        Lottie.asset('assets/animations/empty_list.json'),
                        Text(
                          "There is No Contacts Added Here",
                          style: TextStyle(
                            color: Color(0xFFFFF1D4),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          return ContactCard(
                            contact: contacts[index],

                            onDelete: () {
                              setState(() {
                                contacts.removeAt(index);
                              });
                            },
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              backgroundColor: Color(0XFFF93E3E),
              foregroundColor: Color(0XFFFFFFFF),
              child: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  contacts.removeLast();
                });
              },
            ),
          SizedBox(height: 10),
          if (contacts.length < 6)
            FloatingActionButton(
              backgroundColor: Color(0XFFFFF1D4),
              foregroundColor: Color(0XFF29384D),
              child: Icon(Icons.add, size: 35, color: Color(0XFF29384D)),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddContactSheet(
                    onAddContact: (newContact) {
                      setState(() {
                        contacts.add(newContact);
                      });
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
