import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefirst/otp.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class call extends StatefulWidget {
  const call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
String number='';
String vid='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(margin: EdgeInsets.all(20),
          child: IntlPhoneField(
            flagsButtonPadding: const EdgeInsets.all(8),
            dropdownIconPosition: IconPosition.trailing,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',

            onChanged: (phone) {
              print(phone.completeNumber);
              setState(() {
                number=phone.completeNumber;
              });
            },
          ),
        ),
        ElevatedButton(onPressed: () async {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: number,
            verificationCompleted: (PhoneAuthCredential credential) {},
            verificationFailed: (FirebaseAuthException e) {},
            codeSent: (String verificationId, int? resendToken) {
              print("$verificationId");
              setState(() {
                vid=verificationId;
              });
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) {
                return otp(vid);
          },));
        }, child: Text("Submit"))

      ]
      ),
    );
  }
}
