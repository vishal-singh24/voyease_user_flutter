import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/screens/auth/signup_screen/controller/signup_controller.dart';
import 'package:voyease_frontend/widgets/app_card.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/buttons/app_button.dart';
import 'package:voyease_frontend/widgets/buttons/primary_button.dart';
import 'package:voyease_frontend/widgets/form/check_box_field.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';
import 'package:voyease_frontend/widgets/gradient_background.dart';

class SignupScreen extends GetView<SignupController> {
 const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return GetBuilder(
        init: SignupController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            body: GradientBackground(
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Obx(() => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AppTopNavBar(),
                              const SizedBox(
                                height: 20,
                              ),
                              AppCard(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      "Signup",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
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
                                    InputField(
                                      controller:
                                          controller.usernameController,
                                      placeholder: "User name",
                                      prefixIcon: Icon(Icons.person_outline),
                                    ),
                                    const SizedBox(height: 15),
                                    InputField(
                                        controller:
                                            controller.emailController,
                                        placeholder: "Email",
                                        prefixIcon: Icon(Icons.mail_outline),
                                        keyboardType:
                                            TextInputType.emailAddress),
                                    const SizedBox(height: 15),
                                    InputField(
                                        controller:
                                            controller.phoneController,
                                        placeholder: "Phone",
                                        prefixIcon:
                                            Icon(Icons.phone_outlined),
                                        keyboardType: TextInputType.phone),
                                    const SizedBox(height: 15),
                                    InputField(
                                        controller:
                                            controller.passwordController,
                                        placeholder: "Password",
                                        prefixIcon: Icon(Icons.key_outlined),
                                        isPassword: true),
                                    const SizedBox(height: 15),
                                    CheckBoxField(
                                      value: controller.isChecked.value,
                                      onChanged: (bool? newValue) {
                                        controller.toggleChecked();
                                      },
                                      activeColor: controller.isChecked.value
                                          ? Colors.green
                                          : Colors.white,
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
                                          if (!controller.isChecked.value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                            const  SnackBar(
                                                backgroundColor: Colors.blue,
                                                content: Text(
                                                    'Please accept the Terms and Conditions.'),
                                              ),
                                            );
                                          } else {
                                            controller.signup(context);
                                            // _googleSignIn.disconnect();
                                          }
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
                        //onClick: handleSignIn,
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
                              )
                            ],
                          )))),
            ),
          );
        });
  }
}
// import "dart:convert";
// import "dart:developer";

// import "package:auto_route/auto_route.dart";
// import "package:dio/dio.dart";
// import "package:flutter/gestures.dart";
// import "package:flutter/material.dart";
// import "package:google_sign_in/google_sign_in.dart";
// import "package:voyease_frontend/api_clients/auth_client.dart";
// import "package:voyease_frontend/configs/app_colors.dart";
// import "package:voyease_frontend/core/routing/app_router.dart";
// import "package:voyease_frontend/widgets/app_card.dart";
// import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
// import "package:voyease_frontend/widgets/buttons/app_button.dart";
// import "package:voyease_frontend/widgets/buttons/primary_button.dart";
// import "package:voyease_frontend/widgets/form/check_box_field.dart";
// import "package:voyease_frontend/widgets/form/input_field.dart";
// import "package:voyease_frontend/widgets/gradient_background.dart";



// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
 
  
  

  

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GradientBackground(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const AppTopNavBar(),
//                 const SizedBox(height: 20),
//                 AppCard(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const Text(
//                         "Signup",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 30,
//                         ),
//                       ),
//                       Text(
//                         "Create new account",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: AppColors.textBlue,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 0.56,
//                         ),
//                       ),
//                       const SizedBox(height: 32),
//                       InputField(
//                         //controller: _usernameController,
//                         placeholder: "Username",
//                         prefixIcon: Icon(Icons.person_outline),
//                       ),
//                       const SizedBox(height: 15),
//                       InputField(
//                          //controller: _emailController,
//                           placeholder: "Email",
//                           prefixIcon: Icon(Icons.mail_outline),
//                           keyboardType: TextInputType.emailAddress),
//                       const SizedBox(height: 15),
//                       InputField(
//                           //controller: _phoneController,
//                           placeholder: "Phone",
//                           prefixIcon: Icon(Icons.phone_outlined),
//                           keyboardType: TextInputType.phone),
//                       const SizedBox(height: 15),
//                       InputField(
//                           //controller: _passwordController,
//                           placeholder: "Password",
//                           prefixIcon: Icon(Icons.key_outlined),
//                           isPassword: true),
//                       const SizedBox(height: 15),
//                       CheckBoxField(
//                         value: true,
//                         onChanged: (bool? newValue) {
//                           setState(() {
//                             //_isAuthorized = newValue ?? false;
//                           });
//                         },
//                         activeColor:Colors.white,
//                            // _isAuthorized ? Colors.green : Colors.white,
//                         label: Expanded(
//                           child: Text.rich(
//                             TextSpan(
//                               children: [
//                                 const TextSpan(
//                                   text: "I agree to The ",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontFamily: "Poppins",
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "Terms of Service",
//                                   style: TextStyle(
//                                     color: AppColors.textLink,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const TextSpan(
//                                   text: " and ",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "Privacy Policy",
//                                   style: TextStyle(
//                                     color: AppColors.textLink,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       PrimaryButton(
//                           label: "Sign up",
//                           onClick: () {
//                             // if (!_isAuthorized) {
//                             //   ScaffoldMessenger.of(context).showSnackBar(
//                             //     const SnackBar(
//                             //       content: Text(
//                             //           'Please accept the Terms and Conditions.'),
//                             //     ),
//                             //   );
//                             // } else {
//                             //   controller.signup();
//                             //  // _googleSignIn.disconnect();
//                             // }
                            
//                           }),
//                       const SizedBox(height: 20),
//                       const Text(
//                         "Or signup with:",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       AppButton(
//                           label: "Google",
//                           fontWeight: FontWeight.w500,
//                           icon: Image.asset(
//                             "assets/icons/google.png",
//                             height: 24,
//                           ),
//                          // onClick: _handleSignIn,
//                           backgroundColor: const Color(0XFFF5F9FE),
//                           borderSide: BorderSide.none,
//                           textColor: AppColors.textGray),
//                       const SizedBox(height: 20),
//                       Text.rich(
//                         textAlign: TextAlign.center,
//                         TextSpan(
//                           children: [
//                             const TextSpan(
//                               text: "Already have an account? ",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             TextSpan(
//                                 text: "Login",
//                                 style: TextStyle(
//                                   color: AppColors.textLink,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     context.router
//                                         .replaceNamed(LoginRoute.name);
//                                   }),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
