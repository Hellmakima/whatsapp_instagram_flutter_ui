
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) =>
          MyVideo(asset: 'v1.mp4')
        )
    );
  }
}

class MyVideo extends StatefulWidget {
  final String asset;
  const MyVideo({super.key, required this.asset});

  @override
  State<MyVideo> createState() => _VideoState();

}

class _VideoState extends State<MyVideo> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/${widget.asset}');
    _controller?.initialize().then((_) => {
      _controller?.play(),
      _controller?.setLooping(true),
      _controller?.setVolume(0),
      setState(() { })
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: _controller!.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            // aspectRatio: 0.75,
            child: VideoPlayer(_controller!),
          )
          : CircularProgressIndicator(),
        ),
        SizedBox(height: 1100,)
      ],
    );
  }
}

