// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
//
// class WebPageScreen extends StatefulWidget {
//   final String url;
//
//   const WebPageScreen({super.key, required this.url});
//
//   @override
//   State<WebPageScreen> createState() => _WebPageScreenState();
// }
//
// class _WebPageScreenState extends State<WebPageScreen> {
//   late final WebViewController _controller;
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (Platform.isAndroid) {
//       WebViewPlatform.instance = AndroidWebViewPlatform();
//     } else if (Platform.isIOS) {
//       WebViewPlatform.instance = WebKitWebViewPlatform();
//     }
//     _initializeWebView();
//   }
//
//   Future<void> _initializeWebView() async {
//     final PlatformWebViewControllerCreationParams creationParams;
//
//     if (Platform.isAndroid) {
//       creationParams =  AndroidWebViewControllerCreationParams();
//       _controller = WebViewController.fromPlatformCreationParams(creationParams)
//         ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         ..setNavigationDelegate(
//           NavigationDelegate(
//             onPageStarted: (String url) {
//               setState(() {
//                 _isLoading = true;
//               });
//             },
//             onPageFinished: (String url) async {
//               await Future.delayed(const Duration(milliseconds: 100));
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//         );
//
//       // Inject JavaScript to disable zoom
//       _controller.runJavaScript("""
//         document.addEventListener('DOMContentLoaded', function() {
//           const meta = document.createElement('meta');
//           meta.name = 'viewport';
//           meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
//           document.getElementsByTagName('head')[0].appendChild(meta);
//         });
//       """);
//     } else if (Platform.isIOS) {
//       creationParams =  WebKitWebViewControllerCreationParams();
//       _controller = WebViewController.fromPlatformCreationParams(creationParams)
//         ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         ..setNavigationDelegate(
//           NavigationDelegate(
//             onPageStarted: (String url) {
//               setState(() {
//                 _isLoading = true;
//               });
//             },
//             onPageFinished: (String url) async {
//               await Future.delayed(const Duration(milliseconds: 100));
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//         );
//
//       // Inject JavaScript to disable zoom
//       _controller.runJavaScript("""
//         document.addEventListener('DOMContentLoaded', function() {
//           const meta = document.createElement('meta');
//           meta.name = 'viewport';
//           meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
//           document.getElementsByTagName('head')[0].appendChild(meta);
//         });
//       """);
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//
//     await _controller.loadRequest(Uri.parse(widget.url));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Stack(
//         children: [
//           WebViewWidget(controller: _controller),
//           if (_isLoading)
//             LinearProgressIndicator(
//               backgroundColor: Colors.grey[300],
//               valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD8745E)),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebPageScreen extends StatefulWidget {
  final String url;

  const WebPageScreen({super.key, required this.url});

  @override
  State<WebPageScreen> createState() => _WebPageScreenState();
}

class _WebPageScreenState extends State<WebPageScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebViewPlatform.instance = AndroidWebViewPlatform();
    } else if (Platform.isIOS) {
      WebViewPlatform.instance = WebKitWebViewPlatform();
    }
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    final PlatformWebViewControllerCreationParams creationParams;

    if (Platform.isAndroid) {
      creationParams = AndroidWebViewControllerCreationParams();
      _controller = WebViewController.fromPlatformCreationParams(creationParams)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) async {
              await Future.delayed(const Duration(milliseconds: 100));
              setState(() {
                _isLoading = false;
              });

              _controller.runJavaScript("""
                var script = document.createElement('script');
                script.src = '//code.tidio.co/0x0mojnahc7jaoxbuubnsoefpyhvmp2i.js';
                script.async = true;
                document.body.appendChild(script);
              """);
            },
          ),
        );
    } else if (Platform.isIOS) {
      creationParams = WebKitWebViewControllerCreationParams();
      _controller = WebViewController.fromPlatformCreationParams(creationParams)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) async {
              await Future.delayed(const Duration(milliseconds: 100));
              setState(() {
                _isLoading = false;
              });
              _controller.runJavaScript("""
                var script = document.createElement('script');
                script.src = '//code.tidio.co/0x0mojnahc7jaoxbuubnsoefpyhvmp2i.js';
                script.async = true;
                document.body.appendChild(script);
              """);
            },
          ),
        );
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    await _controller.loadRequest(Uri.parse(widget.url));
  }

  void openTidioChat() {
    _controller.runJavaScript("""
      if (window.tidioChatApi) {
        window.tidioChatApi.open();
      } else {
        console.log('Tidio chat API not available.');
      }
    """);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD8745E)),
            ),
        ],
      ),
    );
  }
}
