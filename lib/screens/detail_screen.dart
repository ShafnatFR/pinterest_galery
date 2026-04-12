import 'package:flutter/material.dart';
import '../models/image_item.dart';

class DetailScreen extends StatelessWidget {
  final ImageItem image;

  const DetailScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.id),
      ),
      body: Center(
        child: Hero(
          tag: 'hero-${image.id}',
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4,
            child: Image.network(
              image.imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
