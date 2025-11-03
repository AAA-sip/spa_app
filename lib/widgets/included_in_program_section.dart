import 'package:flutter/material.dart';

class IncludedInProgramSection extends StatelessWidget {
  const IncludedInProgramSection({super.key});

  @override
  Widget build(_) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: <Widget>[
        const Text(
          'Что входит в программу',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            _buildIncludedItem(
              Icons.wb_sunny,
              '3-ех этапное парение с вениками',
            ),
            _buildIncludedItem(Icons.spa, 'Сухой пилинг тела'),
            _buildIncludedItem(
              Icons.hot_tub,
              'OIL массаж на все тело 40 минут',
            ),
            _buildIncludedItem(
              Icons.bubble_chart,
              'Мыльная помывка или скрабирование тела',
            ),
            _buildIncludedItem(Icons.local_cafe, 'Чайная церемония'),
          ],
        ),
      ],
    ),
  );

  Widget _buildIncludedItem(IconData icon, String text) => Material(
    color: Colors.white,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.grey.shade50, width: 1),
    ),
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: 16.0,
          bottom: 14.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: <Widget>[
            Icon(icon, color: Colors.orange, size: 24),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
          ],
        ),
      ),
    ),
  );
}
