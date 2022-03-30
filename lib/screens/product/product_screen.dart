import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/hero_caraosel_card.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Product Information',
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                      'The meaning of FOOD is material consisting essentially of protein, carbohydrate, and fat used in the body of an organism to sustain growth, repair, and vital processes and to furnish energy; also : such food together with supplementary substances (such as minerals, vitamins, and condiments ).',
                      style: Theme.of(context).textTheme.bodyText1),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Delivery Information',
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                      'The meaning of FOOD is material consisting essentially of protein, carbohydrate, and fat used in the body of an organism to sustain growth, repair, and vital processes and to furnish energy; also : such food together with supplementary substances (such as minerals, vitamins, and condiments).',
                      style: Theme.of(context).textTheme.bodyText1),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'ADD TO CARD',
                    style: Theme.of(context).textTheme.headline3,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
