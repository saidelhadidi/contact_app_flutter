import 'dart:io';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'models/contacts_manager.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  File? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    // بنطلب منه يفتح الجاليري ويستنى (await) لحد ما اليوزر يختار
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // لو اليوزر اختار صورة فعلاً، بنعمل update للشاشة
      setState(() {
        selectedImage = File(image.path); // حولنا الصورة لملف وخزناها
      });
    }
  }

  void saveContact() {
    if (nameController.text.isNotEmpty &&
        mailController.text.isNotEmpty &&
        numberController.text.isNotEmpty) {
      ContactModel newContact = ContactModel(
        name: nameController.text,
        mail: mailController.text,
        number: numberController.text,
        image: selectedImage?.path ?? "",
      );

      Provider.of<ContactsManager>(
        context,
        listen: false,
      ).addContact(newContact);
      Navigator.pop(context);
    } else {
      showErrorDialog("Please fill all the data! 🚨");
      return;
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFF1D4),
          title: Text("Error ⚠️", style: TextStyle(color: Color(0xFF29384D))),
          content: Text(message, style: TextStyle(color: Color(0xFF29384D))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF29384D),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(40),
          right: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF29384D),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  spacing: 20,

                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFFFF1D4)),
                            borderRadius: BorderRadius.circular(28),
                          ),

                          child: selectedImage == null
                              ? Lottie.asset(
                                  "assets/animations/image_picker.json",
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameController.text.isEmpty
                                ? "User Name"
                                : nameController.text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,

                              color: Color(0xFFFFF1D4),
                            ),
                          ),
                          Divider(color: Color(0xFFFFF1D4)),
                          Text(
                            mailController.text.isEmpty
                                ? "example@email.com"
                                : mailController.text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFF1D4),
                            ),
                          ),
                          Divider(color: Color(0xFFFFF1D4)),
                          Text(
                            numberController.text.isEmpty
                                ? "+201000000000"
                                : numberController.text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFF1D4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,

                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      hintStyle: TextStyle(color: Color(0xFFE2F4F6)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,

                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: mailController,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Color(0xFFE2F4F6)),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: "Enter Phone",
                      hintStyle: TextStyle(color: Color(0xFFE2F4F6)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFF1D4),
                        foregroundColor: Color(0xFF29384D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        saveContact();
                      },
                      child: Text("Enter User", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
