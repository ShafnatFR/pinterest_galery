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
    // API #1: MasonryGridView.count() - Membuat kisi dengan jumlah ubin tetap pada sumbu silang.
    return MasonryGridView.count(
      // API #2: crossAxisCount - Jumlah kolom dalam kisi.
      crossAxisCount: 2,
      // API #3: mainAxisSpacing - Jumlah piksel logis di antara setiap item di sepanjang sumbu utama.
      mainAxisSpacing: 8,
      // API #4: crossAxisSpacing - Jumlah piksel logis di antara setiap item di sepanjang sumbu silang.
      crossAxisSpacing: 8,
      // API #5: padding - Ruang kosong di sekitar seluruh kisi.
      padding: const EdgeInsets.all(8),
      // API #6: itemCount - Jumlah total item yang akan ditampilkan.
      itemCount: images.length,
      // API #7: itemBuilder - Fungsi pembangun untuk setiap item kisi.
      itemBuilder: (context, index) {
        return ImageTile(image: images[index]);
      },
    );
  }
}
