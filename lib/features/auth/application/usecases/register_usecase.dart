import 'package:fpdart/fpdart.dart';
import 'package:rick_blog/core/error/failures.dart';
import 'package:rick_blog/core/usecases/usecase.dart';
import 'package:rick_blog/features/auth/application/params/register_params.dart';
import 'package:rick_blog/features/auth/domain/repository/register_repository.dart';


class RegisterUsecase implements Usecase<String, RegisterParams> {
  final RegisterRepository registerRepository;

  RegisterUsecase(this.registerRepository);

  @override
  Future<Either<Failure, String>> call(RegisterParams params) async {
    return await registerRepository.register(
      fullName: params.fullName, 
      email: params.email, 
      password: params.password,
    );
  }
}
