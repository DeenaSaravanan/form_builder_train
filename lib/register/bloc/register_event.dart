import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterEvent extends RegisterEvent {
  final String username;
  final String email;
  final String mobile;
  final String country;
  final String city;

  const OnRegisterEvent({
    required this.username,
    required this.email,
    required this.mobile,
    required this.country,
    required this.city, required password,
  });

  @override
  List<Object> get props => [username, email, mobile, country, city];
}
