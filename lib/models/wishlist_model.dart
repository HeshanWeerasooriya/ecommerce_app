import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist(this.products);

  @override
  List<Object?> get props => [products];
}
