// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../Screens/main_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(const Duration(milliseconds: 5000), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const MainScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 110),
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 height: 100,
//                 width: 900,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:async';
import 'package:flutter/material.dart';
import '../Screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 110),
              child: Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 900,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
