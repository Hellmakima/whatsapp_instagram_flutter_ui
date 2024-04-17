import 'package:flutter/material.dart';
import 'chat_widget.dart';
import 'colors.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: darkGrey,
          ),
          ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) => ChatItem(chat: chats[index]),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: green,
              onPressed: (){},
              child: const Icon(
                Icons.add_comment_rounded,
              ),
            ),
          )
        ],
      ),
    );
  }
}

