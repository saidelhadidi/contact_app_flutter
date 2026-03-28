import 'package:contact_app/add_contact_sheet.dart';
import 'package:contact_app/contact_card.dart';
import 'package:contact_app/models/app_assets.dart';
import 'package:contact_app/models/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'models/contacts_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

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
                    AppAssets.homeIcon,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Consumer<ContactsManager>(
              builder: (context, manager, child) {
                return Expanded(
                  child: manager.getContacts.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 80),
                            Lottie.asset(AppAssets.emptyListAnim),
                            Text(
                              AppStrings.noContacts,
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.6,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                            itemCount: manager.getContacts.length,
                            itemBuilder: (context, index) {
                              return ContactCard(
                                contact: manager.getContacts[index],
                                onDelete: () {
                                  manager.delete(index);
                                },
                              );
                            },
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Consumer<ContactsManager>(
        builder: (context, manager, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (manager.getContacts.isNotEmpty)
                FloatingActionButton(
                  backgroundColor: Color(0XFFF93E3E),
                  foregroundColor: Color(0XFFFFFFFF),
                  child: Icon(Icons.delete),
                  onPressed: () {
                    manager.deleteLast();
                  },
                ),
              SizedBox(height: 10),
              if (manager.getContacts.length < 6)
                FloatingActionButton(
                  backgroundColor: Color(0XFFFFF1D4),
                  foregroundColor: Color(0XFF29384D),
                  child: Icon(Icons.add, size: 35, color: Color(0XFF29384D)),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => AddContactSheet(),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
