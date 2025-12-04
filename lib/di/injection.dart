part of 'init.dart';

/// Инстанс сервис-локатора
final sl = GetIt.instance;

final regLS = sl.registerLazySingleton;

final regS = sl.registerSingleton;

final regF = sl.registerFactory;

void configureDependencies() {
  regLS(ProductService.new);
  regLS(ProductMapper.new);
  regLS(
    () => ProductRepositoryImpl(
      productService: sl<ProductService>(),
      productMapper: sl<ProductMapper>(),
    ),
  );
}
