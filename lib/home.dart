import 'dart:io';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  // final vrref = FirebaseDatabase.instance.ref();
  final storage = FirebaseStorage.instance.ref();

  final ImagePicker picker = ImagePicker();
  String? id;
  String imagepath = "";
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Container(
        //     margin: EdgeInsets.all(10), child: TextField(controller: email)),
        // Container(
        //     margin: EdgeInsets.all(10), child: TextField(controller: pass)),
        // ElevatedButton(onPressed: ()  async {
        //
        //
        //   try {
        //     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //       email: email.text,
        //       password: pass.text,
        //     ).then((value){
        //
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register success')));
        //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        //         return Home();
        //       },));
        //     });
        //   } on FirebaseAuthException catch (e) {
        //     if (e.code == 'weak-password') {
        //       print('The password provided is too weak.');
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The password provided is too weak.')));
        //
        //     } else if (e.code == 'email-already-in-use') {
        //       print('The account already exists for that email.');
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The account already exists for that email.')));
        //
        //     }
        //   } catch (e) {
        //     print(e);
        //   }
        // }, child: Text('Register')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Material(
                        child: CupertinoAlertDialog(
                          insetAnimationCurve: Curves.linear,
                          insetAnimationDuration: Duration(seconds: 3),
                          title: Text('pick your image'),
                          actions: [
                            IconButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    imagepath = image!.path;
                                  });
                                },
                                icon: Icon(CupertinoIcons.photo)),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: imagepath != ''
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(imagepath)),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.yellowAccent,
                      )),
          ],
        ),
        Container(margin: EdgeInsets.all(20),
            child: TextField(
                controller: name,
            decoration: InputDecoration(
                labelText: 'Enter Name',
                hintText: 'Enter Your Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
               FirebaseDatabase database = FirebaseDatabase.instance;
              String imge = "rvimage.${Random().nextInt(10000)}.jpg";
              final spaceRef = storage.child("vrushabh/$imge");
              await spaceRef.putFile(File(imagepath));
               // final event = await vrref.once(DatabaseEventType.value);
               // final event2 = await vrref.;

              await spaceRef.getDownloadURL().then((value) async {
                DatabaseReference ref = FirebaseDatabase.instance.ref("Rana").push();
                id = ref.key;
                await ref.set({
                  "id": id,
                  "name": name.text,
                  "imag": value,
                });
              });
            },
            child: Text('Add image in Database'))
      ]),
    );
  }
}
////////
// ElevatedButton(
// onPressed: () async {
// FirebaseDatabase database = FirebaseDatabase.instance;
// final storage = FirebaseStorage.instance.ref();
// String imageee = "ddimg.${Random().nextInt(1000)}.jpg";
// final spaceRef = storage.child("images/space.jpg");
// await spaceRef.putFile(File(imagepath));
// await spaceRef.getDownloadURL().then((value) async {
// DatabaseReference ref =
// FirebaseDatabase.instance.ref("MYTIME").push();
// id = ref.key;
// await ref.set({
// "id": id,
// "name": "darshan",
// "img": value,
// });
// });
// },
// child: Center(child: Text('ADD IMAGE'))),
//////