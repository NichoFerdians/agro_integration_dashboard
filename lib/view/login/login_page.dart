import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:agro_integration_dashboard/controller/login_controller.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        // title: 'ECORP',
        logo: AssetImage('assets/logo.png'),
        theme: LoginTheme(
          primaryColor: Colors.blue,
          accentColor: Colors.grey,

          // primaryColorAsInputLabel: true,
          inputTheme: InputDecorationTheme(
            suffixStyle: TextStyle(color: Colors.indigo),
            suffixIconColor: Colors.amber,
            focusColor: Colors.teal,
            labelStyle: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
        messages: LoginMessages(
          userHint: 'Username',
          passwordHint: 'Password',
        ),
        onLogin: controller.authUser,
        userType: LoginUserType.name,
        onSubmitAnimationCompleted: () {
          Get.offAndToNamed('home');
        },
        userValidator: (value) {},
        hideForgotPasswordButton: true,
        onRecoverPassword: (_) => null);

    // Scaffold(
    //   body: Container(
    //     padding: const EdgeInsets.all(16.0),
    //     child: FormBuilder(
    //       key: controller.formKey,
    //       autovalidateMode: AutovalidateMode.disabled,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           FormBuilderTextField(
    //             name: 'user_name',
    //             controller: controller.emailController,
    //             decoration: const InputDecoration(
    //               labelText: 'Username',
    //               border: OutlineInputBorder(),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           FormBuilderTextField(
    //             name: 'password',
    //             controller: controller.passwordController,
    //             decoration: const InputDecoration(
    //               labelText: 'Password',
    //               border: OutlineInputBorder(),
    //             ),
    //             obscureText: true,
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           RoundedLoadingButton(
    //             width: 100,
    //             color: Colors.blue,
    //             controller: controller.btnController,
    //             onPressed: () => controller.login(),
    //             child: const Text('Login', style: TextStyle(color: Colors.white)),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
