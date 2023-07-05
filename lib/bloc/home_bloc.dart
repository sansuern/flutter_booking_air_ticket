// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../models/home_product_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //listeners
  HomeBloc() : super(HomeState()) {
    on<HomeInitialEvent>(_homeInitialEvent);
  }

  //methods
  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    print("state: loading");
    // await Future.delayed(Duration(seconds: 3));
    // emit(HomeLoadedSuccessState(
    //     products: GroceryData.groceryProducts
    //         .map((e) => ProductDataModel(
    //             id: e['id'],
    //             name: e['name'],
    //             description: e['description'],
    //             price: e['price'],
    //             imageUrl: e['imageUrl']))
    //         .toList()));
  }
}
