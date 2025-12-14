import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newst/features/signup/controller/bloc/signup_event.dart';
import 'package:newst/features/signup/controller/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth auth;
  SignUpBloc({required this.auth}) : super(SignUpInitial()) {
    on<CreateAccountEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(SignUpLoaded());
      } on FirebaseAuthException catch (e) {
        emit(SignUpError(message: e.toString()));
      } catch (e) {
        emit(SignUpError(message: e.toString()));
      }
    });
  }
}
