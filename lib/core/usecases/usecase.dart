import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/failures.dart';

abstract class Usecase<SuccesssType, Params> {

  Future<Either<Failure,SuccesssType>> call(Params params);

}