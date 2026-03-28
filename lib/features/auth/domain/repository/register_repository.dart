import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/failures.dart';

import 'package:rick_blog/features/auth/domain/entities/user.dart';

abstract class RegisterRepository {

Future <Either<Failure, User>> register({
  required String fullName,
  required String email,
  required String password

});
 
}