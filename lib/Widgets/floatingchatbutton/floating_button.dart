import 'package:flutter/material.dart';

class FloatingChatButton extends StatelessWidget {
  final Function openChat;

  const FloatingChatButton({Key? key, required this.openChat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton(
        onPressed: () {
          // Trigger Tidio chat open action on the current WebView screen
          openChat(); // Call the passed in callback function to open the chat
        },
        backgroundColor: const Color(0xFFD8745E),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
