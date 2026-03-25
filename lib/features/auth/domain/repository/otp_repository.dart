import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/failures.dart';

abstract interface class OtpRepository {

  Future<Either<Failure,String>>sendOtp({
    required String otp
  });
  
}