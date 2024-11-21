import 'package:learning_flutter_b/kernel/utils/dio_client.dart';
import 'package:learning_flutter_b/modules/posts/entities/post_entity.dart';
import 'package:learning_flutter_b/modules/posts/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<PostEntity> getPost(int id);
  Future<PostEntity> createPost(PostModel model);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioClient dioClient;

  PostRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PostEntity> getPost(int id) async {
    try {
      final response = await dioClient.dio.get('/posts/$id');
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<PostEntity> createPost(PostModel model) async {
    try {
      final response = await dioClient.dio.post('/users', data: model.toJson());
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }
}
