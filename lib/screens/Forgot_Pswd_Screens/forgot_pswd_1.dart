import 'package:flutter/material.dart';

class ForgotPswd1 extends StatelessWidget {
  const ForgotPswd1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      iconColor: const Color.fromARGB(255, 0, 0, 0)),
                  label: const Icon(
                    Icons.arrow_back,
                    size: 36,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromRGBO(225, 255, 255, 0.5),
              ),
              child: Image.asset(
                'assets/msg_icon.png',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Forget Password',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(height: 35),
            const Text(
              'Enter your email id or phone number to send verification code for change of password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Enter registered mail id/phone number',
                  prefixText: "    ",
                  hintStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 111, 83, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {},
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
