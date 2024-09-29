

import '../../../../domain/models/user_data.dart';
import '../../../utils/validation_item.dart';

class ProfileUpdateState {

  ValidationItem id;
  ValidationItem username;
  ValidationItem image;
  ValidationItem email;

  ProfileUpdateState({
    this.id = const ValidationItem(),
    this.username = const ValidationItem(),
    this.image = const ValidationItem(),
    this.email = const ValidationItem(),
  });

  toUser() => UserData(
    id: this.id.value,
    username: this.username.value,
    image: this.image.value,
    email: this.email.value
  );

  //nos permite cambiar los valores escritos en los textfields
  ProfileUpdateState copyWith({
    ValidationItem? id,
    ValidationItem? username,
    ValidationItem? image,
    ValidationItem? email,
  }) => ProfileUpdateState(
    id: id ?? this.id,
    username: username ?? this.username,
    image: image ?? this.image,
    email: email ?? this.email,
  );

  bool isValid() {
    if (
      id.value.isEmpty ||
      id.error.isNotEmpty ||
      username.value.isEmpty ||
      username.error.isNotEmpty ||
          email.value.isEmpty ||
          email.error.isNotEmpty
    ) {
      return false;
    }
    return true;    
  }

}