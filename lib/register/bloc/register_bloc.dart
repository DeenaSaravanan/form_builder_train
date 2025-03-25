import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<OnRegisterEvent>(_onRegister);
  }

  Future<void> _onRegister(OnRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', event.username);
      await prefs.setString('email', event.email);
      await prefs.setString('mobile', event.mobile);
      await prefs.setString('country', event.country);
      await prefs.setString('city', event.city);

      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: RegisterStatus.failure, message: "Registration Failed"));
    }
  }
}
