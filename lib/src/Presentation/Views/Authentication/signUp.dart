import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'otp_confirmation.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mobileNumberController =
      TextEditingController(text: "+91");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPhoneNumber(String input) {
    // Define a regular expression pattern for a 10-digit phone number
    // This pattern matches a 10-digit number with optional dashes and spaces
    final RegExp phonePattern = RegExp(r'^[0-9\- ]{10}$');

    // Use the RegExp's `hasMatch` method to check if the input matches the pattern
    return phonePattern.hasMatch(input);
  }

  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0A091E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileNumberController,
                  decoration: InputDecoration(
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    // You can add more validation rules here.
                    return null; // Return null if the input is valid.
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isButtonDisabled =
                      true; // Disable the button while the request is processing.
                });

                if (_formKey.currentState!.validate()) {
                  // The form is valid, proceed with sending OTP.
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: mobileNumberController.text,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      // Now you can navigate after the request is complete.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpConfirm(verificationId: verificationId),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }

                setState(() {
                  _isButtonDisabled =
                      false; // Re-enable the button after the request is complete.
                });
              },
              child: _isButtonDisabled
                  ? CircularProgressIndicator() // Show a loading indicator while the request is ongoing.
                  : Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
