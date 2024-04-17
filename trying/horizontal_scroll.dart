import 'package:flutter/material.dart';

class CurrentImage extends StatelessWidget {
  final String assetPath;

  const CurrentImage({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover, // Adjust fit as needed
      ),
    );
  }
}

class ScrollableImageViewer extends StatefulWidget {
  final List<String> imageAssetPaths;

  const ScrollableImageViewer({Key? key, required this.imageAssetPaths})
      : super(key: key);

  @override
  State<ScrollableImageViewer> createState() => _ScrollableImageViewerState();
}

class _ScrollableImageViewerState extends State<ScrollableImageViewer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.imageAssetPaths.length,
        itemBuilder: (context, index) => CurrentImage(
          assetPath: widget.imageAssetPaths[index],
        ),
        onPageChanged: (value) => setState(() => _currentIndex = value),
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
      ],
    ),
  ));
}
