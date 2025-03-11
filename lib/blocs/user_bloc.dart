import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ImagePicker _picker = ImagePicker();

  UserBloc() : super(UserInitial()) {
    on<CaptureImageEvent>((event, emit) async {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );

      if (pickedFile != null) {
        emit(ImageCapturedState(pickedFile.path));
      }
    });

    on<SaveUserDetailsEvent>((event, emit) async {
      // user details (you can replace with actual logic)
      await Future.delayed(Duration(seconds: 1));
      emit(UserSavedState());
    });
  }
}
