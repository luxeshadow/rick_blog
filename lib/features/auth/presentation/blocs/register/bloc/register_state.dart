
part of 'register_bloc.dart';

@immutable
sealed class RegisterState {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

final class RegisterSuccess extends RegisterState {
  final User user;

  const RegisterSuccess(this.user);
}

final class RegisterFailure extends RegisterState {
  final String message;

  const RegisterFailure(this.message);
}