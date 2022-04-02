import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart();

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subTotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    } else
      return 10.0;
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subTotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get subtotalstring => subTotal.toStringAsFixed(2);

  String get totalstring => total(subTotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFestring => deliveryFee(subTotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);

  List<Product> products = [
    Product(
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1606168094336-48f205276929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1506802913710-40e2e66339c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1481671703460-040cb8a2d909?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1504310578167-435ac09e69f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1623002071634-54590669fe3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fHNtb290aGllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
  ];

  @override
  List<Object?> get props => [];
}
