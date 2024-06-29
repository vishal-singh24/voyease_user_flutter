import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/widgets/common_widgets.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  size: 40,
                ),
                onPressed: () {
                  context.router.back();
                },
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: 784,
                      width: 400,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
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
                          const SizedBox(height: 15),
                          const Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              height: 0,
                              letterSpacing: 0.80,
                            ),
                          ),
                          const Text(
                            'Create new account',
                            style: TextStyle(
                              color: Color(0xFF285A84),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              height: 0,
                              letterSpacing: 0.56,
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CustomInputField(label: 'Username'),
                          const SizedBox(height: 15),
                          const CustomInputField(label: 'Email'),
                          const SizedBox(height: 15),
                          const CustomInputField(label: 'Phone Number'),
                          const SizedBox(height: 15),
                          const CustomInputField(label: 'Password'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 15, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) => {},
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree to The ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(
                                          color: Color(0xFF3461FD),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          color: Color(0xFF3461FD),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            label: 'Signup',
                            color: const Color(0xFFEF6F53),
                            onPressed: () {
                              context.router.pushNamed("/signup-verify");
                            },
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Or sign in with:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SocialButton(
                                  label: 'Microsoft',
                                  logo: FlutterLogo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(85, 25, 0, 20),
                                ),
                                SocialButton(
                                  label: 'Google',
                                  logo: FlutterLogo(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 250,
                            height: 19,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account ?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Login',
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
      ),
    );
  }
}
