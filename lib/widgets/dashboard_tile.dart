import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String? value;

  const DashboardTile({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          if (value != null) ...[
            const SizedBox(height: 4),
            Text(
              value!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
