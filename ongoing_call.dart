import 'package:flutter/material.dart';
import 'chat_widget.dart';
import 'colors.dart';
class OnGoingCall extends StatefulWidget {
  final Chat chat;
  const OnGoingCall({super.key, required this.chat});

  @override
  State<OnGoingCall> createState() => _OnGoingCallState();
}

class _OnGoingCallState extends State<OnGoingCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkGrey,
        width: double.infinity,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            Text(
              'End-to-end encrypted',
              style: TextStyle(fontSize: 10,color: white),
            ),
            const SizedBox(height: 20,),
            CircleAvatar(
              radius: 40,
              // child: Icon(
              //   Icons.perm_identity,
              //   size: 40,
              // ),
              backgroundImage: AssetImage(widget.chat.pfpURL),
            ),
            const SizedBox(height: 20,),
            Text(
              widget.chat.name,
              style: TextStyle(
                color: white,
                fontSize: 40,
              ),
            ),
            Text(
              'Calling',
              style: TextStyle(
                color: white,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: lightGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.volume_up_rounded,color: lighterGrey,size: 30,),
            Icon(Icons.videocam,color: lighterGrey,size: 30,),
            Icon(Icons.mic_off,color: lighterGrey,size: 30,),
            // Icon(Icons.call_end,color: Colors.red,size: 30,
            IconButton(onPressed: (){
              setState(() {
                Navigator.pop(context);
              });
            },
              icon: Icon(Icons.call_end,color: white,),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
              ),
            ),
          ],
        ),
      ),
    );
  }
}