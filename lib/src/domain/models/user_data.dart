import 'dart:convert';

UserData userFromJson(String str) => UserData.fromJson(json.decode(str));

String userToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String id;
    String username;
    String email;
    String image; // URL
    String password;

    UserData({
        this.id = "",
        this.username = "",
        this.email = "",
        this.password = "",
        this.image = ""
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        password: json["password"] ?? '', 
        image: json["image"] ?? '' // null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "image": image,
        // "password": password,
    };
}