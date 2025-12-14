import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newst/core/widgets/custom_button.dart';
import 'package:newst/core/widgets/custom_text_feild.dart';
import 'package:newst/features/login/controller/bloc/login_bloc.dart';
import 'package:newst/features/login/view/login_screen.dart';
import 'package:newst/features/signup/controller/bloc/signup_bloc.dart';
import 'package:newst/features/signup/controller/bloc/signup_event.dart';
import 'package:newst/features/signup/controller/bloc/signup_state.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: CircularProgressIndicator()));
          } else if (state is SignUpLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Account Created Successfully')),
              
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (state is SignUpError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
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
                  hintText: 'usama@gmail.com',
                  controller: emailController,
                  obscureText: false,
                ),
                SizedBox(height: 12),
                CustomTextFeild(
                  text: 'Password',
                  hintText: '*************',
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 12),
                CustomTextFeild(
                  text: 'Confirm Password',
                  hintText: '*************',
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isNotEmpty && password.isNotEmpty) {
                      BlocProvider.of<SignUpBloc>(context).add(
                        CreateAccountEvent(email: email, password: password),
                      );
                    }
                  },
                  text: 'Sign Up',
                ),
                SizedBox(height: 34),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (_) => LoginBloc(auth: FirebaseAuth.instance),
                          child: LoginScreen(),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have an account? ",
                        style: TextStyle(
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Color.fromRGBO(197, 48, 48, 1),
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
