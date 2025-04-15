part of 'model.dart';


Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    String status;
    String message;
    User data;
    String token;

    Login({
        required this.status,
        required this.message,
        required this.data,
        required this.token,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        data: User.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "token": token,
    };
}

class User {
    int id;
    String name;
    String email;
    String password;
    int isVerif;
    dynamic otp;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.isVerif,
        required this.otp,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isVerif: json["isVerif"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "isVerif": isVerif,
        "otp": otp,
    };
}