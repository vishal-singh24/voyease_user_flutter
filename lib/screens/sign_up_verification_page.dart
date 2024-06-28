import 'package:flutter/material.dart';

class SignUpVerify extends StatelessWidget {
  const SignUpVerify({super.key});

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
            const Text(
              'Verify your account',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(height: 49),
            const Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Text(
                'We sent a verification code to your registered mail id. The code will expire in 24 hours.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Enter verification code',
                  prefixText: "    ",
                  hintStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Resend code'),
                  ),
                  const Text('in 00:45'), //Timer is to be added here
                ],
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 111, 83, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {},
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
