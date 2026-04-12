import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/masonry_grid.dart';
import '../widgets/staggered_grid.dart';
import '../widgets/sliver_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentLayout = 0; // 0 = Masonry, 1 = Staggered, 2 = Sliver (Tata Letak)

  final images = dummyImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentLayout == 2
          ? null // Grid Sliver memiliki AppBar-nya sendiri
          : AppBar(
              title: const Text('Pinterest Gallery'),
              actions: [
                PopupMenuButton<int>(
                  onSelected: (value) {
                    setState(() {
                      _currentLayout = value;
                    });
                  },
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
                  ],
                ),
              ],
            ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_currentLayout) {
      case 0:
        return MasonryGrid(images: images);
      case 1:
        return StaggeredGridWidget(images: images);
      case 2:
        return SliverGridWidget(
          images: images,
          onLayoutChanged: (value) {
            setState(() {
              _currentLayout = value;
            });
          },
        );
      default:
        return MasonryGrid(images: images);
    }
  }
}
