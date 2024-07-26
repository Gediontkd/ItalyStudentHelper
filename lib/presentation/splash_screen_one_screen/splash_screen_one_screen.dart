import 'controller/splash_screen_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';
import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';

class SplashScreenOneScreen extends StatefulWidget {
  @override
  _SplashScreenOneScreenState createState() => _SplashScreenOneScreenState();
}

class _SplashScreenOneScreenState extends State<SplashScreenOneScreen> with AutomaticKeepAliveClientMixin {
  final controller = PageController();
  Timer? _timer;
  double currentPage = 0;

  // image paths
  final List<String> imagePaths = [
    'assets/images/lab1.jpg',
    'assets/images/lab2.jpg',
    'assets/images/lab3.jpg',
  ];

  // text
  final List<String> imageTexts = [
    'Text 1',
    'CookingLab',
    'Text 2',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (controller.page?.round() == controller.page) {
        if (controller.page == 2) {
          controller.jumpToPage(0);
        } else {
          controller.nextPage(
            duration: Duration(milliseconds: 2000),
            curve: Curves.ease,
          );
        }
      }
    });
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imagePaths[index], // Use the index to display the corresponding image
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 300,
                      left: 20,
                      child: Text(
                        imageTexts[index], // Use the index to display the corresponding text
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: currentPage,
                decorator: DotsDecorator(
                  activeColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
