part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class InitializeLogin extends LoginEvent {
  const InitializeLogin();
}

final class ChangeFormValue extends LoginEvent {
  final Map<String, dynamic> formValue;

  const ChangeFormValue({required this.formValue});

  @override
  List<Object> get props => [formValue];
}

final class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}
