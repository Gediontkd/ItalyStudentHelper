import 'controller/splash_screen_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:michele_s_application8/core/app_export.dart';
import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';


//
// class SplashScreenOneScreen extends GetWidget<SplashScreenOneController> {
//   @override
//   // Widget build(BuildContext context) {
//   //   return SafeArea(
//   //       child: Scaffold(
//   //           backgroundColor: ColorConstant.whiteA700,
//   //           body: Container(
//   //               width: double.maxFinite,
//   //               padding: getPadding(all: 14),
//   //               child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.end,
//   //                   mainAxisAlignment: MainAxisAlignment.start,
//   //                   children: [
//   //                     Padding(
//   //                         padding: getPadding(right: 6),
//   //                         child: Text("lbl_powered_by".tr,
//   //                             overflow: TextOverflow.ellipsis,
//   //                             textAlign: TextAlign.left,
//   //                             style: AppStyle.txtRobotoRomanMedium10)),
//   //                     CustomImageView(
//   //                         imagePath: ImageConstant.imgImage1,
//   //                         height: getVerticalSize(21),
//   //                         width: getHorizontalSize(103),
//   //                         margin: getMargin(right: 6)),
//   //                     Spacer(),
//   //                     Container(
//   //                         height: getVerticalSize(352),
//   //                         width: getHorizontalSize(345),
//   //                         margin: getMargin(right: 1, bottom: 215),
//   //                         child: Stack(alignment: Alignment.center, children: [
//   //                           Align(
//   //                               alignment: Alignment.center,
//   //                               child: Container(
//   //                                   height: getVerticalSize(352),
//   //                                   width: getHorizontalSize(345),
//   //                                   decoration: BoxDecoration(
//   //                                       color: ColorConstant.whiteA7009e,
//   //                                       borderRadius: BorderRadius.circular(
//   //                                           getHorizontalSize(176))))),
//   //                           Align(
//   //                               alignment: Alignment.center,
//   //                               child: Row(
//   //                                   mainAxisAlignment: MainAxisAlignment.center,
//   //                                   children: [
//   //                                     CustomImageView(
//   //                                         imagePath:
//   //                                         ImageConstant.imgRectangle286,
//   //                                         height: getVerticalSize(133),
//   //                                         width: getHorizontalSize(134)),
//   //                                     Padding(
//   //                                         padding: getPadding(
//   //                                             left: 6, top: 148, bottom: 20),
//   //                                         child: Column(
//   //                                             crossAxisAlignment:
//   //                                             CrossAxisAlignment.end,
//   //                                             mainAxisAlignment:
//   //                                             MainAxisAlignment.start,
//   //                                             children: [
//   //                                               Container(
//   //                                                   width:
//   //                                                   getHorizontalSize(113),
//   //                                                   child: Text(
//   //                                                       "msg_istituto_comprensivo"
//   //                                                           .tr,
//   //                                                       maxLines: null,
//   //                                                       textAlign:
//   //                                                       TextAlign.right,
//   //                                                       style: AppStyle
//   //                                                           .txtRobotoRomanSemiBold19)),
//   //                                               Padding(
//   //                                                   padding: getPadding(top: 6),
//   //                                                   child: Text(
//   //                                                       "lbl_dante_alighieri"
//   //                                                           .tr,
//   //                                                       overflow: TextOverflow
//   //                                                           .ellipsis,
//   //                                                       textAlign:
//   //                                                       TextAlign.left,
//   //                                                       style: AppStyle
//   //                                                           .txtRobotoRomanSemiBold19Lime600))
//   //                                             ]))
//   //                                   ]))
//   //                         ]))
//   //                   ]))));
//   // }
// }

class SplashScreenOneScreen extends StatefulWidget {
  @override
  _SplashScreenOneScreenState createState() => _SplashScreenOneScreenState();
}


// class _SplashScreenOneScreenState extends State<SplashScreenOneScreen> with AutomaticKeepAliveClientMixin {
//   final controller = PageController();
//   Timer? _timer;
//   double currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (controller.page?.round() == controller.page) {
//         if (controller.page == 2) {
//           controller.jumpToPage(0);
//         } else {
//           controller.nextPage(
//             duration: Duration(milliseconds: 2000),
//             curve: Curves.ease,
//           );
//         }
//       }
//     });
//     controller.addListener(() {
//       setState(() {
//         currentPage = controller.page!;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: controller,
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/login_screen');
//                 },
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.asset(
//                       'assets/images/img${index + 1}.png',
//                       fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                       bottom: 300,
//                       left: 20,
//                       child: Text(
//                         'CookingLab',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           shadows: <Shadow>[
//                             Shadow(
//                               offset: Offset(2.0, 2.0),
//                               blurRadius: 3.0,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             bottom: 20,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: DotsIndicator(
//                 dotsCount: 3,
//                 position: currentPage,
//                 decorator: DotsDecorator(
//                   activeColor: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }

class _SplashScreenOneScreenState extends State<SplashScreenOneScreen> with AutomaticKeepAliveClientMixin {
  final controller = PageController();
  Timer? _timer;
  double currentPage = 0;

  // Add your image paths here
  final List<String> imagePaths = [
    'assets/images/foto-CookingLab.jpeg',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  // Add your text here
  final List<String> imageTexts = [
    'HELLO',
    'CookingLab',
    'Text 3',
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