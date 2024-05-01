import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasefirst/home.dart';
import 'package:firebasefirst/otp.dart';
import 'package:firebasefirst/phonecall.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: signup(),
  ));
}
//
// class signup extends StatefulWidget {
//   const signup({Key? key}) : super(key: key);
//
//   @override
//   State<signup> createState() => _signupState();
// }
//
// class _signupState extends State<signup> {
//   TextEditingController email = TextEditingController();
//   TextEditingController pass = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 10, top: 10, left: 60, right: 60),
//           child: TextField(            controller: email,
//             decoration: InputDecoration(
//                 labelText: 'Enter Number',
//                 hintText: 'Enter Your Number',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)))),6y
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(bottom: 10, top: 10, left: 60, right: 60),
//           child: TextField(
//             controller: pass,
//             decoration: InputDecoration(
//                 labelText: 'Enter Number',
//                 hintText: 'Enter Your Number',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)))),
//           ),
//         ),
//         // ElevatedButton(
//         //     onPressed: () async {
//         //       try {
//         //         final credential = await FirebaseAuth.instance
//         //             .createUserWithEmailAndPassword(
//         //           email: email.text,
//         //           password: pass.text,
//         //         )
//         //             .then((value) {
//         //           ScaffoldMessenger.of(context).showSnackBar(
//         //               SnackBar(content: Text('Register Success')));
//         //           Navigator.pushReplacement(context, MaterialPageRoute(
//         //             builder: (context) {
//         //               return Login();
//         //             },
//         //           ));
//         //         });
//         //       } on FirebaseAuthException catch (e) {
//         //         if (e.code == 'weak-password') {
//         //           print('The password provided is too weak.');
//         //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //               content: Text('The password provided is too weak.')));
//         //         } else if (e.code == 'email-already-in-use') {
//         //           print('The account already exists for that email.');
//         //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         //               content:
//         //                   Text('The account already exists for that email.')));
//         //         }
//         //       } catch (e) {
//         //         print(e);
//         //       }
//         //     },
//         //     child: Text('register')),
//         ElevatedButton.icon(onPressed: () {
//           signInWithGoogle();
//         }, icon: Icon(Icons.email_outlined), label:Text('email'))
//       ]),
//     );
//   }
//   Future<UserCredential> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     ) ;
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }
