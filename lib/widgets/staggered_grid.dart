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
      // API #8: StaggeredGrid.count() - Pengganti modern untuk StaggeredGridView.countBuilder
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        // API #9: Pemetaan anak (Children mapping) - Pengganti logika untuk staggeredTileBuilder
        children: List.generate(images.length, (index) {
          final image = images[index];
          
          if (index % 7 == 0) {
            // API #11: StaggeredGridTile.count() - Pengganti modern untuk StaggeredTile.count
            // Mengambil crossAxisCellCount dan mainAxisCellCount
            return StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: ImageTile(image: image),
            );
          } else if (index % 4 == 0) {
            // API #12: StaggeredGridTile.extent() - Pengganti modern untuk StaggeredTile.extent
            // Mengambil crossAxisCellCount dan mainAxisExtent tetap dalam piksel
            return StaggeredGridTile.extent(
              crossAxisCellCount: 2,
              mainAxisExtent: 250,
              child: ImageTile(image: image),
            );
          } else {
            // API #10: StaggeredGridTile.fit() - Pengganti modern untuk StaggeredTile.fit
            // Mengambil crossAxisCellCount dan menghitung ukuran sumbu utama berdasarkan ukuran alami anak
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
