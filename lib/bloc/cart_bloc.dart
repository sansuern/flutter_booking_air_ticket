import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/cart.dart';
import '../models/user.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(cart: [])) {
    on<CartAdd>(_cartAdd);
    on<CartRemove>(_cartRemove);
    on<CartEdit>(_cartEdit);
  }

  FutureOr<void> _cartAdd(CartAdd event, Emitter<CartState> emit) async {
    final addCart = List<CartModel>.from(state.cart)..add(event.booking);
    emit(state.copyWith(cart: addCart));
    // emit(CartState(cart: addCart));
  }

  FutureOr<void> _cartRemove(CartRemove event, Emitter<CartState> emit) async {
    // print(event.index);
    // final RemoveCart = List<CartModel>.from(state.cart)
    //     .removeWhere((index) => event.index);
    // emit(state.copyWith(cart: RemoveCart));
  }

  FutureOr<void> _cartEdit(CartEdit event, Emitter<CartState> emit) async {}
}
