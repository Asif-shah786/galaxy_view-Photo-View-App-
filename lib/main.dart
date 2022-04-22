import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_view/views/home_screen/home_screen.dart';
import 'package:galaxy_view/widgets/CustomButton.dart';
import 'package:photo_manager/photo_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galaxy Gallery photos and videos Viewer',
      home: SafeArea(
        child: Scaffold(
          body : Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Click this button to open \ngallery images and videos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    const SizedBox(height: 20,),
                    CustomButton(title: 'Open Gallery', onPressed: () async {
                      final permitted = await PhotoManager.requestPermissionExtend();
                      if(permitted != null && permitted == false) {
                        return;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const HomePage(),
                        ),
                      );
                    },),
                  const SizedBox(height: 100,)
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


