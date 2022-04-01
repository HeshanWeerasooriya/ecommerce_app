import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>((event, emit) async {
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const WishlistLoaded(products: <Product>[]));
      } catch (_) {
        emit(WishlistError());
      }
    });
    on<AddWishlistProduct>((event, emit) async {
      if (state is WishlistLoaded) {
        final state = this.state as WishlistLoaded;
        try {
          emit(WishlistLoaded(
            products: List.from(state.products)..add(event.product),
          ));
        } on Exception {
          emit(WishlistError());
        }
      }
    });
    on<RemoveWishlistProduct>((event, emit) async {
      if (state is WishlistLoaded) {
        final state = this.state as WishlistLoaded;
        try {
          emit(WishlistLoaded(
            products: List.from(state.products)..remove(event.product),
          ));
        } on Exception {
          emit(WishlistError());
        }
      }
    });
  }
}
