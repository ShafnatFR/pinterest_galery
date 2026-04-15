import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';
import 'image_tile.dart';

class MasonryGrid extends StatelessWidget {
  final List<ImageItem> images;

  const MasonryGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ImageTile(image: images[index]);
      },
    );
  }
}
