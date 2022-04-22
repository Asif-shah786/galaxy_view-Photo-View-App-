import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_view/widgets/asset_thumbnail.dart';
import 'package:galaxy_view/widgets/left_menu_bar.dart';
import 'package:photo_manager/photo_manager.dart';

import 'body.dart';

class HomePage extends StatefulWidget {
  static String routName = '/Home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AssetEntity> assets = [];
  int videos = 0;
  int photos = 0;

  _fetchAssists() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    print(albums.length);
    final recentAlbum = albums.first;
    final recentAssets =
        await recentAlbum.getAssetListPaged(page: 0, size: 1000000);
    setState(() {
      recentAssets.forEach((element) {
        if (element.type == AssetType.video) {
          videos++;
        } else {
          photos++;
        }
      });
      assets = recentAssets;
    });
  }

  @override
  void initState() {
    _fetchAssists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: LeftMenuBar(videos, photos),
          appBar: AppBar(
            title: const Text('Gallery'),
            actions: [buildDropdownButton()],
          ),
          body: buildBody(assets)),
    );
  }
  DropdownButtonHideUnderline buildDropdownButton() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        alignment: AlignmentDirectional.bottomEnd,
        hint: const Text(
          'Sort',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        items: _listDropDownMenuItems(),
        onChanged: onChanged,
      ),
    );
  }

  List<DropdownMenuItem> _listDropDownMenuItems() {
    return <String>['Oldest first', 'Newest first']
        .map<DropdownMenuItem<String>>((String value) =>
        DropdownMenuItem(value: value, child: Text(value)))
        .toList();
  }

  void onChanged(value) {
    switch (value) {
      case 'Newest first':
        assets.sort((a, b) => b.createDateTime.compareTo(a.createDateTime));
        setState(() {});
        break;
      case 'Oldest first':
        assets.sort((a, b) => a.createDateTime.compareTo(b.createDateTime));
        setState(() {});
        break;
      default:
        if (kDebugMode) {
          print('Default');
        }
    }
  }

}
// Future sortByDateTime() {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) => AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       title: const Text('Sort By', textAlign: TextAlign.center, ),
//       actionsAlignment: MainAxisAlignment.center,
//       actions: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child:
//         ),
//       ],
//     ),
//   );
// }