import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<OnRegisterEvent>((event, emit) async {
      emit(state.copyWith(status: RegisterStatus.loading));

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', event.username);
        await prefs.setString('email', event.email);
        await prefs.setString('mobile', event.mobile);
        await prefs.setString('country', event.country);
        await prefs.setString('city', event.city);

        print("✅ Data Saved: ${event.username}, ${event.email}, ${event.mobile}");

        emit(state.copyWith(status: RegisterStatus.success));
      } catch (e) {
        print("❌ Error: $e");
        emit(state.copyWith(status: RegisterStatus.failure, message: "Failed to register"));
      }
    });
  }
}
