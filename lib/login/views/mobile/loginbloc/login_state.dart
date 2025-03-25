import 'package:equatable/equatable.dart';
import 'package:form_builder_train/login/views/mobile/loginbloc/login_event.dart';

abstract class LoginState extends Equatable{}

class LoginInitial extends LoginState{
  @override
  List<Object?> get props => [];
  
}

class LoginLoading extends LoginState{
  @override
  List<Object?> get props => [];
  
}

class LoginSuccess extends LoginState{
  final String username;

  LoginSuccess({required this.username});
  @override
  List<Object?> get props => [username];
  
}

class LoginFailure extends LoginState{
  final String error;

  LoginFailure({required this.error});
  @override
  List<Object?> get props => [error];
  
}