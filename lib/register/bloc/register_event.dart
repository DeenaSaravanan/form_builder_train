import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{}

class OnRegisterEvent extends RegisterEvent{
  final String username;
  final String email;
  final String mobile;
  final String country;
  final String city;

  OnRegisterEvent({required this.username, required this.email, required this.mobile, required this.country, required this.city});
  @override
  List<Object?> get props => [username, email, mobile, country, city];
}