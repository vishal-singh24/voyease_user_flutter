import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * .45,
            width: size.width,
            decoration: const BoxDecoration(
                color: Color(0xfff5ceb8),
                image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/running_car.gif"))),
          ),
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text(
                  "Voyease",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Trips now easy"),
                LandingButton(),
                LandingButton()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class LandingButton extends StatelessWidget {
  const LandingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print("naman");
    print(Theme.of(context).elevatedButtonTheme.style);

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: FilledButton(
        onPressed: () => {},
        style: Theme.of(context).filledButtonTheme.style,
        child: const Text("Login"),
        // style: Theme.of(context).buttonBarTheme.alignment,
        // style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 0)),
      ),
      // child: FilledButton(
      //   onPressed: () => {},
      //   child: Text(
      //     "Login",
      //     // style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   // style: FilledButton.styleFrom(Theme.of(context).buttonTheme.copyWith().)
      // ),
    );
  }
}
