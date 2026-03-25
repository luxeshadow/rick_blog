import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rick_blog/core/error/exeptions.dart';


abstract class RegisterRemoteDataSource {
  Future<String> register({
    required String fullName,
    required String email,
    required String password,
  });
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final SupabaseClient supabaseClient;
  RegisterRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {

      print('Envoi vers Supabase: full_name = $fullName');

      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'full_name': fullName},
      );
      if(response.user == null){
       
        throw ServerExeption('User is null');
        
      }
       print('success');
      return response.user!.id;
    } catch (e) {
      throw ServerExeption(e.toString());
    }
  }
}
