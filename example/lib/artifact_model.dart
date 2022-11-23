class Artifact {
  const Artifact({
    required this.id,
    required this.uuid,
    required this.title,
    required this.dateAdded,
    required this.provenance,
    required this.description,
    required this.modelUrls,
    required this.backgroundUrl,
    //equired this.focusPoints,
    required this.previewImageUrl,
    required this.cameraX,
    required this.cameraY,
    required this.cameraZ,
    required this.cameraZoom,
    required this.isThreeDimensional,
  }) : super();

  final int id;
  final String uuid;
  final String title;
  final DateTime dateAdded;
  final String? provenance;
  final String description;
  final List<String> modelUrls;
  final String backgroundUrl;
  final String previewImageUrl;
  final double? cameraX;
  final double? cameraY;
  final double? cameraZ;
  final double cameraZoom;
  final bool isThreeDimensional;
  //final List<FocusPoint>? focusPoints;

  static Artifact get empty => Artifact(
        id: -1,
        uuid: '',
        title: '',
        dateAdded: DateTime(2021),
        provenance: '',
        description: '',
        modelUrls: [],
        backgroundUrl: '',
        previewImageUrl: '',
        cameraX: null,
        cameraY: null,
        cameraZ: null,
        cameraZoom: 8.0,
        isThreeDimensional: true,
      );
}

Artifact threeJSArtifact = Artifact(
  id: 1,
  uuid: 'nebuchadnezzarBrick',
  title: 'Nebuchadnezzar Brick',
  dateAdded: DateTime.parse('2021-01-01'),
  provenance: '',
  description: '',
  modelUrls: ["https://imgprd21.museumofthebible.org/mobileapi/assets/artifacts/NebBrick13.glb"],
  backgroundUrl: "asset://artifacts/nebBrick/neb-brick-bg.png",
  previewImageUrl: "asset://artifacts/nebBrick/previewNebBrick.png",
  cameraX: 0.0,
  cameraY: 0.0,
  cameraZ: 0.0,
  cameraZoom: 4500.0,
  isThreeDimensional: true,
);

Artifact openLayersArtifact = Artifact(
  id: 1,
  uuid: 'olTest',
  title: 'Open Layers Test',
  dateAdded: DateTime.parse('2021-01-01'),
  provenance: '',
  description: '',
  modelUrls: [
    "https://imgprd21.museumofthebible.org/mobileapi/assets/tiled/tiled_one/",
    "https://imgprd21.museumofthebible.org/mobileapi/assets/tiled/tiled_two/",
    "https://imgprd21.museumofthebible.org/mobileapi/assets/tiled/tiled_three/",
  ],
  backgroundUrl: "asset://artifacts/nebBrick/neb-brick-bg.png",
  previewImageUrl: "asset://artifacts/nebBrick/previewNebBrick.png",
  cameraX: 0.0,
  cameraY: 0.0,
  cameraZ: 0.0,
  cameraZoom: 0.0,
  isThreeDimensional: false,
);
