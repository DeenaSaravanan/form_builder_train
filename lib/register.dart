import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Registrations extends StatefulWidget {
  const Registrations({super.key});

  @override
  State<Registrations> createState() => _RegistrationsState();
}

class _RegistrationsState extends State<Registrations> {
  final _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: 10),
          child: FormBuilder(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 20 : 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flyte",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Register Now!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Enter Your Informations Below",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 203, 31, 233),
                        fontSize: 16,
                      ),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 214, 98, 235), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                       ),
                    ),
                    validator:  FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Name is required'),
              FormBuilderValidators.minLength(5,
                  errorText: 'Name must be at least 5 characters'),
            ]),
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                     TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 203, 31, 233),
                        fontSize: 16,
                      ),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 214, 98, 235), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                       ),
                    ),
                    validator: FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: 'Email is required'),
    FormBuilderValidators.email(errorText: 'Enter a valid email address'),
  ]),),
                  SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "Mobile",
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 203, 31, 233),
                        fontSize: 16,
                      ),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 214, 98, 235), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                       ),
                    ),
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
                    name: "Country",
                    decoration: InputDecoration(
                      labelText: 'Country',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 203, 31, 233),
                        fontSize: 16,
                      ),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 214, 98, 235), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                       ),
                    ),
                    iconSize: 30,
                    iconEnabledColor: Colors.black,
                    validator: FormBuilderValidators.required(
                      errorText: "Please select a country",
                    ),
                    items:
                        [
                              "United States",
                              "India",
                              "United Kingdom",
                              "Canada",
                              "Australia",
                            ]
                            .map(
                              (country) => DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              ),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 20),
                  FormBuilderDropdown<String>(
                    name: "city",
                    decoration: InputDecoration(
                      labelText: 'Select City',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 203, 31, 233),
                        fontSize: 16,
                      ),
                      floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 214, 98, 235), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                       ),
                    ),
                    iconSize: 30,
                    iconEnabledColor: Colors.black,
                    validator: FormBuilderValidators.required(
                      errorText: "Please Select City",
                    ),
                    items:
                        ["Tamilnadu", "Kerala", "Andra", "Karnataka"]
                            .map(
                              (city) => DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              ),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.saveAndValidate()) {
                          print(_formkey.currentState!.value);
                        } else {
                          print('Validation Failed');
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
                      child: Text("Register"),
                    ),
                  ),
                  SizedBox(height: 90,),
                  InkWell(
                    onTap: () {},
                      child: Container(
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
    );
  }
}
