import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 10, left: 60, right: 60),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
                labelText: 'Enter Number',
                hintText: 'Enter Your Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 10, left: 60, right: 60),
          child: TextField(
            controller: pass,
            decoration: InputDecoration(
                labelText: 'Enter Number',
                hintText: 'Enter Your Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                final credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.text, password: pass.text)
                    .then((value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Login success')));
                });
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No user found for that email.')));
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Wrong password provided for that user.')));
                }
              }
            },
            child: Text('login'))
      ]),
    );
  }
}
