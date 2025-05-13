class UserModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String dob;
  final String email;
  final String phoneNumber;
  final int gender;
  final String address;
  final String bio;
  final String imagePath;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.dob,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.bio,
    required this.imagePath,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      dob: json['dob'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      address: json['address'],
      bio: json['bio'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'dob': dob,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'address': address,
      'bio': bio,
      'imagePath': imagePath,
    };
  }
}
