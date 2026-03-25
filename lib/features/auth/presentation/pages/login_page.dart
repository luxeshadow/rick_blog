import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_router.dart';
import 'package:rick_blog/core/constants/app_images.dart';
import 'package:rick_blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:rick_blog/features/auth/presentation/widgets/auth_button.dart';
import 'package:rick_blog/features/auth/presentation/validators/login_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  bool isAccepted = false;
  String _password = '';
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _fromKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.get('app_logo'),
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Text(
                    'Please log in to continue.',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  AuthField(
                    validator: LoginValidator.validateEmail,
                    labelText: 'Email',
                    controller: emailController,
                    hintText: 'Enter your email',
                    prefixIcon: Image.asset(
                      AppImages.get('email'),
                      width: 22,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 20),

                  AuthField(
                    validator: LoginValidator.validatePassword,
                    onChanged: (value) => _password = value,
                    labelText: 'Password',
                    controller: passwordController,
                    hintText: 'Enter your password',
                    isPassword: isObscure,
                    prefixIcon: Image.asset(
                      AppImages.get('password'),
                      width: 22,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    suffixIcon: IconButton(
                      icon: Image.asset(
                        isObscure
                            ? AppImages.get('hide_password')
                            : AppImages.get('show_password'),
                        width: 22,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      onPressed: () => setState(() => isObscure = !isObscure),
                    ),
                  ),
                  const SizedBox(height: 30),

                  AuthButton(
                    backgroundColor: primaryColor,
                    text: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      if (_fromKey.currentState!.validate()) {
                        print('good');
                        _fromKey.currentState!.reset();
                      }
                    },
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // context.push(AppRouter.forgotPassword);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  AuthButton(
                    backgroundColor: Colors.white,
                    image: Image.asset(AppImages.get('google'), width: 24),
                    text: const Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      print('Google Login');
                    },
                  ),

                  const SizedBox(height: 20),

                  AuthButton(
                    backgroundColor: Theme.of(context).colorScheme.,
                    image: Image.asset(
                      AppImages.get('apple'),
                      width: 24,
                      color: Colors.white,
                    ),
                    text: const Text(
                      'Continue with Apple',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      print('Apple Login');
                    },
                  ),
                 
                  

                  const SizedBox(height: 20),

                  Text.rich(
                    TextSpan(
                      text: "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        const WidgetSpan(child: SizedBox(width: 8)),
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(AppRouter.register);
                            },

                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
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
