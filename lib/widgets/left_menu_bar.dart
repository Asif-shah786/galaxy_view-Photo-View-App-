import 'package:flutter/material.dart';

class LeftMenuBar extends StatelessWidget {
  const LeftMenuBar(this.videosCount , this.photosCount, {Key? key}) : super(key: key);
  final int photosCount;
  final int videosCount;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
      bottomRight: Radius.circular(20)),
    ),
      backgroundColor: Colors.white70,
        child: ListView(
      children: [
        DrawerHeader(
          curve: Curves.fastLinearToSlowEaseIn,
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
            borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(20)),
            color: Colors.blueAccent,
          ),
        ),
        buildMenuListTile(title: 'Videos', value: videosCount.toString(), leadingIcon: const Icon(Icons.video_library,size: 20,)),
        buildMenuListTile(title: 'Photos', value: photosCount.toString(), leadingIcon: const Icon(Icons.photo_album,size: 20,)),
      ],
    ));
  }

  Widget buildMenuListTile({required Icon leadingIcon, required String value, required String  title}){
    TextStyle _style = const TextStyle(
    color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
    return ListTile(
      iconColor: Colors.blueAccent,
      horizontalTitleGap: 0,
      dense: true,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
      minVerticalPadding: 2,
      leading: leadingIcon,
      title: Text(title, style: _style,),
      trailing: Text(value),
    );
  }
}
