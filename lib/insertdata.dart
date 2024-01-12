import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
class InsData extends StatefulWidget {
  const InsData({super.key});

  @override
  State<InsData> createState() => _InsDataState();
}

class _InsDataState extends State<InsData> {
  @override
  Widget build(BuildContext context) {

    TextEditingController username = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController code = TextEditingController();
    TextEditingController number = TextEditingController();
    File? Profilepic;
    String DownloadUrl = '';


    void addinguser({String? imgurl})async {
      Map<String, dynamic> adduser = {

      'username': username.text,
      'age': age.text,
      'email': email.text,
      'code': code.text,
      'number': number.text,
        'User-Image': imgurl,
      };
      FirebaseFirestore.instance.collection('userdetails').add(adduser);

    }
    void registerUser() async{
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: code.text);

    }
    Future imageupload()async{
      UploadTask uploadTask = FirebaseStorage.instance.ref().child("User-Images").child(const Uuid().v1()).putFile(Profilepic!);
      TaskSnapshot taskSnapshot = await uploadTask;
      DownloadUrl = await taskSnapshot.ref.getDownloadURL();
      registerUser();
      addinguser(imgurl: DownloadUrl);

    }

    return Scaffold(
      body:
      Column(
        children: [
          Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: ()async{
                      XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(selectedImage!=null){
                        File convertedFile = File(selectedImage.path);
                        setState(() {
                          Profilepic=convertedFile;
                        });
                      }    else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("No Image Selected")));
                      }},
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: (Profilepic!=null)?FileImage(Profilepic!):null,
                    )
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "John",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: age,
                  decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "20",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "ac@gmail.com",
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: code,
                        decoration: InputDecoration(
                          labelText: "Country Code",
                          hintText: "+92",
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: number,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "123456789",
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    imageupload();
                    registerUser();
                    addinguser(imgurl: DownloadUrl);
                  },
                  child: Text("Send"),
                )
              ],
            ),
          ),
        ],
      )

    );

  }
}