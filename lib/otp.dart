import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class otp extends StatefulWidget {
  String vid;
   otp(this.vid);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  String sms = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OTPTextField(
              length: 6,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fieldWidth: 50,
              style: TextStyle(
                  fontSize: 10
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) async {
                print("Completed: " + pin);
                setState(() {
                  sms = pin;
                });
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              String smsCode =sms;

              // Create a PhoneAuthCredential with the code
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: widget.vid, smsCode: smsCode);
              // Sign the user in (or link) with the credential
              await auth.signInWithCredential(credential).then((value) {
                print("========${value}");
              }
              );
            }, child: Text('Submit'))
          ],
        ),

      ),
    );
  }
}

