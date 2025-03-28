import 'package:equatable/equatable.dart';
import 'package:form_builder_train/register/models/register_model.dart';


abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterEvent extends RegisterEvent{
  final RegisterModel registerModel;

  const OnRegisterEvent({required this.registerModel});

 @override
 List<Object> get props => [registerModel];

}
