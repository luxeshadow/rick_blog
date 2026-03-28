import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_blog/core/utils/show_snakbar.dart';
import '../../../../core/constants/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_blog/core/constants/app_images.dart';
import 'package:rick_blog/core/widgets/terms_and_condition.dart';
import 'package:rick_blog/features/auth/presentation/blocs/register/bloc/register_bloc.dart';
import 'package:rick_blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:rick_blog/features/auth/presentation/widgets/auth_button.dart';
import 'package:rick_blog/features/auth/presentation/validators/register_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  bool isAccepted = false;

  final _fromKey = GlobalKey<FormState>();

  String _password = '';

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if(state is RegisterFailure){
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return Form(
                key: _fromKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.get('app_logo'),
                        height: MediaQuery.of(context).size.height * 0.20,
                      ),
                      Text(
                        'Please create an account or log in to continue.',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      AuthField(
                        validator: RegisterValidator.validateFullName,
                        labelText: 'Full Name',
                        controller: fullNameController,
                        hintText: 'Enter your Full Name',
                        prefixIcon: Image.asset(
                          AppImages.get('user'),
                          width: 22,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 20),

                      AuthField(
                        validator: RegisterValidator.validateEmail,
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
                        validator: RegisterValidator.validatePassword,
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
                          onPressed: () =>
                              setState(() => isObscure = !isObscure),
                        ),
                      ),
                      const SizedBox(height: 20),

                      AuthField(
                        validator: (val) =>
                            RegisterValidator.validateConfirmPassword(
                              val,
                              _password,
                            ),
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        isPassword: isObscure,
                        prefixIcon: Image.asset(
                          AppImages.get('password'),
                          width: 22,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        // suffixIcon: IconButton(
                        //   icon: Image.asset(
                        //     isObscure
                        //         ? AppImages.get('hide_password')
                        //         : AppImages.get('show_password'),
                        //     width: 22,
                        //     color: Theme.of(context).colorScheme.onSurface,
                        //   ),
                        //   onPressed: () => setState(() => isObscure = !isObscure),
                        // ),
                      ),

                      const SizedBox(height: 20),

                      TermeAndCondition(
                        value: isAccepted,
                        onChanged: (val) => setState(() => isAccepted = val!),
                      ),

                      const SizedBox(height: 30),

                      AuthButton(
                        isLoading: state is RegisterLoading, // 🔥 ici
                        backgroundColor: isAccepted
                            ? primaryColor
                            : const Color.fromARGB(255, 224, 224, 224),
                        text: const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onTap: isAccepted
                            ? () {
                                if (_fromKey.currentState!.validate()) {
                                  context.read<RegisterBloc>().add(
                                    RegisterUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      fullName: fullNameController.text,
                                    ),
                                  );
                                }
                              }
                            : null,
                      ),

                      const SizedBox(height: 20),

                      Text.rich(
                        TextSpan(
                          text: 'You already have an account?',
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            const WidgetSpan(child: SizedBox(width: 8)),
                            TextSpan(
                              text: 'Sign In',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.go(AppRouter.login);
                                },

                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: primaryColor,
                                    decorationColor: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
