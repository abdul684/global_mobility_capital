// import 'package:flutter/material.dart';
// import 'Screens/webview_screen.dart';
// import 'SplashScreen/splash_screen.dart';
//
// void main()
// // async
// {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // Stripe.publishableKey =
//   // 'pk_test_51JFH9zSGTdxZA1VVPlzCM1b4ztYvbz452v792r5iofLUkOdc15YdKHAv6VLSkt7qT5l643GIanpkbi8YCAQo47fm004YSyva3s';
//
//   // WidgetsFlutterBinding.ensureInitialized();
//   //
//   // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   //
//   // OneSignal.initialize("916ffc59-fe63-431e-980a-fcbf2ebfb8ed");
//   //
//   // if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
//   //   bool granted = await OneSignal.Notifications.requestPermission(true);
//   //   if (!granted) {
//   //     debugPrint("Notification permission not granted.");
//   //   }
//   // }
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Stack(
//         children: [
//           SplashScreen(),
//           // Positioned(
//           //   bottom: 0,
//           //   left: 0,
//           //   child: FloatingActionButton(
//           //     onPressed: () {
//           //       ElevatedButton(
//           //         onPressed: () {
//           //           Navigator.push(
//           //             context,
//           //             MaterialPageRoute(builder: (context) => WebPageScreen(url: '<script src="//code.tidio.co/e44pjxx9skqcfxkkmuekt5cud2rwbvrj.js" async></script>')),
//           //           );
//           //         },
//           //         child: Text('Open Tidio Chat'),
//           //       );
//           //
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'Screens/webview_screen.dart';
// import 'SplashScreen/splash_screen.dart';
// import 'Screens/main_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Stack(
//         children: [
//           SplashScreen(),
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const WebPageScreen(
//                       url: 'https://glmbcp.com/',
//                     ),
//                   ),
//                 );
//               },
//               backgroundColor: const Color(0xFFD8745E),
//               child: const Icon(Icons.chat, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'SplashScreen/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          SplashScreen(),
          // Positioned(
          //   bottom: 16,
          //   right: 16,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const WebPageScreen(
          //             url: 'https://glmbcp.com/',
          //           ),
          //         ),
          //       );
          //     },
          //     backgroundColor: const Color(0xFFD8745E),
          //     child: const Icon(Icons.chat, color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}
