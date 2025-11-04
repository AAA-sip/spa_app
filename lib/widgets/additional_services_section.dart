import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spa_app/providers/price_provider.dart';

class AdditionalServicesSection extends ConsumerWidget {
  const AdditionalServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Дополнительные услуги',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 369,
        child: ListView.separated(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, _) => const SizedBox(width: 16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, int index) {
            if (index == 0 || index == 3) {
              return const SizedBox();
            }
            return _buildServiceCard(ref);
          },
        ),
      ),
    ],
  );

  Widget _buildServiceCard(WidgetRef ref) {
    return Material(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12),
                    Text(
                      'Классический расслабляющий массаж',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Идеален для снятия усталости и восстановления энергии',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/alarm.svg',
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 8),
                        Text('2 часа', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          '5 000 ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        Image.asset(
                          'assets/icons/gold.png',
                          width: 16,
                          height: 16,
                        ),
                      ],
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        foregroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(Icons.add, color: Colors.orange),
                      label: const Text('Добавить'),
                      onPressed: () {
                        ref.read(priceProvider.notifier).add(5000);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
