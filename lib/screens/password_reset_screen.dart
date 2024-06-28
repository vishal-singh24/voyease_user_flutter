//Password visibility state bug left to be solved

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});
  @override
  State<PasswordResetScreen> createState() {
    return _ForgotPswd3();
  }
}

class _ForgotPswd3 extends State<PasswordResetScreen> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

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
                'assets/images/lock.png',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password Reset',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                obscureText: passwordVisible,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Enter new Password',
                  hintStyle: const TextStyle(fontSize: 12),
                  prefixText: "    ",
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                obscureText: passwordVisible,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Re-enter new Password',
                  prefixText: "    ",
                  hintStyle: const TextStyle(fontSize: 12),
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(239, 111, 83, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                context.router.pushNamed("/reset-done");
              },
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
