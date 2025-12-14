import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newst/core/data/local_data/preferences_manager.dart';
import 'package:newst/core/theme/theme_data.dart';
import 'package:newst/features/login/controller/auth/login_bloc.dart';
import 'package:newst/features/signup/controller/bloc/signup_bloc.dart';
import 'package:newst/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferencesManager().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(auth: FirebaseAuth.instance),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(auth: FirebaseAuth.instance),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
