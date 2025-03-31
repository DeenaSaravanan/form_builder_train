
import 'package:equatable/equatable.dart';
import 'package:form_builder_train/login/models/login_model.dart';

abstract class LoginEvent extends Equatable{
  
}

class LoginSubmit extends LoginEvent{
  final LoginModel loginModel;

  LoginSubmit({required this.loginModel});
  @override
  List<Object?> get props => [loginModel];
  
}

class CheckLoginStatus extends LoginEvent{
  @override
  List<Object?> get props => [];
}
