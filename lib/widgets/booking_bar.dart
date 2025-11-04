import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/providers/price_provider.dart';

class BookingBar extends ConsumerWidget {
  const BookingBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int price = ref.watch(priceProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Text(
                  '$price ',
                  key: ValueKey<int>(price),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Image.asset('assets/icons/gold.png', width: 20, height: 20),
            ],
          ),
          SizedBox(
            height: 48,
            width: 233,
            child: FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Бронирован!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Бронировать',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
