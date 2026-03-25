import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/failures.dart';

abstract class RegisterRepository {

Future <Either<Failure, String>> register({
  required String fullName,
  required String email,
  required String password

});
 
}