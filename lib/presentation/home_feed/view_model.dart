import 'package:flutter/material.dart';

import '../../di/init.dart';
import '../../domain/entities/product.dart';
import '../../domain/use_cases/product/get_products.dart';

part 'state.dart';

class HomeFeedViewModel extends ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase = sl<GetProductsUseCase>();
  HomeFeedState _state = HomeFeedInitial();

  HomeFeedState get state => _state;

  /// Список продуктов
  Future<void> fetchProducts() async {
    _state = HomeFeedLoading();
    notifyListeners();
    try {
      final products = await _getProductsUseCase.call();
      _state = HomeFeedLoaded(products: products);
    } catch (e) {
      _state = HomeFeedError(error: e.toString());
    }
    notifyListeners();
  }
}
