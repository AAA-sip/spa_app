import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              'assets/icons/solar.svg',
              '3-ех этапное парение с вениками',
              20,
            ),
            _buildIncludedItem(
              'assets/icons/solar.svg',
              'Сухой пилинг тела',
              20,
            ),
            _buildIncludedItem(
              'assets/icons/soap.svg',
              'OIL массаж на все тело 40 минут',
              20,
            ),
            _buildIncludedItem(
              'assets/icons/shower.svg',
              'Мыльная помывка или скрабирование тела',
              20,
            ),
            _buildIncludedItem('assets/icons/boal.svg', 'Чайная церемония', 20),
          ],
        ),
      ],
    ),
  );

  Widget _buildIncludedItem(String iconAsset, String text, double size) =>
      Material(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade100, width: 1),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 16.0,
              bottom: 14.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: <Widget>[
                SvgPicture.asset(iconAsset, width: size, height: size),
                Expanded(child: Text(text, style: TextStyle(fontSize: 12))),
              ],
            ),
          ),
        ),
      );
}
