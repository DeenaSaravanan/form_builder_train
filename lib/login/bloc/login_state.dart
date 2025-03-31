import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final Map<String, String>? formValues;

  const LoginState({this.formValues=const{}});
  
  @override
  List<Object?> get props => [formValues];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final String username;

  const LoginSuccess({required this.username, Map<String, String>? formValues})
      : super(formValues: formValues);

  @override
  List<Object?> get props => [username, formValues];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error, Map<String, String>? formValues})
      : super(formValues: formValues);

  @override
  List<Object?> get props => [error, formValues];
}
