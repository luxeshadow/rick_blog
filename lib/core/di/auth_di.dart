import 'package:rick_blog/core/di/service_locator.dart';
import 'package:rick_blog/features/auth/data/datasources/register_remote_data_source.dart';
import 'package:rick_blog/features/auth/data/repositories/register_repository_impl.dart';
import 'package:rick_blog/features/auth/domain/repository/register_repository.dart';
import 'package:rick_blog/features/auth/application/usecases/register_usecase.dart';
import 'package:rick_blog/features/auth/presentation/blocs/register/bloc/register_bloc.dart';


void initAuth() {
  sl..registerLazySingleton<RegisterRemoteDataSource>(() => RegisterRemoteDataSourceImpl(sl()))
    ..registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl()))
    ..registerLazySingleton(() => RegisterUsecase(sl()))
    ..registerFactory(() => RegisterBloc(registerUsecase: sl()));
}