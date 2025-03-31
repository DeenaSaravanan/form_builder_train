import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final Map<String, String> formValues;
  final String? message;
  final List<String>? cities; 

  const RegisterState({
    this.status = RegisterStatus.initial,
    this.formValues = const {},
    this.message,
    this.cities,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    Map<String, String>? formValues,
    String? message,
    List<String>? cities,
  }) {
    return RegisterState(
      status: status ?? this.status,
      formValues: formValues ?? this.formValues,
      message: message ?? this.message,
      cities: cities ?? this.cities, 
    );
  }

  @override
  List<Object?> get props => [status, formValues, message, cities];
}
