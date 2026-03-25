import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter/material.dart';
import 'package:rick_blog/features/auth/application/params/register_params.dart';
import 'package:rick_blog/features/auth/application/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;
  RegisterBloc({required RegisterUsecase registerUsecase})
    : _registerUsecase = registerUsecase,
      super(RegisterInitial()) {
    on<RegisterUser>((event, emit) async {
      final res = await _registerUsecase(
        RegisterParams(
          fullName: event.fullName,
          email: event.email,
          password: event.password,
        ),
      );
      res.fold(
        (failure) => emit(RegisterFailure(failure.message)),
        (success) => emit(RegisterSuccess(success)),
      );
    });
  }
}
