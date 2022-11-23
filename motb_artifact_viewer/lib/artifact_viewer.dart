import 'package:flutter/material.dart';
import 'package:motb_artifact_viewer/artifact_controller.dart';
import 'package:open_layers_viewer/open_layers_image_viewer.dart';
import 'package:threeJS_Viewer/threeJSModelViewer.dart';

class ArtifactViewer extends StatefulWidget {
  final List<String> artifactUrls;
  final Function(ArtifactController c) onWebViewCreated;
  final Function(String message, int code) onError;
  final bool isThreeDimensional;
  final double scale;
  final Widget Function(double? progress, String message) progressBuilder;

  const ArtifactViewer({
    Key? key,
    required this.artifactUrls,
    required this.onWebViewCreated,
    required this.isThreeDimensional,
    this.scale = 1.0,
    required this.onError,
    required this.progressBuilder,
  }) : super(key: key);

  @override
  State<ArtifactViewer> createState() => _ArtifactViewerState();
}

class _ArtifactViewerState extends State<ArtifactViewer> {
  List<ThreeModel>? models;
  ArtifactController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.isThreeDimensional) {
      models = widget.artifactUrls.map((url) => ThreeModel(src: url, playAnimation: false)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isThreeDimensional
        ? ThreeJSViewer(
            models: models ?? [],
            scale: widget.scale,
            progressBuilder: widget.progressBuilder,
            onWebViewCreated: (c) {
              controller = ArtifactController(threeJSController: c, isThreeDimensional: widget.isThreeDimensional);
              widget.onWebViewCreated(controller!);
            },
            onError: widget.onError,
          )
        : OpenLayersImageViewer(
            initialUrl: widget.artifactUrls[0],
            progressBuilder: widget.progressBuilder,
            onWebViewCreated: (c) {
              controller = ArtifactController(openLayersController: c, isThreeDimensional: widget.isThreeDimensional);
              widget.onWebViewCreated(controller!);
            },
            onError: widget.onError,
          );
  }
}
