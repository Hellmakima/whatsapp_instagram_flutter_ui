import 'package:flutter/material.dart';
import 'chat_widget.dart';
import 'colors.dart';
import 'ongoing_call.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});
  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {

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
            itemBuilder: (context, index) => Call(chat: chats[index]),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: green,
              onPressed: (){},
              child: const Icon(
                Icons.add_call,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Call extends StatefulWidget {
  final Chat chat;
  const Call({super.key, required this.chat});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: darkGrey,
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.chat.pfpURL),
      ),
      title: Text(
        widget.chat.name,
        style: TextStyle(
          color: white,
          fontSize: 17,
        ),
      ),
      subtitle: Text(
        widget.chat.time,
        style: TextStyle(color: lighterGrey),
      ),
      trailing: IconButton(
        onPressed: (){
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnGoingCall(chat: widget.chat))
            );
          });
        },
        icon: Icon(Icons.call,
          color: green,
        ),
      ),
    );
  }
}



