import 'package:equatable/equatable.dart';
import 'package:form_builder_train/register/models/register_model.dart';


abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class OnFormValueChange extends RegisterEvent{
  final String field;
  final String value;

  const OnFormValueChange({required this.field, required this.value});

  @override
  List<Object> get props=> [field, value];
}

class OnRegisterEvent extends RegisterEvent{
  final RegisterModel registerModel;

  const OnRegisterEvent({required this.registerModel});

 @override
 List<Object> get props => [registerModel];

}
