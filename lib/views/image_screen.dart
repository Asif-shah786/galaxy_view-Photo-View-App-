import 'dart:io';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  static String routName = '/Image';
  const ImageScreen({Key? key, required this.imageFile}) : super(key: key);
  final Future<File?> imageFile;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Photo Viewer'),),
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: FutureBuilder<File?>(
            future: imageFile,
            builder: (_, snapshot){
              final file = snapshot.data;
              if(file == null) return  Container();
              return Image.file(file);
            },
          ),
        ),
      ),
    );
  }
}
