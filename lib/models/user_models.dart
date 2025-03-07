class UserModel {
  final String fullName;
  final String companyName;
  final String companyAddress;
  final String email;
  final String phone;
  final String imagePath;

  UserModel({
    required this.fullName,
    required this.companyName,
    required this.companyAddress,
    required this.email,
    required this.phone,
    required this.imagePath,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'companyName': companyName,
      'companyAddress': companyAddress,
      'email': email,
      'phone': phone,
      'imagePath': imagePath,
    };
  }

  // Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      companyName: json['companyName'],
      companyAddress: json['companyAddress'],
      email: json['email'],
      phone: json['phone'],
      imagePath: json['imagePath'],
    );
  }
}
