import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the bottom sheet when Book Now is clicked
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              builder: (context) => MobileVerificationBottomSheet(),
            );
          },
          child: const Text('Book Now'),
        ),
      ),
    );
  }
}

class MobileVerificationBottomSheet extends StatelessWidget {
  get screenWidth => null;

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Mobile Verification",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins'),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Is this your registerd phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff423E4C),
                      fontFamily: 'poppins'),
                ),
                Text(
                  "+919876543210 ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3366CC),
                      fontFamily: 'poppins'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            Mobile_verificationButton(
              Button_title: 'Edit number',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  builder: (context) => Edit_number_BottomSheet(),
                );
              },
            ),
            SizedBox(height: 20),

            //continue
            Mobile_verificationButton(
              color: Colors.white,
              Button_title: 'Continue',
              textColor: const Color(0xFFEF6F53),
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  builder: (context) => Enter_Otp_BottomSheet(),
                );
              },
            ),

            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

// Edit number Bottomsheet

class Edit_number_BottomSheet extends StatefulWidget {
  @override
  State<Edit_number_BottomSheet> createState() =>
      _Edit_number_BottomSheetState();
}

class _Edit_number_BottomSheetState extends State<Edit_number_BottomSheet> {
  get screenWidth => null;
  final TextEditingController _mobile_NumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjusts size based on content
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Mobile Verification",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins'),
            ),
            const SizedBox(height: 40),
            const Text(
              'Enter your mobile number to continue. You\nwill receive an otp at the registered number.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: Colors.black, fontFamily: 'poppins'),
            ),
            SizedBox(height: 40),

            //Edit Number
            Container(
              width: screen_width * 0.85,
              height: screen_height * 0.06,
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _mobile_NumberController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontWeight: FontWeight.w400),
                    hintText: "Enter your phone number",
                    contentPadding: EdgeInsets.only(left: 20)),
                keyboardType: TextInputType.phone,
              ),
            ),

            SizedBox(height: 20),

            //continue
            Mobile_verificationButton(
              // color: Colors.white,
              Button_title: 'Verify',
              //textColor: const Color(0xFFEF6F53),
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  builder: (context) => Enter_Otp_BottomSheet(),
                );
              },
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// Enter OTP Bottom Sheet

class Enter_Otp_BottomSheet extends StatefulWidget {
  @override
  State<Enter_Otp_BottomSheet> createState() => _Enter_Otp_BottomSheetState();
}

class _Enter_Otp_BottomSheetState extends State<Enter_Otp_BottomSheet> {
  get screenWidth => null;
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Wrap(
      children: [
        Container(
            width: double.infinity,
            //s height: screen_height * 0.5,
            child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  top: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter OTP',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins'),
                    ),
                    SizedBox(
                      height: screen_height * 0.04,
                    ),
                    const Text(
                      'We SEnt a 4 digit code to your mobile number.\n                       please enter the code:',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'poppins'),
                    ),
                    SizedBox(
                      height: screen_height * 0.04,
                    ),
                    // OTP input box
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _otpBox(0),
                        _otpBox(1),
                        _otpBox(2),
                        _otpBox(3),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Mobile_verificationButton(
                      Button_title: 'Continue',
                      onTap: () {
                        //Print the entered OTP
                        print('Entered OTP: ${_otpController.text.toString()}');
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Did't get OTP? ",
                          style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                        ),
                        InkWell(
                            onTap: () {
                              debugPrint('Resend otp taped');
                            },
                            child: const Text("Resend OTP ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins',
                                    color: Color(0xFF3461FD)))),
                      ],
                    )
                  ],
                ))),
      ],
    );
  }

  // Helper function to create each OTP box
  Widget _otpBox(int index) {
    return Container(
      width: 50,
      height: 60,
      child: TextField(
        //controller: _otpController,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '', // Hide the counter text
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 2),
          ),
        ),
        onChanged: (value) {
          // Move focus to the next field when a digit is entered
          if (value.length == 1 && index < 3) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}

//Mobile verification Button
class Mobile_verificationButton extends StatelessWidget {
  String Button_title;

  Color color;
  Color textColor;

  var onTap;
  Mobile_verificationButton({
    super.key,
    required this.Button_title,
    required this.onTap,
    this.color = const Color(0xFFEF6F53),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screen_height * 0.055,
        width: screen_width * 0.85,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFEF6F53),
            ),
            color: color,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(Button_title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontFamily: 'poppins',
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
