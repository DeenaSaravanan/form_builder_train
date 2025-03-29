import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_train/app/route_names.dart';
import 'package:form_builder_train/register/bloc/register_bloc.dart';
import 'package:form_builder_train/register/bloc/register_event.dart';
import 'package:form_builder_train/register/bloc/register_state.dart';
import 'package:form_builder_train/register/models/register_model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
 
class RegisterMobile extends StatefulWidget {
  const RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 10),
            child: FormBuilder(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                          ? 20
                          : 100,
                ),
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "Flyte",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)
                      ),
                      const SizedBox(height: 10),
                       Text(
                        AppLocalizations.of(context).registernow,
                        style: TextTheme.of(context).titleMedium?.copyWith(color: Colors.black)
                      ),
                      const SizedBox(height: 8),
                       Text(
                        AppLocalizations.of(context).enterinfo,
                        style: TextTheme.of(context).bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: AppLocalizations.of(context).username,
                        decoration: _inputDecoration(AppLocalizations.of(context).name),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: AppLocalizations.of(context).customer_name_v
                          ),
                          FormBuilderValidators.minLength(
                            5,
                            errorText: AppLocalizations.of(context).usererror_v,
                          ),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "email",
                        decoration: _inputDecoration(AppLocalizations.of(context).emailaddress),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: AppLocalizations.of(context).email_id_v
                          ),
                          FormBuilderValidators.email(
                            errorText: AppLocalizations.of(context).email_id_v
                          ),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "mobile",
                        decoration: _inputDecoration(AppLocalizations.of(context).mobile_number),
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: AppLocalizations.of(context).customer_name_v,
                          ),
                          FormBuilderValidators.minLength(
                            10,
                            errorText: AppLocalizations.of(context).minimum10,
                          ),
                          FormBuilderValidators.maxLength(
                            10,
                            errorText: AppLocalizations.of(context).maximum10,
                          ),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderDropdown<String>(
                        name: "country",
                        decoration: _inputDecoration(AppLocalizations.of(context).country),
                        validator: FormBuilderValidators.required(
                          errorText: AppLocalizations.of(context).country_v,
                        ),
                        items: AppLocalizations.of(context).countries.split(',')
                            .map(
                              (country) => DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderDropdown<String>(
                        name: "city",
                        decoration: _inputDecoration("Select City"),
                        validator: FormBuilderValidators.required(
                          errorText: AppLocalizations.of(context).city_v,
                        ),
                        items: AppLocalizations.of(context).cities.split(',')
                            .map(
                              (city) => DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: BlocConsumer<RegisterBloc, RegisterState>(
                          listener: (context, state) {
                            if (state.status == RegisterStatus.success) {
                              Future.delayed(Duration(milliseconds: 500), () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text(AppLocalizations.of(context).registersuccess),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              });
                            } else if (state.status == RegisterStatus.failure) {
                              Future.delayed(const Duration(milliseconds: 500), () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message ?? "Error"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              });
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.status == RegisterStatus.loading
                                  ? null
                                  : () async {
                                      if (_formkey.currentState!.saveAndValidate()) {
                                        final data = _formkey.currentState!.value;
                                        await _saveUserData(data);
                                        context.read<RegisterBloc>().add(
                                              OnRegisterEvent(
                                                registerModel: RegisterModel(
                                                  username: data['username'],
                                                  email: data['email'],
                                                  mobile: data['mobile'],
                                                  country: data['country'],
                                                  city: data['city']),
                                               
                                              ),
                                            );
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(121, 0, 87, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                foregroundColor: Colors.white,
                              ),
                              child: state.status == RegisterStatus.loading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  :  Text(AppLocalizations.of(context).register),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 50),
                      InkWell(
                        onTap: ()=>context.goNamed(RouteNames.login),
                        
                            child: Center(
                              child: SizedBox(
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: RichText(
                                    text:  TextSpan(
                                       text: AppLocalizations.of(context).login_link,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black), 
                                      children: [
                                        TextSpan(
                                          text: AppLocalizations.of(context).login,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.pink)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ]
                      ),
                    
                  ),
                ),
              ),
            ),
      )
    );
  }

  Future<void> _saveUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", data["username"]);
    await prefs.setString("email", data["email"]);
    await prefs.setString("mobile", data["mobile"]);
    await prefs.setString("country", data["country"]);
    await prefs.setString("city", data["city"]);
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: Theme.of(context).inputDecorationTheme.border,
    );
  }
}
