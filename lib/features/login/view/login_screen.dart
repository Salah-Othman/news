import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newst/core/data/local_data/preferences_manager.dart';
import 'package:newst/core/theme/light_color.dart';
import 'package:newst/core/widgets/custom_button.dart';
import 'package:newst/core/widgets/custom_text_feild.dart';
import 'package:newst/features/home/view/home_screen.dart';
import 'package:newst/features/login/controller/auth/login_bloc.dart';
import 'package:newst/features/login/controller/auth/login_event.dart';
import 'package:newst/features/login/controller/auth/login_state.dart';
import 'package:newst/features/signup/controller/bloc/signup_bloc.dart';
import 'package:newst/features/signup/view/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return Center(child: CircularProgressIndicator());
              },
            );
          } else if (state is LoginLoaded) {
            showDialog(
              context: context,
              builder: (context) {
                PreferencesManager().setBool('is_logged_in', true);
                return Center(child: Text('Login Successful'));
              },
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is LoginError) {
            showDialog(
              context: context,
              builder: (context) {
                return Center(child: Text(state.message));
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 160),
                Center(child: Image.asset('assets/images/logo.png')),
                SizedBox(height: 33),
                Text(
                  'Welcome To Newts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(54, 54, 54, 1),
                  ),
                ),
                SizedBox(height: 16),
                CustomTextFeild(
                  text: 'Email',
                  hintText: 'Salah@gmail.com',
                  controller: emailController,
                ),
                SizedBox(height: 12),
                CustomTextFeild(
                  text: 'Password',
                  hintText: '*************',
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    context.read<LoginBloc>().add(
                      LoginAccountEvent(email: email, password: password),
                    );
                  },
                  text: 'Sign In',
                ),
                SizedBox(height: 34),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (_) =>
                              SignUpBloc(auth: FirebaseAuth.instance),
                          child: SignupScreen(),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: LightColor.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
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
