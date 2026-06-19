class LoginResponse {
  final String message;
  final String token;
  final User data;

  LoginResponse({
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      data: User.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'data': data.toJson(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String dateOfBirth;
  final String profilePicture;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.dateOfBirth,
    required this.profilePicture,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'date_of_birth': dateOfBirth,
      'profile_picture': profilePicture,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}