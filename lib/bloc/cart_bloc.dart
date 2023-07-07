import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../config.dart';
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

  void _cartAdd(CartAdd event, Emitter<CartState> emit) {
    emit(state.copyWith(cartIsLoading: Configs.stateChange['IsLoading']));
    final addCart = List<CartModel>.from(state.cart)..add(event.booking);
    emit(state.copyWith(cart: addCart));
    emit(state.copyWith(cartIsLoading: Configs.stateChange['IsLoaded']));
  }

  void _cartRemove(CartRemove event, Emitter<CartState> emit) {
    emit(state.copyWith(cartIsLoading: Configs.stateChange['IsLoading']));
    final List<CartModel> newArray = state.cart;
    newArray.removeAt(event.index);
    emit(state.copyWith(cart: newArray));
    emit(state.copyWith(cartIsLoading: Configs.stateChange['IsLoaded']));
  }

  void _cartEdit(CartEdit event, Emitter<CartState> emit) {
    emit(state.copyWith(cartIsLoading: Configs.stateChange['IsLoading']));
    final List<CartModel> newArray = state.cart;
    //assign new value
    newArray[event.index].place = "newValue555";
    emit(state.copyWith(cart: newArray));
    emit(state.copyWith(cartIsLoading: Configs.stateChange['IsLoaded']));
  }
}
