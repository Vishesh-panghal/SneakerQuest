// ignore_for_file: use_build_context_synchronously, constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'authentication/login.dart';
import 'homePage_NikeStore.dart';

class SplashScreenPage extends StatefulWidget {
    static const String KEYLOGIN = 'login';
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController iconController;
  late AnimationController shoeController;
  late AnimationController nameController;
  late Animation<double> shoeAnimation;
  late Animation<double> nameAnimation;
  double aboutOpacty = 0.0;
  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0.0;
  bool isLoggedIn = false;
  @override

  //--------------Animation Controllers----------------------//
  void initState() {
    iconController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    shoeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    nameController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    shoeAnimation = Tween(begin: 0.6, end: 1.0).animate(shoeController);
    nameAnimation = Tween(begin: -1.0, end: 0.3).animate(nameController);
    shoeController.forward();
    nameController.forward();
    Timer(const Duration(seconds: 1), () {
      aboutOpacty = 1.0;
      setState(() {});
    });
    super.initState();

  }

  @override
  //--------------------Dispose Animation-------------------//
  void dispose() {
    iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //---------------Background Color-----------------------//
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(169, 246, 212, 101),
              Color(0xffe2ebf0),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            //-------Lottie Nike Animation--------------//
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Lottie.asset(
                    'assets/lottie/ic_nike.json',
                    height: 50,
                    controller: iconController,
                    onLoaded: (p0) {
                      iconController.forward();
                    },
                  ),
                ],
              ),
            ),
            //------------Front shoe Image--------------//
            AnimatedBuilder(
              animation: shoeController.view,
              builder: (context, child) {
                return Transform.scale(
                  scale: shoeAnimation.value,
                  child: child,
                );
              },
              child: Image.asset('assets/Images/more_images/splash_screen.png'),
            ),
            const SizedBox(height: 20),
            //---------------Nike slogan--------------//
            AnimatedBuilder(
              animation: nameAnimation,
              builder: (context, child) {
                var x = nameAnimation.value * 100;
                return Transform(
                  transform: Matrix4.translationValues(x, 0, 0),
                  child: child,
                );
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Just do it with',
                    style: TextStyle(
                      fontFamily: 'Courgette',
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Nike',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            //--------------About and off------------//
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: aboutOpacty,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Get access to more than 1000 nike shoes\n also another brand with 20% off.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            //------------About Statment---------------------//
            const SizedBox(height: 70),
            //----------------Slider-----------------------//
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: aboutOpacty,
              //------------main Container---------------//
              child: Container(
                width: 345,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(92, 174, 216, 239),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: InkWell(
                  onTap: () async {
                    if (!isLoggedIn) {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return  LoginPage();
                      },
                    ));
                   
                    }else{
                      Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const NikeHomePage();
                      },
                    ));
                    }
                  },
                  child: Row(
                    children: [
                      Transform.translate(
                        offset: Offset(translateX, translateY),
                        child: AnimatedContainer(
                          height: 70,
                          width: 90,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(61, 241, 191, 52),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: myWidth > 0.0
                              ? const Icon(Icons.check,
                                  color: Colors.black, size: 38)
                              : const Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 38,
                                ),
                        ),
                      ),
                      myWidth == 0
                          ? const Expanded(
                              child: Center(
                                child: Text(
                                  'Swipe to start shopping..',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
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
