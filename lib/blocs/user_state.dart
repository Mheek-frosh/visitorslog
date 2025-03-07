abstract class UserState {}

class UserInitial extends UserState {}

class ImageCapturedState extends UserState {
  final String imagePath;

  ImageCapturedState(this.imagePath);
}

class UserSavedState extends UserState {}
