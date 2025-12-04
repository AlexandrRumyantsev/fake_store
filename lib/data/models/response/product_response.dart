import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponseModel {
  final int id;
  final int userId;
  final List<ProductModel> products;

  ProductResponseModel({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}
