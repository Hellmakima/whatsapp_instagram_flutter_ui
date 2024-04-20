
import 'package:flutter/material.dart';
import 'package:kk/post.dart';
import 'colors.dart';

List<List<String>> posts = [
  ["joshi.NIM", "new Painting", "color.mp4", "puff.jpg"],
  ["ahijeetPOW", "sleepy Head Sarya", "v2.mp4", "surp.jpg"],
  ["tf_matters", "the boys having fun", "v1.mp4", "smile.jpg"]
];

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: darkGrey,
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) =>
                // Text(posts[index][0], style: TextStyle(color: lighterGrey),)
              Post(
                user: posts[index][0],
                caption: posts[index][1],
                postAsset: posts[index][2],
                profileAsset: posts[index][3],
              )
        ),
      ),
    );
  }
}
