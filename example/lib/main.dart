import 'package:example/artifact_model.dart';
import 'package:flutter/material.dart';
import 'package:motb_artifact_viewer/motb_artifact_viewer.dart';

void main() {
  runApp(const ArtifactViewerApp());
}

class ArtifactViewerApp extends StatefulWidget {
  const ArtifactViewerApp({super.key});

  @override
  State<ArtifactViewerApp> createState() => _ArtifactViewerAppState();
}

class _ArtifactViewerAppState extends State<ArtifactViewerApp> {
  Artifact artifact = openLayersArtifact;
  ArtifactController? _controller;
  late String selectedUrl = artifact.modelUrls[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (artifact.isThreeDimensional) {
              _controller?.threeJSController?.tweenCamera(0, 10, 15, 2000, false, yOffset: 8);
              _controller?.threeJSController?.resetCameraControls(false);
            } else {
              if (selectedUrl == artifact.modelUrls[artifact.modelUrls.length - 1]) {
                selectedUrl = artifact.modelUrls[0];
              } else {
                selectedUrl = artifact.modelUrls[artifact.modelUrls.indexOf(selectedUrl) + 1];
              }
              _controller?.openLayersController?.updateLayer(selectedUrl);
              _controller?.openLayersController?.resetControls();
            }
          },
        ),
        body: ArtifactViewer(
          artifactUrls: artifact.modelUrls,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          scale: artifact.cameraZoom,
          isThreeDimensional: artifact.isThreeDimensional,
          onError: (message, code) {
            print('Error: $message, Code: $code');
          },
          progressBuilder: (progress, message) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (progress != null)
                    CircularProgressIndicator(
                      value: progress,
                      color: Colors.red,
                    ),
                  if (message.isNotEmpty) Text(message),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
