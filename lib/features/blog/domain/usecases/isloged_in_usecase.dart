import 'package:blog_application/features/blog/domain/repositories/auth_repository.dart';


class IsLogedIn {
  final AuthRepository repository;
  IsLogedIn(this.repository);
  
  
  bool call()  {
    return  repository.isLoggedIn();
  }

}
