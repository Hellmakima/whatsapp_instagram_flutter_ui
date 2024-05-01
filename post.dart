import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'colors.dart';

class Post extends StatefulWidget {
  final String user, caption, postAsset, profileAsset, isVideo;

  const Post({super.key, required this.user, required this.caption, required this.postAsset, required this.profileAsset, required this.isVideo});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked = false;
  bool saved = false;

  Icon likeIcon = Icon(Icons.favorite_border_outlined,color: white,size: 35,);
  Icon saveIcon = Icon(Icons.bookmark_border,color: white,size: 35,);

  @override
  Widget build(BuildContext context) {
    // print("assets/$asset");
    return Column(

      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/${widget.profileAsset}"),
            ),
            const SizedBox(width: 15),
            Text(widget.user,
                style: TextStyle(
                    color: lighterGrey,
                  fontSize: 20
                )
            ),
          ],
        ),
        const SizedBox(height: 15),
        (widget.isVideo == "1")? MyVideo(asset: widget.postAsset):
            Image.asset("assets/${widget.postAsset}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (){
                      setState(() {
                        if (!liked) {
                          likeIcon = const Icon(Icons.favorite,color: Colors.red,size: 35,);
                        } else {
                          likeIcon = Icon(Icons.favorite_border, color: white, size: 35,);
                        }
                        liked = !liked;
                      });
                    },
                    icon: likeIcon
                ),
                Icon(Icons.mode_comment_outlined,size: 35,color: white,),
                const SizedBox(width: 10,),
                Transform.rotate(angle: -0.6,
                child: Icon(Icons.send,size: 35,color: white))
              ],
            ),
            IconButton(
                onPressed: (){
                  setState(() {
                    if (!saved) {
                      saveIcon = Icon(Icons.bookmark,color: white,size: 35,);
                    } else {
                      saveIcon = Icon(Icons.bookmark_border,color: white, size: 35,);
                    }
                    saved = !saved;
                  });
                },
                icon: saveIcon
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("10.2k",style: TextStyle(color: white,fontSize: 18)),
            Text(widget.caption,style: TextStyle(color: white,fontSize: 20)),
          ],
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}

class MyVideo extends StatefulWidget {
  final String asset;
  const MyVideo({super.key, required this.asset});

  @override
  State<MyVideo> createState() => _VideoState();
}

//video

class _VideoState extends State<MyVideo> {
  VideoPlayerController? _controller;
  @override
  void initState() {
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
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller!.value.isInitialized
          ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            // aspectRatio: 0.75,
            child: VideoPlayer(_controller!),
      )
          : const CircularProgressIndicator(),
    );
  }
}


