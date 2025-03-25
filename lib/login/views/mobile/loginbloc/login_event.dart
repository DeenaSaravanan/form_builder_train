import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class LoginSubmit extends LoginEvent{
  final String username;
  final String password;

  LoginSubmit({required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
  
}

class CheckLoginStatus extends LoginEvent{
  @override
  List<Object?> get props => [];
}