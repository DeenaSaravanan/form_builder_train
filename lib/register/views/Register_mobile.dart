import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_train/register/bloc/register_bloc.dart';
import 'package:form_builder_train/register/bloc/register_event.dart';
import 'package:form_builder_train/register/bloc/register_state.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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
            minimum: EdgeInsets.only(top: 10),
            child: FormBuilder(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
                          ? 20
                          : 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flyte",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Register Now!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Enter Your Informations Below",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'username',
                      decoration: _inputDecoration("Name"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Name is required',
                        ),
                        FormBuilderValidators.minLength(
                          5,
                          errorText: 'Name must be at least 5 characters',
                        ),
                      ]),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "email",
                      decoration: _inputDecoration("Email Address"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Email is required',
                        ),
                        FormBuilderValidators.email(
                          errorText: 'Enter a valid email address',
                        ),
                      ]),
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      name: "mobile",
                      decoration: _inputDecoration("Mobile Number"),
                      keyboardType: TextInputType.phone,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: "Mobile number is required",
                        ),
                        FormBuilderValidators.minLength(
                          10,
                          errorText: "Must be 10 digits",
                        ),
                        FormBuilderValidators.maxLength(
                          10,
                          errorText: "Must be 10 digits",
                        ),
                      ]),
                    ),
                    SizedBox(height: 20),
                    FormBuilderDropdown<String>(
                      name: "country",
                      decoration: _inputDecoration("Country"),
                      validator: FormBuilderValidators.required(
                        errorText: "Please select a country",
                      ),
                      items: ["United States", "India", "United Kingdom", "Canada", "Australia"]
                          .map((country) => DropdownMenuItem(value: country, child: Text(country)))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    FormBuilderDropdown<String>(
                      name: "city",
                      decoration: _inputDecoration("Select City"),
                      validator: FormBuilderValidators.required(
                        errorText: "Please Select City",
                      ),
                      items: ["Tamilnadu", "Kerala", "Andhra", "Karnataka"]
                          .map((city) => DropdownMenuItem(value: city, child: Text(city)))
                          .toList(),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state.status == RegisterStatus.success) {
                            Future.delayed(Duration(milliseconds: 500), () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Registration Successful!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            });
                          } else if (state.status == RegisterStatus.failure) {
                            Future.delayed(Duration(milliseconds: 500), () {
                              
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
                                : () {
                                    if (_formkey.currentState!.saveAndValidate()) {
                                      final data = _formkey.currentState!.value;
                                       ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Processing Registration..."),
              backgroundColor: Colors.blueAccent,
              duration: Duration(seconds: 2), // Ensure visibility
            ),
                                       );
                                       Future.delayed(Duration(milliseconds: 500), () {
  context.read<RegisterBloc>().add(
    OnRegisterEvent(
      username: data["username"],  
      email: data["email"],  
      mobile: data["mobile"],  
      country: data["country"],  
      city: data["city"], 
    ),
  );
});

                                    
                                    }
                                  },
                                
                
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 50),
                              backgroundColor: Color.fromRGBO(121, 0, 87, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: Colors.white,
                            ),
                            child: state.status == RegisterStatus.loading
                            
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text("Register"),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 90),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: TextButton(
                          onPressed: () {},
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Already a Member?",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: " Login",
                                    style: TextStyle(color: Colors.purpleAccent),
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
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 203, 31, 233),
        fontSize: 16,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 214, 98, 235),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.purpleAccent,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.purple,
          width: 2,
        ),
      ),
    );
  }
}
