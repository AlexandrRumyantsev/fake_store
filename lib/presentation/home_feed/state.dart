part of 'view_model.dart';

sealed class HomeFeedState {}
class HomeFeedInitial extends HomeFeedState {}
class HomeFeedLoading extends HomeFeedState {}
class HomeFeedLoaded extends HomeFeedState {
  final List<ProductEntity> products;
  HomeFeedLoaded({required this.products});
}
class HomeFeedError extends HomeFeedState {
  final String error;
  HomeFeedError({required this.error});
}
