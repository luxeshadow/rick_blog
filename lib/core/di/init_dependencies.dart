import 'package:rick_blog/core/di/core_di.dart';
import 'package:rick_blog/core/di/auth_di.dart';

Future<void> initDependencies() async {
  await initCore(); 
  initAuth();       
}