import 'package:flutter/material.dart';
import 'reels.dart';
import 'calls.dart';
import 'home_page.dart';
import 'colors.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

final tabs = [
  const HomePage(),
  const ReelsPage(),
  const CallPage(),
];

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: lightGrey,
        title: Text(
          'WhatsGram',
          style: TextStyle(
            color: white,
            // letterSpacing: 2,
            fontSize: 28,
          ),
        ),
        actions: [
          // Image.asset('assets/images/puff.jpg'),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.camera_alt_outlined,
              color: white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.search,
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
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: lightGrey,
        selectedItemColor: green,
        unselectedItemColor: lighterGrey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_outlined,
              ),
              label: 'Chats'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.video_library),label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.call),label: 'Calls')
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
