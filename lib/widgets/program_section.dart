import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({super.key});

  @override
  Widget build(_) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: <Widget>[ProgramAboutSection(), ProgramInfoSection()],
    ),
  );
}

class ProgramAboutSection extends StatelessWidget {
  const ProgramAboutSection({super.key});

  @override
  Widget build(_) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8,
    children: <Widget>[
      Text('911', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      Text(
        'Программа восстановления и релаксации',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

class ProgramInfoSection extends StatelessWidget {
  const ProgramInfoSection({super.key});

  @override
  Widget build(_) => Material(
    color: Colors.grey.shade50,
    clipBehavior: Clip.hardEdge,
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          spacing: 6,
          children: <Widget>[
            _buildInfoRow('alarm.svg', '2 часа', 16),
            _buildInfoRow(
              'gift.svg',
              '+ 2 часа в подарок (бассейн, джакузи, хамам)',
              17,
            ),
            _buildInfoRow('tshirt.svg', 'Возьмите купальник и плавки', 13),
          ],
        ),
      ),
    ),
  );

  Widget _buildInfoRow(String svgAsset, String text, double size) => Row(
    children: <Widget>[
      SvgPicture.asset('assets/icons/$svgAsset', width: size, height: size),
      const SizedBox(width: 16),
      Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
    ],
  );
}
