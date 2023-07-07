part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CartAdd extends CartEvent {
  final CartModel booking;
  CartAdd(this.booking);

  @override
  List<Object> get props => [booking];
}

class CartRemove extends CartEvent {
  final int index;
  CartRemove(this.index);

  @override
  List<Object> get props => [index];
}

class CartEdit extends CartEvent {
  final int index;
  CartEdit(this.index);

  @override
  List<Object> get props => [index];
}
