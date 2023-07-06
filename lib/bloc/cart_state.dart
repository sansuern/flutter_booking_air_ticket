part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartModel> cart;
  bool cartIsLoading;

  CartState({required this.cart, required this.cartIsLoading});

  CartState copyWith({
    List<CartModel>? cart,
    bool? cartIsLoading,
  }) {
    return CartState(
        cart: cart ?? this.cart,
        cartIsLoading: cartIsLoading ?? this.cartIsLoading);
  }

  @override
  List<Object> get props => [cart, cartIsLoading];
}
