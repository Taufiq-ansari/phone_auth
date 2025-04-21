import 'package:fbintigration/phoneauth/otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPhoneAuthPage extends StatelessWidget {
  MyPhoneAuthPage({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "enter  phone number",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.8),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationid, int? resentToken) {
                  //  navigate to otp screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              OtpScreen(verificationid: verificationid),
                    ),
                  );
                },
                codeAutoRetrievalTimeout: (String verificationid) {},
                phoneNumber: phoneController.text.toString(),
              );
            },
            child: Text("verify phone numbers"),
          ),
        ],
      ),
    );
  }
}
