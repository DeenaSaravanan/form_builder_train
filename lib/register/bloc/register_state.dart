import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final Map<String, String> formValues;
  final String? message;

  const RegisterState({
    this.status = RegisterStatus.initial,
     this.formValues=const {},
     this.message});

  RegisterState copyWith({
    RegisterStatus? status,
    Map<String, String>? formValues,
     String? message,
    }) {

    return RegisterState(
      status: status ?? this.status,
      formValues: formValues?? this.formValues,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, formValues, message,];
}
