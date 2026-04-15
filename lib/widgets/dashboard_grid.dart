import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/image_item.dart';

class DashboardGridWidget extends StatelessWidget {
  final List<ImageItem> items;

  const DashboardGridWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: StaggeredGrid.count(
        crossAxisCount: 6,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(items.length, (index) {
          final item = items[index];

          // PATTERN LOGIC
          if (index == 0) {
            // Hero card (Banner)
            return StaggeredGridTile.count(
              crossAxisCellCount: 6,
              mainAxisCellCount: 3,
              child: _DashboardCard(
                item: item,
                title: 'Featured Story',
                color: Colors.deepPurple,
                isLarge: true,
              ),
            );
          } else if (index % 12 == 0) {
            // Full width info card
            return StaggeredGridTile.count(
              crossAxisCellCount: 6,
              mainAxisCellCount: 2,
              child: _DashboardCard(
                item: item,
                title: 'Weekly Roundup',
                color: Colors.blueAccent,
                isLarge: true,
              ),
            );
          } else if (index % 7 == 0) {
            // Tall double column
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: _DashboardCard(
                item: item,
                title: 'Trends',
                color: Colors.orange,
              ),
            );
          } else if (index % 4 == 0) {
            // Wide double column
            return StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: _DashboardCard(
                item: item,
                title: 'Recommended',
                color: Colors.teal,
              ),
            );
          } else {
            // Standard small card
            return StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: _DashboardCard(
                item: item,
                title: 'Card $index',
                color: Colors.grey,
              ),
            );
          }
        }),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final ImageItem item;
  final String title;
  final Color color;
  final bool isLarge;

  const _DashboardCard({
    required this.item,
    required this.title,
    required this.color,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
          ),
          
          // Gradient Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.8),
                  ],
                  stops: const [0, 0.4, 0.7, 1],
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(isLarge ? 20 : 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLarge)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'SPECIAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isLarge ? 20 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isLarge) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Discover the future of high-fidelity layouts in Flutter.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),

          // Action Button Icon
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
