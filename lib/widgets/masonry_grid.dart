import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';
import 'image_tile.dart';

class MasonryGrid extends StatelessWidget {
  final List<ImageItem> images;

  const MasonryGrid({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    // API #1: MasonryGridView.count() - Creates a grid with a fixed number of tiles in the cross axis.
    return MasonryGridView.count(
      // API #2: crossAxisCount - The number of columns in the grid.
      crossAxisCount: 2,
      // API #3: mainAxisSpacing - The number of logical pixels between each item along the main axis.
      mainAxisSpacing: 8,
      // API #4: crossAxisSpacing - The number of logical pixels between each item along the cross axis.
      crossAxisSpacing: 8,
      // API #5: padding - Empty space around the whole grid.
      padding: const EdgeInsets.all(8),
      // API #6: itemCount - The total number of items to display.
      itemCount: images.length,
      // API #7: itemBuilder - The builder function for each grid item.
      itemBuilder: (context, index) {
        return ImageTile(image: images[index]);
      },
    );
  }
}
