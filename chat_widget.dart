import 'package:flutter/material.dart';
import 'ongoing_chat.dart';
import 'colors.dart';

List<Chat> chats = [
  Chat(
      pfpURL: 'assets/smile.jpg',
      name: 'Sufiyan',
      lastMessage: 'not interested',
      time: 'Now'
  ),
  Chat(
      pfpURL: 'assets/puff.jpg',
      name: 'Nimish',
      lastMessage: 'good morning',
      time: '11:11'
  ),
  Chat(
      pfpURL: 'assets/surp.jpg',
      name: 'Abhijeet',
      lastMessage: 'I\'m going to the mall',
      time: 'Yesterday'
  ),
  Chat(
      pfpURL: 'assets/surp.jpg',
      name: 'Aadesh',
      lastMessage: 'Dart chi assignment pathav',
      time: 'Yesterday'
  ),
];

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: darkGrey,
      leading: CircleAvatar(
        backgroundImage: AssetImage(chat.pfpURL),
      ),
      title: Text(
        chat.name,
        style: TextStyle(
          color: white,
          fontSize: 17,
        ),
      ),
      subtitle: Text(
        chat.lastMessage,
        style: TextStyle(color: lighterGrey),
      ),
      trailing: Text(
        chat.time,
        style: TextStyle(color: lighterGrey),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(chat: chat,),
          )
        );
      },
    );
  }
}

class Chat {
  final String pfpURL;
  final String name;
  String lastMessage;
  final String time;
  Chat ({
    required this.pfpURL,
    required this.name,
    required this.lastMessage,
    required this.time
  });
}