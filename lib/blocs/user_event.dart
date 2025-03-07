abstract class UserEvent {}

class CaptureImageEvent extends UserEvent {}

class SaveUserDetailsEvent extends UserEvent {
  final String fullName;
  final String companyName;
  final String companyAddress;
  final String email;
  final String phone;
  final String imagePath;

  SaveUserDetailsEvent({
    required this.fullName,
    required this.companyName,
    required this.companyAddress,
    required this.email,
    required this.phone,
    required this.imagePath,
  });
}
