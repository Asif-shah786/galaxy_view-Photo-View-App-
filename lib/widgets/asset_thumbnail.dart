import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_view/views/image_screen.dart';
import 'package:photo_manager/photo_manager.dart';

import '../views/video_screen.dart';

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({Key? key, required this.asset}) : super(key: key);
  final AssetEntity asset;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailData,
      builder: (
        BuildContext context,
        AsyncSnapshot<Uint8List?> snapshot,
      ) {
        final bytes = snapshot.data;
        if (bytes == null) {
          return const CircularProgressIndicator();
        } else
        {
          return InkWell(
            onTap: (){
              if(asset.type == AssetType.image){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ImageScreen(imageFile: asset.file),)
                );
              }
              if(asset.type == AssetType.video){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => VideoScreen(videoFile : asset.file),)
                );
              }

            },
            child: Stack(
              children:  [
                Positioned.fill(
                  child: Image.memory(
                  bytes,
                  fit: BoxFit.cover,
              ),
                ),
              if(asset.type == AssetType.video)
                Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.white,),
                  ),
                )
              ]
            ),
          );
        }
      },
    );
  }
}
