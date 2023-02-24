import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/login_bloc.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_image_paths.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_string.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _loginBloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(ImagePaths.firebase)),
                SizedBox(height: AppSizes.searchPromptMargin),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.searchwhite,
                    borderRadius:
                        BorderRadius.circular(AppSizes.searchPromtRadius),
                  ),
                  child: SizedBox(
                    height: AppSizes.searchPromtHeight,
                    width: AppSizes.searchPromtWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: AppSizes.searchPromtPadding),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.invalidEmail;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.searchPromptMargin),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.searchwhite,
                    borderRadius:
                        BorderRadius.circular(AppSizes.searchPromtRadius),
                  ),
                  child: SizedBox(
                    height: AppSizes.searchPromtHeight,
                    width: AppSizes.searchPromtWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: AppSizes.searchPromtPadding),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.searchPromptMargin),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.searchwhite,
                    borderRadius:
                        BorderRadius.circular(AppSizes.searchPromtRadius),
                  ),
                  child: SizedBox(
                    height: AppSizes.searchPromtHeight,
                    width: AppSizes.searchPromtWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: AppSizes.searchPromtPadding),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _loginBloc.add(LoginButtonPressed(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                            if (_loginBloc.state is LoginSuccess) {
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
