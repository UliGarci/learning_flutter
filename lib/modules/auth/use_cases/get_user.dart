import 'package:learning_flutter_b/modules/auth/entities/user.dart';
import 'package:learning_flutter_b/modules/auth/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});

  Future<User> call(int id) async {
    return await repository.getUser(id);
  }
}