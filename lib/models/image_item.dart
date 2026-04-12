class ImageItem {
  final String id;
  final int imageId;
  final int width;
  final int height;
  
  const ImageItem({
    required this.id,
    required this.imageId,
    required this.width,
    required this.height,
  });
  
  String get imageUrl => 'https://picsum.photos/id/$imageId/$width/$height';
}
