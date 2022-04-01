import 'package:ecommerce_app/config/app_route.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc/wishlist_bloc.dart';
import 'screens/home/home_screen.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishlist()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myTheme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
