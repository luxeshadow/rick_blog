import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/failures.dart';

abstract interface class LoginRepository {

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
}

