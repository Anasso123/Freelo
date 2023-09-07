import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelo_ecommerce/auth/presentation/manager/signup_bloc.dart';
import 'package:freelo_ecommerce/auth/presentation/pages/login_page.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/account_question.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/default_button.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/default_form_field.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/register/register_header.dart';
import 'package:freelo_ecommerce/auth/presentation/widgets/socialMedias.dart';
import 'package:freelo_ecommerce/auth/shared/params/user_params.dart';
import 'package:freelo_ecommerce/core/domain/dependency_injection/dependency_injection.dart';
import 'package:freelo_ecommerce/core/domain/methods/core_methods.dart';
import 'package:freelo_ecommerce/home/presentation/pages/home_page.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupBloc>(),
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RegisterHeader(),
                    DefaultFormField(
                      title: 'Name',
                      controller: nameController,
                      validator: (value) {
                        if (value != null && value.length < 3) {
                          return 'Enter minimum 3 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
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
                          return 'Enter minimum 6 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                    AccountQuestion(
                      text: 'Already have an account?',
                      onPressed: () {
                        CoreMethods.navigateTo(context, LoginPage());
                      },
                    ),
                    DefaultButton(
                      onTap: () {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          if (nameController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              emailController.text.isEmpty) {
                            print('empty');
                          } else {
                            var uuid = const Uuid();
                            sl<SignupBloc>().add(
                              SignUpWithAppEvents(
                                UserParams(
                                  uid: uuid.v1(),
                                  email: emailController.text.trim(),
                                  name: nameController.text.trim(),
                                  password: CoreMethods().generateMd5(
                                      passwordController.text.trim()),
                                  phone: '0000000000',
                                  imageUrl:
                                      'https://lh3.googleusercontent.com/a/AAcHTtfnnE70kHmUMiWGTm8ehrtWP276vU48AOEFs-a6TIUt=s96-c',
                                  auth_method: 'App.com',
                                ),
                              ),
                            );
                            CoreMethods.navigateAndReplace(
                                context, const HomePage());
                          }
                        } else {
                          CherryToast.error(
                            title: const Text('Bad information'),
                            action: const Text('Enter correct info'),
                          ).show(context);
                        }
                      },
                      text: 'SIGN UP',
                    ),
                    SocialMedias(
                      facebookOnTap: () {
                        sl<SignupBloc>().add(SignUpWithFacebookEvents(context));
                      },
                      googleOnTap: () {
                        sl<SignupBloc>().add(SignupWithGoogleEvents(context));
                      },
                      title: 'Or sign up with social account',
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
