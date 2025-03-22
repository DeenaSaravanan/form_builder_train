import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<InitializeLogin>(_onInitialize);
    on<ChangeFormValue>(_onChangeFormValue);
    on<LoginSubmit>(_onLoginSubmit);
  }

  void _onInitialize(InitializeLogin event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.initial));
  }

  void _onChangeFormValue(ChangeFormValue event, Emitter<LoginState> emit) {
    final updatedForm = {...state.formValues, ...event.formValue};
    emit(state.copyWith(formValues: updatedForm));
  }

  void _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
    
      await Future.delayed(const Duration(seconds: 2));

    
      if (state.formValues['username'] == 'admin' &&
          state.formValues['password'] == 'password123') {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(state.copyWith(status: LoginStatus.error, message: "Invalid credentials"));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, message: e.toString()));
    }
  }
}
