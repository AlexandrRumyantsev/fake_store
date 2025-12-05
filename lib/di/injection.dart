part of 'init.dart';

/// Инстанс сервис-локатора
final sl = GetIt.instance;

final regLS = sl.registerLazySingleton;

final regS = sl.registerSingleton;

final regF = sl.registerFactory;

void configureDependencies() {
  API.initialize();
  regLS(ProductService.new);
  regLS(ProductMapper.new);
  regLS<ProductRepository>(
    () => ProductRepositoryImpl(
      productService: sl<ProductService>(),
      productMapper: sl<ProductMapper>(),
    ),
  );
  regLS(() => GetProductsUseCase(productRepository: sl<ProductRepository>()));
  regLS(() => HomeFeedViewModel(
    getProductsUseCase: sl<GetProductsUseCase>(),
  ));
}
