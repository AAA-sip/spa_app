import 'package:flutter/material.dart';

class AdditionalServicesSection extends StatelessWidget {
  const AdditionalServicesSection({super.key});

  @override
  Widget build(_) => Column(
    spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Text(
          'Дополнительные услуги',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 369,
        child: ListView.separated(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, _) => SizedBox(width: 16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, int index) {
            if (index == 0 || index == 3) {
              return SizedBox();
            }
            return _buildServiceCard();
          },
        ),
      ),
    ],
  );

  Widget _buildServiceCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 254,
      height: 349,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image(
              image: AssetImage('assets/images/hero.jpg'),
              width: 254,
              height: 164,
              fit: BoxFit.fill,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Классический расслабляющий массаж',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Идеален для снятия усталости и восстановления энергии',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 12),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Icon(Icons.access_time, size: 16, color: Colors.orange),
                    Text('2 часа', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
              top: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '5 000 ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.orange),
                    foregroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: Icon(Icons.add, color: Colors.orange),
                  label: const Text('Добавить'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
