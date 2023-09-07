import 'package:flutter/material.dart';
import 'package:freelo_ecommerce/auth/presentation/pages/register_page.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/account_question.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/default_button.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/default_form_field.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/login/login_appbar.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/login/login_header.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/socialMedias.dart';
import 'package:freelo_ecommerce/core/domain/methods/core_methods.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginAppBar(
        context,
        () {
          CoreMethods.navigateAndReplace(context, RegisterPage());
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                DefaultFormField(
                  title: 'Email',
                  controller: emailController,
                  validator: (value) {
                    if (value != null && value.length < 9) {
                      return 'Enter minimum 9 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                DefaultFormField(
                  title: 'Password',
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return 'Enter minimum 9 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                AccountQuestion(onPressed: () {}, text: 'Forgot your password?'),
                DefaultButton(onTap: () {}, text: 'LOGIN'),
                SocialMedias(
                  facebookOnTap: () {},
                  googleOnTap: () {},
                  title: 'Or login with social account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
