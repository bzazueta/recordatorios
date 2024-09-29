import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../models/post.dart';
import '../../repository/posts_repository.dart';

@Injectable()
class CreatePostUseCase {

  PostsRepository _repository;

  CreatePostUseCase(this._repository);

  launch(Post post, File image) => _repository.create(post, image);

}