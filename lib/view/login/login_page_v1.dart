import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:agro_integration_dashboard/controller/login_controller.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPagev1 extends GetView<LoginController> {
  const LoginPagev1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'user_name',
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                name: 'password',
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedLoadingButton(
                width: 100,
                color: Colors.blue,
                controller: controller.btnController,
                onPressed: () => controller.login(),
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
