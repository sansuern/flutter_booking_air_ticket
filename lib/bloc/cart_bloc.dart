import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/cart.dart';
import '../models/user.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cart: [], cartIsLoading: false)) {
    on<CartAdd>(_cartAdd);
    on<CartRemove>(_cartRemove);
    on<CartEdit>(_cartEdit);
  }

  FutureOr<void> _cartAdd(CartAdd event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartIsLoading: true));
    final addCart = List<CartModel>.from(state.cart)..add(event.booking);
    emit(state.copyWith(cart: addCart));
    emit(state.copyWith(cartIsLoading: false));
  }

  FutureOr<void> _cartRemove(CartRemove event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartIsLoading: true));
    final List<CartModel> newArray = state.cart;
    newArray.removeAt(event.index);
    // state.cart.removeAt(event.index);
    emit(state.copyWith(cart: newArray));
    emit(state.copyWith(cartIsLoading: false));
  }

  FutureOr<void> _cartEdit(CartEdit event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartIsLoading: true));
    final List<CartModel> newArray = state.cart;
    newArray[event.index].place = "newValue555";
    emit(state.copyWith(cart: newArray));
    emit(state.copyWith(cartIsLoading: false));
  }
}
