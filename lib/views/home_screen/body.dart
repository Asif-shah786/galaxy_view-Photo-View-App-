import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../widgets/asset_thumbnail.dart';

GridView buildBody(List<AssetEntity> assets) {
  return GridView.builder(
      itemCount: assets.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (_, index) {
        return AssetThumbnail(asset: assets[index]);
      });
}
