import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: FormBuilder(
            key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text("Flyte", style: TextStyle(fontSize: 40)),
              SizedBox(height: 5),
              Text("Let's Get You Login!", style: TextStyle(fontSize: 30)),
              SizedBox(height: 5),
              Text(
                "Enter Your Information Below",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment(0, 0),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/google.png'),
                          SizedBox(width: 20),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment(0, 0),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/facebook.png'),
                          SizedBox(width: 20),
                          Text(
                            "Facebook",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '------------------Or login with-------------------',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 15),
              FormBuilderTextField(
                name: "email",
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  iconColor: Colors.white,
                  hintText: "Enter Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 243, 240, 240),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Name is required'),
                  FormBuilderValidators.minLength(
                    10,
                    errorText: 'Minimum 10 characters required',
                  ),
                ]),
              ),
              SizedBox(height: 15),
              FormBuilderTextField(
                name: "password",
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  iconColor: Colors.grey,
                  suffixIcon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 241, 240, 240),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Password is required',
                  ),
                  FormBuilderValidators.minLength(
                    6,
                    errorText: 'At least 6 characters required',
                  ),
                ]),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                  
                    }, child: Text("Forgot Password?", style: TextStyle(color: Colors.purpleAccent),)),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
              child: 
              ElevatedButton(
                onPressed: (){
                   if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value); 
                    } else {
                      print('Validation Failed');
                    }
               }, child: Text("Login")
               )
               ),
               SizedBox(height: 30,),
               InkWell(
                onTap: (){
                
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 249, 249),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't Have an Account",
                        children: [
                          TextSpan(
                            text: " RegisterNow?",
                            style: TextStyle(color: Colors.pink)
                          )
                        ]
                      )),
                  ),
                ),
               )             
            ],
          ),
        ),
        )
      ),
    );
  }
}
