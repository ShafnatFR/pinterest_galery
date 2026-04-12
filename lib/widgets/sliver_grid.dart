import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';
import 'image_tile.dart';

class SliverGridWidget extends StatelessWidget {
  final List<ImageItem> images;

  const SliverGridWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Sliver Masonry Grid'),
          floating: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          // API #13: SliverMasonryGrid.count() - Sebuah sliver yang menampilkan item dalam tata letak masonry.
          sliver: SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemBuilder: (context, index) {
              return ImageTile(image: images[index]);
            },
            childCount: images.length,
          ),
        ),
      ],
    );
  }
}
