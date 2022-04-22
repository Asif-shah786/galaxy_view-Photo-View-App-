import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  static String routName = '/video';
  const VideoScreen({Key? key, required this.videoFile}) : super(key: key);
  final Future<File?> videoFile;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _loadVideoFile();
  }
  void _loadVideoFile() async {
    try {
      final video = await widget.videoFile;
      _controller = VideoPlayerController.file(video!)
        ..setLooping(true)
        ..initialize().then(
          (_) => setState(() => initialized = true),
        );
    } catch (e){
      showDialog(context: context, builder: (BuildContext context) => AlertDialog(
        content: Text(e.toString()),
        actions: const [Text('Ok')],
      ),);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Video Player'),
          centerTitle: true,
        ),
        body: initialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: initialized
            ? Container(
          padding: EdgeInsets.only(left: 40, bottom: 30),
          alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                  onPressed: () {
                    if (_controller.value.isPlaying) {
                      setState(() {
                        _controller.pause();
                      });
                    } else {
                      setState(() {
                        _controller.play();
                      });
                    }
                  },
                  child: Icon(_controller.value.isPlaying
                      ? Icons.pause_sharp
                      : Icons.play_arrow_sharp),
                ),
            )
            : null,
      ),
    );
  }
}
