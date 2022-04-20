import 'package:flutter/material.dart';
import 'package:galaxy_view/widgets/asset_thumbnail.dart';
import 'package:photo_manager/photo_manager.dart';

class HomePage extends StatefulWidget {
  static String routName = '/Home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AssetEntity> assets = [];

  _fetchAssists() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;
    final recentAssets =
        await recentAlbum.getAssetListPaged(page: 0, size: 100);
    setState(() {
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
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Gallery'),
          ),
          body: GridView.builder(
            itemCount: assets.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (_, index) {
                return AssetThumbnail(asset: assets[index]);
              })),
    );
  }
}
