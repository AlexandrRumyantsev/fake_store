part of 'view_model.dart';

sealed class HomeFeedState {}

class HomeFeedInitial extends HomeFeedState {}

class HomeFeedLoading extends HomeFeedState {}

class HomeFeedLoaded extends HomeFeedState with EquatableMixin {
  final List<ProductEntity> products;
  final bool isLoadingMore;
  final bool canLoadMore;
  final int page;

  HomeFeedLoaded({
    required this.products,
    required this.isLoadingMore,
    required this.canLoadMore,
    required this.page,
  });

  HomeFeedLoaded copyWith({
    List<ProductEntity>? products,
    bool? isLoadingMore,
    bool? canLoadMore,
    int? page,
  }) {
    return HomeFeedLoaded(
      products: products ?? this.products,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [products, isLoadingMore, canLoadMore, page];
}

class HomeFeedError extends HomeFeedState {
  final String error;
  HomeFeedError({required this.error});
}
