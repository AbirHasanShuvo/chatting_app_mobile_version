class UserModel {
  final int id;
  final String name;
  final String? phone;
  final String email;
  final String? dateOfBirth;
  final String? profilePicture;

  UserModel({
    required this.id,
    required this.name,
    this.phone,
    required this.email,
    this.dateOfBirth,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String,
      dateOfBirth: json['date_of_birth'] as String?,
      profilePicture: json['profile_picture'] as String?,
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
    };
  }
}