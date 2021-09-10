import 'package:flutter/material.dart';

import 'FormLogin.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.landscape?
      SingleChildScrollView(child: ContentArea()):ContentArea(),
    );
  }
}

class ContentArea extends StatelessWidget {
  const ContentArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
          FormLogin()
      ],
    );
  }
}
