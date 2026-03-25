part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}


final class RegisterUser extends RegisterEvent {
  final String fullName;
  final String email;
  final String password;

  RegisterUser({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
