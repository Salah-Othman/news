abstract class LoginEvent {}

class LoginAccountEvent extends LoginEvent {
  final String email;
  final String password;

  LoginAccountEvent({required this.email, required this.password});
}
