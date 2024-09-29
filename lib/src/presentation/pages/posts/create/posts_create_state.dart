import 'dart:io';
import '../../../../domain/models/post.dart';
import '../../../utils/validation_item.dart';


///estado para el formulario validar si es vacio
class PostsCreateState {

  ValidationItem name;
  ValidationItem description;
  File? image;
  String category;
  String idUser;
  String error;

  PostsCreateState({
    this.name = const ValidationItem(),
    this.description = const ValidationItem(),
    this.image,
    this.category = 'CATEGORIES',
    this.idUser = '',
    this.error = ''
  });

  toPost() => Post(
    name: name.value,
    description: description.value,
    category: category,
    idUser: idUser
  );

  bool isValid () {
    if (
      name.value.isEmpty || name.error.isNotEmpty ||
      description.value.isEmpty || description.error.isNotEmpty ||
      image == null ||
      category.isEmpty ||
      idUser.isEmpty 
    ) {
      return false;
    }
    return true;
  }
    
  PostsCreateState copyWith({
    ValidationItem? name,
    ValidationItem? description,
    File? image,
    String? category,
    String? idUser,
    String? error
  }) => PostsCreateState(
    name: name ?? this.name,
    description: description ?? this.description,
    image: image ?? this.image,
    category: category ?? this.category,
    idUser: idUser ?? this.idUser,
    error: error ?? this.error,
  );
 
}