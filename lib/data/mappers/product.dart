import '../../domain/entities/product.dart';
import '../models/response/product.dart';

class ProductMapper {
  static ProductEntity toEntity(ProductModel model) => ProductEntity(
        id: model.id,
        title: model.title,
        price: model.price,
        description: model.description,
        category: model.category,
        imageUrl: model.imageUrl,
      );
}
