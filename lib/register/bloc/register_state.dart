import 'package:equatable/equatable.dart';

enum RegisterStatus {initial, loading, success, failure}

class RegisterState extends Equatable{
  final RegisterStatus status;
  final String? message;

  const RegisterState({this.status=RegisterStatus.initial, this.message=''});

  RegisterState copyWith({RegisterStatus? status, String? message}) {
  return RegisterState(status: status ?? this.status, message: message ?? this.message);
}

  @override
  List<Object?> get props => [];
}