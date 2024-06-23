// login.dart
import 'package:flutter/material.dart';
import 'package:voyease_frontend/widgets/common_widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child:Stack(
            children: [
            Positioned(
            left: 16,
            top: 60,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
              },
            ),
          ),
      Center(
    child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 180),
            Container(
              height: 534,
              width: 400,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 9.80,
                    offset: Offset(2, 4),
                    spreadRadius: 4,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      height: 0,
                      letterSpacing: 0.80,
                    ),
                  ),
                  Text(
                    'Login to your account',
                    style: TextStyle(
                      color: Color(0xFF285A84),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      height: 0,
                      letterSpacing: 0.56,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomInputField(label: 'Username',),
                  SizedBox(height: 15,),
                  CustomInputField(label: 'Password',),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) => {},
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 20, 0, 20),
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF3366CC),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    label: 'Login',
                    color: Color(0xFFEF6F53),
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 277,
                    child: Text(
                      'By submitting, you agree to Terms and Conditions and Privacy policy.',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.01,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Or login with:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SocialButton(
                          label: 'Microsoft',
                          logo: FlutterLogo(),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(85, 20, 0, 20),
                        ),
                        SocialButton(
                          label: 'Google',
                          logo: FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 236,
                    height: 19,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account ?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                              color: Color(0xFF3366CC),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
