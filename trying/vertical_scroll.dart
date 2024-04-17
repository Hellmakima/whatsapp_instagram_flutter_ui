import 'package:flutter/material.dart';

class CurrentImage extends StatelessWidget {
  final String assetPath;

  const CurrentImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 800,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover, // Adjust fit as needed
        ),
      ),
    );
  }
}

class ScrollableImageViewer extends StatelessWidget {
  final List<String> imageAssetPaths;

  const ScrollableImageViewer({super.key, required this.imageAssetPaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imageAssetPaths.length,
        itemBuilder: (context, index) => CurrentImage(
          assetPath: imageAssetPaths[index],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ScrollableImageViewer(
      imageAssetPaths: [
        "assets/puff.jpg", // Replace with your asset paths
        "assets/surp.jpg",
        "assets/smile.jpg",
        "assets/puff.jpg", // Replace with your asset paths
        "assets/surp.jpg",
        "assets/smile.jpg",
        "assets/puff.jpg", // Replace with your asset paths
        "assets/surp.jpg",
        "assets/smile.jpg",
      ],
    ),
  ));
}
