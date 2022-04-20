import 'package:flutter/material.dart';
import 'package:galaxy_view/views/home_screen.dart';
import 'package:photo_manager/photo_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Galaxy Gallery photos and videos Viewer',
      home: SafeArea(
        child: Scaffold(
          body : Builder(
            builder: (context) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Click this button to open \ngallery Images and Videos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    TextButton(
                      style: TextButton.styleFrom(
                        enableFeedback: true,
                        backgroundColor: Colors.cyanAccent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.cyanAccent)
                        ),
                      ),
                    onPressed: () async {
                      final permitted = await PhotoManager.requestPermissionExtend();
                      if(permitted != null && permitted == false) {
                        return;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                      );
                    }, child: const Text('Open Gallery', style: TextStyle(color: Colors.white),),),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );


  }
}

