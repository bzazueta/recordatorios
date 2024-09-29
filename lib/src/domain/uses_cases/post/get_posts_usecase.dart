
import 'package:injectable/injectable.dart';

import '../../models/post.dart';
import '../../repository/posts_repository.dart';
import '../../utils/resource.dart';

@Injectable()
class GetPostsUseCase {

  PostsRepository _repository;

  GetPostsUseCase(this._repository);

  Stream<Resource<List<Post>>> launch() => _repository.getPosts();

}