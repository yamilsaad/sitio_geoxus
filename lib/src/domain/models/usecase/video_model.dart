class VideoModel {
  final String idVideo;
  final String videoUrl;

  VideoModel({required this.idVideo, required this.videoUrl});

  // Constructor para convertir un documento de Firestore en un modelo.
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      idVideo: json['id_video'] ?? '',
      videoUrl: json['video_url'] ?? '',
    );
  }
}
