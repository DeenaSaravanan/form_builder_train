import 'package:flutter/material.dart';
import 'package:form_builder_train/register/views/desktop/register_desktop.dart';
import 'package:form_builder_train/register/views/mobile/register_mobile.dart';
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