import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetDoneScreen extends StatelessWidget {
  const ResetDoneScreen({super.key});

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
            const Icon(
              Icons.check_circle_outline_rounded,
              color: Color.fromRGBO(40, 90, 132, 1),
              size: 110,
            ),
            const SizedBox(height: 35),
            const Text(
              'Password Reset Successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Text(
                'You have successfully reset your password. Please use new password while logging in.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 111, 83, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
