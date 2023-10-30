import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/bottom_navbar.dart';

class OtpConfirm extends StatelessWidget {
  String verificationId;

  OtpConfirm({Key? key, required this.verificationId}) : super(key: key);
  TextEditingController otpController = TextEditingController();
  late PhoneAuthCredential phoneAuthCredential;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otpController,
              decoration: InputDecoration(hintText: "Enter OTP"),
            ),
            TextButton(
                onPressed: () async {
                  phoneAuthCredential = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpController.text);
                  await FirebaseAuth.instance
                      .signInWithCredential(phoneAuthCredential);
                  print("${FirebaseAuth.instance.currentUser!.uid}");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()),
                      (route) => false);
                },
                child: Text("Verify OTP"))
          ],
        ),
      ),
    );
  }
}
