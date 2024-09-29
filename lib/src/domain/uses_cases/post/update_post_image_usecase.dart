import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../models/post.dart';
import '../../repository/posts_repository.dart';

@Injectable()
class UpdatePostImageUseCase {

  PostsRepository _repository;

  UpdatePostImageUseCase(this._repository);

  launch(Post post, File file) => _repository.updateWithImage(post, file);

}