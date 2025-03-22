part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final Map<String, dynamic> formValues;
  final String message;

  const LoginState({
    this.status = LoginStatus.initial,
    this.formValues = const {},
    this.message = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    Map<String, dynamic>? formValues,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      formValues: formValues ?? this.formValues,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, formValues, message];
}
