import 'dart:math';
import '../models/image_item.dart';

List<ImageItem> get dummyImages {
  final random = Random();
  return List.generate(
    35,
    (index) => ImageItem(
      id: 'img-$index',
      imageId: (index + 1) * 5, // Just some variety in IDs
      width: 400,
      height: 300 + random.nextInt(500), // Random height between 300-800
    ),
  );
}
