import 'dart:io';

import '../models/post.dart';
import '../utils/resource.dart';


abstract class PostsRepository {

  Future<Resource<String>> create(Post post, File image);
  Future<Resource<String>> delete(String idPost);
  Future<Resource<String>> update(Post post);
  Future<Resource<String>> updateWithImage(Post post, File image);
  Future<Resource<bool>> like(String idPost, String idUser);
  Future<Resource<bool>> deleteLike(String idPost, String idUser);
  Stream<Resource<List<Post>>> getPosts();/// stream se usa para la informacion en tiempo real con firebase
  Stream<Resource<List<Post>>> getPostsById(String id);

}