import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../../domain/use_cases/product/get_products.dart';

part 'state.dart';

class HomeFeedViewModel extends ChangeNotifier {
  HomeFeedViewModel({required this.getProductsUseCase});

  final GetProductsUseCase getProductsUseCase;

  HomeFeedState _state = HomeFeedInitial();

  HomeFeedState get state => _state;
  int get _pageSize => 20;

  /// Список продуктов
  Future<void> fetchProducts() async {
    _state = HomeFeedLoading();
    notifyListeners();
    try {
      final products = await getProductsUseCase.call();
      _state = HomeFeedLoaded(
        products: products,
        isLoadingMore: false,
        canLoadMore: products.length == _pageSize,
        page: 1,
      );
    } catch (e) {
      _state = HomeFeedError(error: e.toString());
    }
    notifyListeners();
  }

  /// Обработка пагинации
  void handlePagination(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.pixels >
            scrollNotification.metrics.maxScrollExtent * 0.9 &&
        _state is HomeFeedLoaded) {
      _loadMoreProducts();
    }
  }

  Future<void> _loadMoreProducts() async {
    if (_state is! HomeFeedLoaded) return;
    final currentState = _state as HomeFeedLoaded;
    _state = currentState.copyWith(isLoadingMore: true);
    notifyListeners();

    /// Тут должна быть логика с пагинацией (skip/take). Но эндпоинты fake store api не поддерживают пагинацию.
    /// поэтому просто загружаем те же продукты заново и добавляем в список
    try {
      final products = await getProductsUseCase.call();
      _state = currentState.copyWith(
        products: [...currentState.products, ...products],
        isLoadingMore: false,
        canLoadMore: products.length == _pageSize,
        page: currentState.page + 1,
      );
    } catch (e) {
      _state = currentState.copyWith(isLoadingMore: false);
    }
    notifyListeners();
  }
}
