import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class PriceNotifier extends StateNotifier<int> {
  PriceNotifier() : super(28000);

  void add(int amount) {
    state = state + amount;
  }
}

final StateNotifierProvider<PriceNotifier, int> priceProvider =
    StateNotifierProvider<PriceNotifier, int>((Ref ref) {
      return PriceNotifier();
    });
