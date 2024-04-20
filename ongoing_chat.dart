import 'package:flutter/material.dart';
import 'ongoing_call.dart';
import 'chat_widget.dart';
import 'colors.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;
  List<List<dynamic>> chats = [];
  ChatPage({super.key, required this.chat}){
    chats.add(
      ['Hello ${chat.name}', 'Yesterday', true],
    );
    chats.add(
      [chat.lastMessage, chat.time, false],
    );
  }

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  var text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.chat.pfpURL),
            radius: 40,
          ),
        ),
        // preferredSize: Size.infinite,
        backgroundColor: lightGrey,
        title: Text(
          widget.chat.name,
          style: TextStyle(
            color: white,
            // letterSpacing: 2,
            fontSize: 28,
          ),
        ),
        actions: [
          // Image.asset('assets/images/puff.jpg'),
          IconButton(
            onPressed: (){
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnGoingCall(chat: widget.chat,),)
                );
              });
            },
            icon: Icon(
              Icons.videocam,
              color: white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnGoingCall(chat: widget.chat,),)
                );
              });
            },
            icon: Icon(
              Icons.call,
              color: white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.more_vert,
              color: white,
              size: 28,
            ),
          ),
        ],
      ),
      backgroundColor: darkGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 650,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: widget.chats.length,
              itemBuilder: (context, index) => Message(
                  msg: widget.chats[index][0],
                  sent: widget.chats[index][2],
                  time: widget.chats[index][1]
              )
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                // color: lighterGrey,
                width: 350,
                height: 100,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: 'Send message',
                      // helperText: AutofillHints.addressCity,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      widget.chats.add([_controller.text,"now",true]);
                      // widget.chat.lastMessage = _controller.text;
                      _controller.clear();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(green),
                  ),
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 40,
                  )
              )
            ],
          ), // bottom (text editor + send button)
        ],
      ),
    );
  }
}

class Message extends StatefulWidget {
  final String msg;
  final bool sent;
  final String time;
  const Message({super.key, required this.msg, required this.sent, required this.time});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {

  MainAxisAlignment alignment = MainAxisAlignment.end;
  Color? color = green;

  @override
  Widget build(BuildContext context) {
    if (!widget.sent){
      alignment = MainAxisAlignment.start;
      color = lightGrey;
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: alignment,
          children: [
            TextButton(onPressed: (){},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    color,
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.msg,
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                        fontSize: 10,
                        color: lighterGrey
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}

/*
class ChatPage extends StatefulWidget {
  final Chat chat;
  List<String> sentChats = [];
  ChatPage({super.key, required this.chat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  var text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.chat.pfpURL),
            radius: 40,
          ),
        ),
        // preferredSize: Size.infinite,
        backgroundColor: lightGrey,
        title: Text(
          widget.chat.name,
          style: TextStyle(
            color: white,
            // letterSpacing: 2,
            fontSize: 28,
          ),
        ),
        actions: [
          // Image.asset('assets/images/puff.jpg'),
          IconButton(
            onPressed: (){
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnGoingCall(chat: widget.chat,),)
                );
              });
            },
            icon: Icon(
              Icons.videocam,
              color: white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnGoingCall(chat: widget.chat,),)
                );
              });
            },
            icon: Icon(
              Icons.call,
              color: white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.more_vert,
              color: white,
              size: 28,
            ),
          ),
        ],
      ),
      backgroundColor: darkGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (){},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      green,
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hello ${widget.chat.name}',
                      style: TextStyle(
                        fontSize: 20,
                        color: white,
                      ),
                    ),
                    Text(
                      'Yesterday',
                      style: TextStyle(
                          fontSize: 10,
                          color: lighterGrey
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10,)
            ],
          ), // first message
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10,),
              TextButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      lightGrey,
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          widget.chat.lastMessage,
                        style: TextStyle(
                          fontSize: 20,
                          color: white,
                        ),
                      ),
                      Text(
                        widget.chat.time,
                        style: TextStyle(
                          fontSize: 10,
                          color: lighterGrey
                        ),
                      )
                    ],
                  ),
              ),
            ],
          ), // received message
          const SizedBox(height: 20,),
          Column(
            children: widget.sentChats.map((sentText) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              green,
                            ),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sentText,
                              style: TextStyle(
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                            Text(
                              'Now',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: lighterGrey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                  const SizedBox(height: 5,),
                ],
              );
            }).toList(),
          ), // sent messages
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                // color: lighterGrey,
                width: 350,
                height: 100,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Send message',
                    // helperText: AutofillHints.addressCity,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      widget.sentChats.add(_controller.text);
                      // widget.chat.lastMessage = _controller.text;
                      _controller.clear();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(green),
                  ),
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  )
              )
            ],
          ), // bottom (text editor + send button)
        ],
      ),
    );
  }
}*/
