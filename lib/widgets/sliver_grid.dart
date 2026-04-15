import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';
import 'image_tile.dart';

class SliverGridWidget extends StatelessWidget {
  final List<ImageItem> images;
  final Function(int) onLayoutChanged;

  const SliverGridWidget({
    super.key,
    required this.images,
    required this.onLayoutChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Sliver Masonry Grid'),
          floating: true,
          actions: [
            PopupMenuButton<int>(
              initialValue: 2,
              onSelected: onLayoutChanged,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0,
                  child: Text('Masonry Grid'),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text('Staggered Grid'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Sliver Grid'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text('Dashboard'),
                ),
              ],
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
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
