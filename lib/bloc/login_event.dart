part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEventAdd extends LoginEvent {}

class LoginEventRemove extends LoginEvent {}

class LoginEventSignin extends LoginEvent {
  final User payload;
  LoginEventSignin(this.payload);
}
