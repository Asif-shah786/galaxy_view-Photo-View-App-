import 'package:flutter/material.dart';

class LeftMenuBar extends StatelessWidget {
  const LeftMenuBar(this.videosCount , this.photosCount, {Key? key}) : super(key: key);
  final int photosCount;
  final int videosCount;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
               ListTile(
                 contentPadding: EdgeInsets.only(left: 0),
                 title: Text(
                  'Gallery details',
                  style: TextStyle(
                    height: 3,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
        ),
        buildMenuListTile(title: 'Videos', value: videosCount.toString()),
        buildMenuListTile(title: 'Photos', value: photosCount.toString()),
      ],
    ));
  }

  Widget buildMenuListTile({required String value, required String  title}){
    TextStyle _style = const TextStyle(
    color: Colors.black,
      fontWeight: FontWeight.w500,
    );
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
      minVerticalPadding: 2,
      leading: Text(title, style: _style,),
      trailing: Text(value),
    );
  }
}
