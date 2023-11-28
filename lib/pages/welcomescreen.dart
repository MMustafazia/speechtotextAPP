import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:speechtotext/pages/home_page.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Voice Note",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 50),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: ClipRRect(child: Image.asset("assets/yoo.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 25),
                      child: SwipeableButtonView(
                        isFinished: isFinished,
                        onWaitingProcess: () {
                          Future.delayed(
                            Duration(seconds: 3),
                            () {
                              setState(
                                () {
                                  isFinished = true;
                                },
                              );
                            },
                          );
                        },
                        activeColor: Color.fromARGB(255, 62, 163, 89),
                        buttonWidget: Container(
                          child: Icon(
                            Icons.mic_sharp,
                            color: Colors.black,
                          ),
                        ),
                        buttonText: "Slide to Start",
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: HomePage(),
                                  type: PageTransitionType.fade));
                          setState(() {
                            isFinished = false;
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
