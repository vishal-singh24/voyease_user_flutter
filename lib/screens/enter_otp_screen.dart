import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

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
                'assets/images/msg_icon.png',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter OTP',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(height: 35),
            const Text(
              'We sent a 4 digit code to your mobile number. Please enter the code:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 35),
            Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 70,
                textStyle: const TextStyle(fontSize: 25),
                margin: const EdgeInsets.only(right: 7, left: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(239, 111, 83, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                context.router.pushNamed("/password-reset");
              },
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't get OTP?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Resend OTP'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
