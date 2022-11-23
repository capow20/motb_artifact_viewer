import 'package:open_layers_viewer/open_layers_viewer.dart';
import 'package:threeJS_Viewer/threeJSController.dart';

class ArtifactController {
  final ThreeJSController? threeJSController;
  final OpenLayersController? openLayersController;
  final bool isThreeDimensional;

  ArtifactController({
    this.threeJSController,
    this.openLayersController,
    required this.isThreeDimensional,
  });

  //=====Shared Methods=====//
  Future<void> setupScene(String url, {bool debug = false}) async {
    return isThreeDimensional ? await threeJSController?.setupScene(debug) : await openLayersController?.setupScene(url);
  }

  Future<void> resetControls({bool autoRotate = false, double? yOffset}) async {
    return isThreeDimensional ? threeJSController?.resetCameraControls(autoRotate, yOffset: yOffset) : openLayersController?.resetControls();
  }

  //Methods specific to either controller can be called with:
  //controller.threeJsController.methodName() or controller.openLayersController.methodName()
}
