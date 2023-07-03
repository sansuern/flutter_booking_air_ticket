part of 'login_bloc.dart';

enum AuthenStatus { init, success, failed }

class LoginState extends Equatable {
  final bool isAuthenticated;
  const LoginState({this.isAuthenticated = false});

  get value => null;

  LoginState copyWith({
    int? count,
    bool? isAuthenticated,
  }) {
    return LoginState(isAuthenticated: isAuthenticated ?? this.isAuthenticated);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isAuthenticated];
}
