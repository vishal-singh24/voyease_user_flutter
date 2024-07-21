import "package:auto_route/auto_route.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/core/routing/app_router.dart";
import "package:voyease_frontend/widgets/app_card.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/buttons/app_button.dart";
import "package:voyease_frontend/widgets/buttons/primary_button.dart";
import "package:voyease_frontend/widgets/form/check_box_field.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";
import "package:voyease_frontend/widgets/gradient_background.dart";

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ["openid", "email", "profile"],
);

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  final String _contactText = '';

  @override
  void initState() {
    super.initState();

    print(_googleSignIn.currentUser);

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      print("is Authorized = $isAuthorized");

      setState(() {
        _currentUser = account;
        _isAuthorized = isAuthorized;
      });

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      // if (isAuthorized) {
      //   unawaited(_handleGetContact(account!));
      // }
    });
  }

  Future<void> _handleSignIn() async {
    // _googleSignIn.disconnect();
    try {
      await _googleSignIn.signIn();
    } catch (error, stack) {
      print(error);
      print(stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppTopNavBar(),
                const SizedBox(height: 20),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Signup",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Create new account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.56,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const InputField(
                        placeholder: "Username",
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      const SizedBox(height: 15),
                      const InputField(
                          placeholder: "Email",
                          prefixIcon: Icon(Icons.mail_outline),
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 15),
                      const InputField(
                          placeholder: "Phone",
                          prefixIcon: Icon(Icons.phone_outlined),
                          keyboardType: TextInputType.phone),
                      const SizedBox(height: 15),
                      const InputField(
                          placeholder: "Password",
                          prefixIcon: Icon(Icons.key_outlined),
                          isPassword: true),
                      const SizedBox(height: 15),
                      CheckBoxField(
                        label: Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: "I agree to The ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(
                                    color: AppColors.textLink,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const TextSpan(
                                  text: " and ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: AppColors.textLink,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                          label: "Sign up",
                          onClick: () {
                            context.navigateNamedTo(SignUpVerifyRoute.name);
                          }),
                      const SizedBox(height: 20),
                      const Text(
                        "Or signup with:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppButton(
                          label: "Google",
                          fontWeight: FontWeight.w500,
                          icon: Image.asset(
                            "assets/icons/google.png",
                            height: 24,
                          ),
                          onClick: _handleSignIn,
                          backgroundColor: const Color(0XFFF5F9FE),
                          borderSide: BorderSide.none,
                          textColor: AppColors.textGray),
                      const SizedBox(height: 20),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: AppColors.textLink,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router
                                        .replaceNamed(LoginRoute.name);
                                  }),
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
      ),
    );
  }
}
