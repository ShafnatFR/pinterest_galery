import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';
import 'image_tile.dart';

class StaggeredGridWidget extends StatelessWidget {
  final List<ImageItem> images;

  const StaggeredGridWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      // API #8: StaggeredGrid.count() - Modern replacement for StaggeredGridView.countBuilder
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        // API #9: Children mapping - Logic replacement for staggeredTileBuilder
        children: List.generate(images.length, (index) {
          final image = images[index];
          
          if (index % 7 == 0) {
            // API #11: StaggeredGridTile.count() - Modern replacement for StaggeredTile.count
            // Takes crossAxisCellCount and mainAxisCellCount
            return StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: ImageTile(image: image),
            );
          } else if (index % 4 == 0) {
            // API #12: StaggeredGridTile.extent() - Modern replacement for StaggeredTile.extent
            // Takes crossAxisCellCount and a fixed mainAxisExtent in pixels
            return StaggeredGridTile.extent(
              crossAxisCellCount: 2,
              mainAxisExtent: 250,
              child: ImageTile(image: image),
            );
          } else {
            // API #10: StaggeredGridTile.fit() - Modern replacement for StaggeredTile.fit
            // Takes crossAxisCellCount and calculates main axis size based on child's natural size
            return StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: ImageTile(image: image),
            );
          }
        }),
      ),
    );
  }
}
