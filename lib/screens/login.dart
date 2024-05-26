import 'package:flutter/material.dart';
import 'package:voyease_frontend/widgets/input_widget.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            InputWidget(
              icon: Icons.person_outline,
              placeholder: "username",
            ),
            InputWidget(
              icon: Icons.key_outlined,
              placeholder: "password",
              suffixIcon: Icons.visibility_outlined,
              type: InputType.password,
            ),
            FilledButton(
                onPressed: () => {},
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                )),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) => {},
                ),
                Text("I agree to term to terms of service and privacy policy")
              ],
            )
          ],
        ),
      ),
    );
  }
}
