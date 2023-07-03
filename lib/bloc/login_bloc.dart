import 'package:basicflutter/main.dart';
import 'package:basicflutter/routes/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/user.dart';
import 'home_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    // Add
    on<LoginEventAdd>((event, emit) {
      //excute some events
      // emit(state.copyWith(count: state.count + 1));
    });

    // Remove
    on<LoginEventRemove>((event, emit) {
      //excute some events
      // emit(state.copyWith(count: state.count - 1));
    });

    // Signin
    on<LoginEventSignin>((event, emit) async {
      final CollectionReference _authCollection =
          FirebaseFirestore.instance.collection("authentication");
      //excute some events
      if (event.payload.username == "admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuthenticated: true));
        if (navigatorState.currentContext != null) {
          //push data to firebase
          // await _authCollection.add(
          //   {
          //     'username': event.payload.username,
          //     'password': event.payload.password,
          //   },
          // );

          Navigator.pushReplacementNamed(
            navigatorState.currentContext!,
            AppRoutes.index,
          );
        }
      } else {
        emit(state.copyWith(isAuthenticated: false));
      }
    });
  }
}
