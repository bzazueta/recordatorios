
import 'package:injectable/injectable.dart';

import '../../models/post.dart';
import '../../repository/posts_repository.dart';
import '../../utils/resource.dart';

@Injectable()
class GetPostsByIdUseCase {

  PostsRepository _repository;

  GetPostsByIdUseCase(this._repository);

  Stream<Resource<List<Post>>> launch(String id) => _repository.getPostsById(id);

}