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
        backgroundColor: Color(0xff0A091E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(

                controller: otpController,
                decoration: InputDecoration(
                    hintText: "Enter OTP",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),

              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
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
