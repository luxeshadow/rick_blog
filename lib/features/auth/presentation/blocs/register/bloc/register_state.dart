part of 'register_bloc.dart';

@immutable
sealed class RegisterState {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String uid;
  RegisterSuccess(this.uid);

}

final class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure(this.message);
}
