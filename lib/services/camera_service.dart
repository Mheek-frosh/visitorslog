import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CameraService {
  static Future<String> captureImage() async {
    try {
      // Get the list of available cameras
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);

      final CameraController controller = CameraController(frontCamera, ResolutionPreset.medium);
      await controller.initialize();

      // Capture image
      final XFile image = await controller.takePicture();
      final String imagePath = (await getApplicationDocumentsDirectory()).path + "/captured_image.jpg";

      // Save the image to the device storage
      File(image.path).copySync(imagePath);

      // Dispose of the camera controller
      await controller.dispose();

      return imagePath;
    } catch (e) {
      print("Error capturing image: $e");
      return "";
    }
  }
}
