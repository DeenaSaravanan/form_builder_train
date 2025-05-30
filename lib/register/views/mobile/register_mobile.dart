import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_train/app/route_names.dart';
import 'package:form_builder_train/register/bloc/register_bloc.dart';
import 'package:form_builder_train/register/bloc/register_event.dart';
import 'package:form_builder_train/register/bloc/register_state.dart';
import 'package:form_builder_train/register/models/register_model.dart';
import 'package:form_builder_train/utils/helper/localization_helper.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class RegisterMobile extends StatefulWidget {
  const RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
final GlobalKey<FormBuilderState>_formkey= GlobalKey<FormBuilderState>();
  

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
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      LocalizationHelper.getString('registernow'),
                      style: TextTheme.of(
                        context,
                      ).titleMedium?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      LocalizationHelper.getString('enterinfo'),
                      style: TextTheme.of(
                        context,
                      ).bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    FormBuilder(
                      key: _formkey,
                      onChanged: () {
                        final formState = _formkey.currentState;
                        if (formState != null) {
                          formState.fields.forEach((key, field) {
                            context.read<RegisterBloc>().add(
                              OnFormValueChange(
                                field:
                                    key, 
                                value:
                                    field.value ?? '',
                                     
                              ),
                            );
                          });
                        }
                      },
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'username',
                            decoration: _inputDecoration('Username'),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'This field is required',
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "email",
                      decoration: _inputDecoration(
                        LocalizationHelper.getString('emailaddress'),
                      ),
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                          OnFormValueChange(field: "email", value: value ?? ""),
                        );
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: LocalizationHelper.getString('email_id_v'),
                        ),
                        FormBuilderValidators.email(
                          errorText: LocalizationHelper.getString('email_id_v'),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "mobile",
                      decoration: _inputDecoration(
                        LocalizationHelper.getString('mobilenumber'),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                          OnFormValueChange(
                            field: "mobile",
                            value: value ?? "",
                          ),
                        );
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: LocalizationHelper.getString(
                            'customer_name_v',
                          ),
                        ),
                        FormBuilderValidators.minLength(
                          10,
                          errorText: LocalizationHelper.getString('minimum10'),
                        ),
                        FormBuilderValidators.maxLength(
                          10,
                          errorText: LocalizationHelper.getString('maximum10'),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return FormBuilderDropdown<String>(
                          name: "country",
                          decoration: _inputDecoration(
                            LocalizationHelper.getString('country'),
                          ),
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                              OnFormValueChange(
                                field: "country",
                                value: value ?? "",
                              ),
                            );
                          },
                          validator: FormBuilderValidators.required(
                            errorText: LocalizationHelper.getString(
                              'country_v',
                            ),
                          ),
                          items:
                              LocalizationHelper.getString('countries')
                                  .split(',')
                                  .map(
                                    (country) => DropdownMenuItem(
                                      value: country,
                                      child: Text(country),
                                    ),
                                  )
                                  .toList(),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return FormBuilderDropdown<String>(
                          name: "city",
                          decoration: _inputDecoration(
                            LocalizationHelper.getString('city'),
                          ),
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                              OnFormValueChange(
                                field: "city",
                                value: value ?? "",
                              ),
                            );
                          },
                          validator: FormBuilderValidators.required(
                            errorText: LocalizationHelper.getString('city_v'),
                          ),
                          items:
                              LocalizationHelper.getString(
                                'cities',
                              ).split(',').map((city) {
                                return DropdownMenuItem(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                        );
                      },
                    ),

                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state.status == RegisterStatus.success) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    LocalizationHelper.getString(
                                      'registersuccess',
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } else if (state.status == RegisterStatus.failure) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message ?? "Error"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state.status == RegisterStatus.loading
                                    ? null
                                    : () async {
                                      if (_formkey.currentState!
                                          .saveAndValidate()) {
                                        final registerBloc =
                                            context.read<RegisterBloc>();
                                        registerBloc.add(
                                          OnRegisterEvent(
                                            registerModel: RegisterModel(
                                              username:
                                                  registerBloc
                                                      .state
                                                      .formValues["username"] ??
                                                  "",
                                              email:
                                                  registerBloc
                                                      .state
                                                      .formValues["email"] ??
                                                  "",
                                              mobile:
                                                  registerBloc
                                                      .state
                                                      .formValues["mobile"] ??
                                                  "",
                                              country:
                                                  registerBloc
                                                      .state
                                                      .formValues["country"] ??
                                                  "",
                                              city:
                                                  registerBloc
                                                      .state
                                                      .formValues["city"] ??
                                                  "",
                                            ),
                                          ),
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(
                                121,
                                0,
                                87,
                                1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: const Color.fromARGB(
                                255,
                                197,
                                41,
                                41,
                              ),
                            ),
                            child:
                                state.status == RegisterStatus.loading
                                    ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text(
                                      LocalizationHelper.getString('register'),
                                    ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () => context.goNamed(RouteNames.login),
                      child: Center(
                        child: SizedBox(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: RichText(
                              text: TextSpan(
                                text: LocalizationHelper.getString(
                                  'login_link',
                                ),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: LocalizationHelper.getString('login'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.pink),
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
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: Theme.of(context).inputDecorationTheme.border,
    );
  }
}
