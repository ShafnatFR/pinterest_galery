import 'package:flutter/material.dart';
import 'package:pinterest_galery/screens/dashboard_screen.dart';
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
  int _currentLayout = 0;

  final images = dummyImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentLayout == 2 || _currentLayout == 3)
          ? null
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
                    const PopupMenuItem(value: 0, child: Text('Masonry Grid')),
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Staggered Grid'),
                    ),
                    const PopupMenuItem(value: 2, child: Text('Sliver Grid')),
                    const PopupMenuItem(value: 3, child: Text('Dashboard')),
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
      case 3:
        return DashboardScreen(
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
