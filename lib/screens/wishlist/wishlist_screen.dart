import 'package:ecommerce_app/blocs/bloc/wishlist_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishlistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WishlistLoaded) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.4,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return Center(
                child: ProductCard(
                  product: state.products[index],
                  widthFactor: 1.1,
                  leftPosition: 100,
                  isWishList: true,
                ),
              );
            },
          );
        } else {
          return Text('Something went wrong');
        }
      }),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
