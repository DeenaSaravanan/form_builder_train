import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_train/app/route_names.dart';
import 'package:form_builder_train/login/bloc/login_bloc.dart';
import 'package:form_builder_train/login/bloc/login_event.dart';
import 'package:form_builder_train/login/bloc/login_state.dart';
import 'package:form_builder_train/login/models/login_model.dart';
import 'package:form_builder_train/utils/helper/localization_helper.dart';
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
  bool _isPasswordVisible = false;

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
                const SizedBox(height: 25),
                Text("Flyte", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
                const SizedBox(height: 5),
                Text(LocalizationHelper.getString("getlogin"), style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
                const SizedBox(height: 5),
                Text(LocalizationHelper.getString("enterinfo"), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: GestureDetector(child: socialLoginButton('images/google.png', LocalizationHelper.getString("google")))),
                    const SizedBox(width: 15),
                    Expanded(child: GestureDetector(child: socialLoginButton('images/facebook.png', LocalizationHelper.getString("facebook")))),
                  ],
                ),
                const SizedBox(height: 20),
                Center(child: Text(LocalizationHelper.getString("orloginwith"), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black))),
                const SizedBox(height: 15),
                _buildTextField("username", LocalizationHelper.getString("enteremail"), Icons.person, true),
                const SizedBox(height: 15),
                _buildTextField("password", LocalizationHelper.getString("enterpassword"), Icons.password, false),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(LocalizationHelper.getString("forgotpassword"), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.pinkAccent)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.goNamed(RouteNames.home);
                      } else if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is LoginLoading
                            ? null
                            : () {
                                if (_formKey.currentState?.saveAndValidate() ?? false) {
                                  final formValues = _formKey.currentState!.value;
                                  final loginModel = LoginModel(
                                    username: formValues["username"],
                                    password: formValues["password"],
                                  );
                                  context.read<LoginBloc>().add(LoginSubmit(loginModel: loginModel));
                                }
                              },
                        child: state is LoginLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(LocalizationHelper.getString("login")),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: InkWell(
                    onTap: () => context.goNamed(RouteNames.register),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: LocalizationHelper.getString("donthaveaccount"),
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: LocalizationHelper.getString("registernow"),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.pink),
                            ),
                          ],
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
        prefixIcon: Icon(name == "username" ? Icons.mail : Icons.lock, color: Colors.grey),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: name == "password"
            ? IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              )
            : null,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: '$name is required'),
        if (name == "username") FormBuilderValidators.minLength(3, errorText: 'Username must be at least 3 characters'),
        if (name == "password") FormBuilderValidators.minLength(6, errorText: 'Password must be at least 6 characters'),
      ]),
    );
  }

  Widget socialLoginButton(String imagePath, String text) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 20),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}