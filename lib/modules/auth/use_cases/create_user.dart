import 'package:learning_flutter_b/modules/auth/entities/user.dart';
import 'package:learning_flutter_b/modules/auth/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser({required this.repository});

  Future<User> call(User user) async {
    return await repository.createUser(user);
  }
}