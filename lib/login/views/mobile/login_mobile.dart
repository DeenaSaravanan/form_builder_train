import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_train/app/route_names.dart';
import 'package:form_builder_train/login/views/mobile/loginbloc/login_bloc.dart';
import 'package:form_builder_train/login/views/mobile/loginbloc/login_event.dart';
import 'package:form_builder_train/login/views/mobile/loginbloc/login_state.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 20 : 100,
          ),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  "Flyte",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                SizedBox(height: 5),
                Text("Let's Get You Login!", style: TextStyle(fontSize: 30)),
                SizedBox(height: 5),
                Text("Enter Your Information Below", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: socialLoginButton('images/google.png', "Google"),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        child: socialLoginButton('images/facebook.png', "Facebook"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text('Or login with', style: TextStyle(color: Colors.grey, fontSize: 18)),
                ),
                SizedBox(height: 15),
                _buildTextField("username", "Enter Username", Icons.person, false),
                SizedBox(height: 15),
                _buildTextField("password", "Password", Icons.password_outlined, true),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?", style: TextStyle(color: Colors.purpleAccent)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                         context.goNamed(RouteNames.home);
                      } else if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is LoginLoading
                            ? null
                            : () {
                                if (_formKey.currentState?.saveAndValidate() ?? false) {
                                  final formValues = _formKey.currentState!.value;
                                  context.read<LoginBloc>().add(
                                        LoginSubmit(
                                          username: formValues["username"],
                                          password: formValues["password"],
                                        ),
                                      );
                                }
                              },
                        child: state is LoginLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text("Login"),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () => context.goNamed(RouteNames.register),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 249, 249),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () => context.goNamed(RouteNames.register),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't Have an Account",
                            children: [
                              TextSpan(
                                text: " Register Now?",
                                style: TextStyle(color: Colors.pink),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String name, String hint, IconData icon, bool obscure) {
    return FormBuilderTextField(
      name: name,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 240, 240),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: '$name is required'),
        if (name == "username") ...[
          FormBuilderValidators.minLength(3, errorText: 'Username must be at least 3 characters'),
        ],
        if (name == "password") ...[
          FormBuilderValidators.minLength(6, errorText: 'Password must be at least 6 characters'),
        ],
      ]),
    );
  }

  Widget socialLoginButton(String imagePath, String text) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 20),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
