import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newst/features/login/controller/bloc/login_event.dart';
import 'package:newst/features/login/controller/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth auth;

  LoginBloc({required this.auth}) : super(LoginInitial()) {
    on<LoginAccountEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(LoginLoaded());
      } on FirebaseAuthException catch (e) {
        emit(LoginError(message: e.toString()));
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
