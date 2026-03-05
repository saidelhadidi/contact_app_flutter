import 'package:flutter/cupertino.dart';

import 'contact_model.dart';

class ContactsManager extends ChangeNotifier {
  final List<ContactModel> _contacts = [];

  List<ContactModel> get getContacts {
    return _contacts;
  }

  void delete(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void deleteLast() {
    _contacts.removeLast();
    notifyListeners();
  }

  void addContact(ContactModel contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
