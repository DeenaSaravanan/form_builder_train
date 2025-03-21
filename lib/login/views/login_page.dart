import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'desktop/login_desktop.dart';
import 'mobile/login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveValue<Widget>(
          context,
          defaultValue: const LoginDesktop(),
          valueWhen: [const Condition.smallerThan(name: DESKTOP, value: LoginMobile())],
        ).value ??
        LoginDesktop();
  }
}
