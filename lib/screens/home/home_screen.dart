import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/hero_caraosel_card.dart';
import '../../widgets/product_carousel.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'You  Bay'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((Category) => HeroCarouselCard(category: Category))
                  .toList(),
            ),
            SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(
                products: Product.products
                    .where((product) => product.isRecommended)
                    .toList()),
            SectionTitle(title: 'MOST POPULAR'),
            ProductCarousel(
                products: Product.products
                    .where((product) => product.isPopular)
                    .toList()),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
