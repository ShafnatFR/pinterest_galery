import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/dashboard_tile.dart';

class DashboardScreen extends StatelessWidget {
  final Function(int)? onLayoutChanged;

  const DashboardScreen({super.key, this.onLayoutChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          if (onLayoutChanged != null)
            PopupMenuButton<int>(
              onSelected: onLayoutChanged,
              itemBuilder: (context) => [
                const PopupMenuItem(value: 0, child: Text('Masonry Grid')),
                const PopupMenuItem(value: 1, child: Text('Staggered Grid')),
                const PopupMenuItem(value: 2, child: Text('Sliver Grid')),
                const PopupMenuItem(value: 3, child: Text('Dashboard')),
              ],
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, Shafnat!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Bagaimana kabarmu hari ini?',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple[400]!, Colors.purple[300]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Misi Utama',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        Text(
                          '"Gudang pinterest berjalan!"',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        LinearProgressIndicator(
                          value: 0.75,
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '75% Selesai!',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),

                const StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1.7,
                  child: DashboardTile(
                    title: 'Pengunjung konten anda',
                    icon: Icons.people_alt_rounded,
                    color: Colors.blue,
                    value: '100',
                  ),
                ),
                const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.8,
                  child: DashboardTile(
                    title: 'Penghasilan',
                    icon: Icons.payments_rounded,
                    color: Colors.green,
                    value: 'Rp 100.000',
                  ),
                ),
                const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.8,
                  child: DashboardTile(
                    title: 'Followers baru',
                    icon: Icons.person_add_rounded,
                    color: Colors.orange,
                    value: '10',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
