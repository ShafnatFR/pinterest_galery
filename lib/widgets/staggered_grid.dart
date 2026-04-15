import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';
import 'image_tile.dart';

class StaggeredGridWidget extends StatelessWidget {
  final List<ImageItem> images;

  const StaggeredGridWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List.generate(images.length, (index) {
          final image = images[index];

          if (index % 7 == 0) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: ImageTile(image: image),
            );
          } else if (index % 4 == 0) {
            return StaggeredGridTile.extent(
              crossAxisCellCount: 2,
              mainAxisExtent: 250,
              child: ImageTile(image: image),
            );
          } else {
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
