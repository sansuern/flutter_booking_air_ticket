part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });

  HomeLoadedSuccessState copyWith({
    List<ProductDataModel>? products,
  }) {
    return HomeLoadedSuccessState(products: products ?? this.products);
  }

  List<Object?> get props => [products];
}

class HomeErrorState extends HomeState {}
