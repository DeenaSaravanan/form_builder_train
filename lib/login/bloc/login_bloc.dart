
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmitted);
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmit event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    await Future.delayed(Duration(seconds: 1));
    
    final String username = event.loginModel.username;
    final String password = event.loginModel.password;

    if (username == "username" && password == "password") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", username);
      await prefs.setBool("isLoggedIn", true);

      emit(LoginSuccess(username: username));
    } else {
      emit(LoginFailure(error: "Invalid username or password"));
    }
  }

  Future<void> _onCheckLoginStatus(
      CheckLoginStatus event, Emitter<LoginState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool("isLoggedIn");

    if (isLoggedIn == true) {
      String? username = prefs.getString("username");
      emit(LoginSuccess(username: username ?? ""));
    } else {
      emit(LoginFailure(error: "User not logged in"));
    }
  }
}
