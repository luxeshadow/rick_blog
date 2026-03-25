import 'package:rick_blog/core/error/failures.dart';
import 'package:rick_blog/features/auth/domain/repository/register_repository.dart';
import 'package:rick_blog/features/auth/data/datasources/register_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/exeptions.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  
  final RegisterRemoteDataSource remoteDataSource;
  RegisterRepositoryImpl(this.remoteDataSource);
@override
  Future<Either<Failure, String>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.register(
        fullName: fullName,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerExeption catch (e) {
      return left(Failure(e.message));
    }
  }
}
