import 'package:geoxus_web/src/core/utils/storage_utiles.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';
import 'package:geoxus_web/src/core/utils/firebase_services.dart';
import 'package:geoxus_web/src/domain/models/usecase/video_model.dart';

class VideoController extends GetxController {
  Rx<VideoModel?> _video = Rx<VideoModel?>(null);
  Rx<VideoPlayerController?> _videoPlayerController =
      Rx<VideoPlayerController?>(null);

  VideoModel? get video => _video.value;
  VideoPlayerController? get videoPlayerController =>
      _videoPlayerController.value;

  /// Obtiene los datos del video desde Firestore y configura el reproductor de video.
  Future<void> fetchVideo() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('videos').get();

      if (snapshot.docs.isNotEmpty) {
        final videoData = snapshot.docs.first.data();

        // Obtén la URL pública del video desde Firebase Storage.
        final videoUrl =
            await StorageUtils.getDownloadUrl(videoData['video_url']);

        // Configura el modelo y el reproductor de video.
        _video.value = VideoModel(
          idVideo: videoData['id_video'] ?? '',
          videoUrl: videoUrl,
        );

        final controller = VideoPlayerController.network(videoUrl);
        await controller.initialize();
        controller.setLooping(true);
        controller.play();

        _videoPlayerController.value = controller;
      }
    } catch (e) {
      print("Error fetching video: $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController?.dispose();
  }
}
