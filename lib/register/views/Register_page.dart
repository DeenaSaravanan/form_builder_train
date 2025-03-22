import 'package:flutter/material.dart';
import 'package:form_builder_train/register/views/Register_Desktop.dart';
import 'package:form_builder_train/register/views/Register_mobile.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveValue<Widget>(
          context,
          defaultValue: const RegisterMobile(),
          valueWhen: [const Condition.smallerThan(name: DESKTOP, value: RegisterMobile())],
        ).value ??
        RegisterDesktop();
  }
}