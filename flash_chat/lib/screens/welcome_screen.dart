import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({this.photo});
  final String photo;
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation =
        Tween<double>(begin: 0.0, end: 200).animate(_animationController);
    _animationController.forward(); //play
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // SizedBox(
            //   width: 250.0,
            //   child: TextLiquidFill(
            //     text: 'LIQUIDY',
            //     waveColor: Colors.blueAccent,
            //     boxBackgroundColor: Colors.redAccent,
            //     textStyle: TextStyle(
            //       fontSize: 80.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     boxHeight: 300.0,
            //   ),
            // ),
            Row(
              children: <Widget>[
                Hero(
                  tag: kAnimationLogo,
                  child: Container(
                    child: Image.asset('images/download.png'),
                    height: 30,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('writing friend',
                        textStyle: const TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.w800)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                      ),
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('Register'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
