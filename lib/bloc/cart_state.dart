part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartModel> cart;

  const CartState({required this.cart});

  CartState copyWith({
    List<CartModel>? cart,
  }) {
    return CartState(cart: cart ?? this.cart);
  }

  @override
  List<Object> get props => [cart];
}
