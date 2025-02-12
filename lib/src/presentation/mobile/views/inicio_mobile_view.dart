import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:geoxus_web/src/presentation/mobile/widgets/avatar_mobile_widget.dart';
import 'package:geoxus_web/src/presentation/mobile/widgets/text_avatar_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/components/component.dart';

///Vista principal en el HomePage.
///Muestra banner video.
///Muestra tres Cards a seleccionar.
///Muestra Button para obtener Geoxus "QUIERO GEOXUS"

class InicioMobileView extends StatefulWidget {
  const InicioMobileView({super.key});

  @override
  State<InicioMobileView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioMobileView> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  String? _errorMessage;
  bool _isVisible = false; // Para controlar la animación

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _controller = VideoPlayerController.asset('assets/videos/video_fondo.mp4')
        ..initialize().then((_) {
          setState(() {
            _isLoading = false;
          });
          _controller.setLooping(true);
          _controller.setVolume(
              0); // Silenciar el video para permitir reproducción automática
          _playVideo(); // Intentar reproducir automáticamente
        });
      _controller.addListener(_videoListener);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading video: $e';
      });
    }
  }

  void _videoListener() {
    if (_controller.value.hasError) {
      setState(() {
        _errorMessage = 'Video error: ${_controller.value.errorDescription}';
      });
    }
  }

  void _playVideo() {
    try {
      _controller.play();
    } catch (e) {
      setState(() {
        _errorMessage = 'Error attempting to play video: $e';
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      //color: Colors.green,
      width: _screenWidth,
      height: _screenHeight * 1.7,
      child: Column(
        children: [
          Stack(
            children: [
              VideoFondoWidget(
                  screenHeight: _screenHeight,
                  screenWidth: _screenWidth,
                  isLoading: _isLoading,
                  errorMessage: _errorMessage,
                  controller: _controller),
              Column(
                children: [
                  TextoBannerWidget(
                      screenHeight: _screenHeight, screenWidth: _screenWidth),
                  FadeIn(
                    duration: const Duration(milliseconds: 1500),
                    child: QuieroGeoxusMobileComponent(
                      screenWidth: _screenWidth,
                      screenHeight: _screenHeight,
                      textTitle: 'QUIERO GEOXUS',
                    ),
                  ),
                ],
              )
            ],
          ),
          const TextAvatarWidget(),
          AvatarMobileWidget(
              screenWidth: screenWidth, screenHeight: screenHeight),
        ],
      ),
    );
  }
}

///Texto principal del banner. Estático.
class TextoBannerWidget extends StatelessWidget {
  const TextoBannerWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.35,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              FadeIn(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'Bienvenido a Geoxus',
                  style: TextStyle(
                      fontSize: screenWidth * 0.075,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              FadeIn(
                duration: const Duration(milliseconds: 1300),
                child: Text(
                  'Releva y monitorea eventos en tiempo real.',
                  style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VideoFondoWidget extends StatelessWidget {
  const VideoFondoWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required bool isLoading,
    required String? errorMessage,
    required VideoPlayerController controller,
  })  : _isLoading = isLoading,
        _errorMessage = errorMessage,
        _controller = controller;

  final double screenHeight;
  final double screenWidth;
  final bool _isLoading;
  final String? _errorMessage;
  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.45,
      width: screenWidth * 1,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Text(_errorMessage!,
                      style: const TextStyle(color: Colors.red)))
              : FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
    );
  }
}
