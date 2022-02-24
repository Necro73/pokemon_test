import 'package:flutter/material.dart';
import 'package:pokemon_test/screens/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _myAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _myAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    splashActivate();
  }

  void splashActivate() async {
    await Future.delayed(const Duration(milliseconds: 1600));
    Navigator.pushReplacement(
        context, PageRouteBuilder(transitionDuration: const Duration(milliseconds: 750), pageBuilder: (context, __, ___) => const MenuScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: FadeTransition(
            opacity: _myAnimation,
            child: const Hero(
              tag: 'logo',
              child: Image(
                width: 300,
                height: 300,
                image: AssetImage(
                  'assets/images/pokemon_logo.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
