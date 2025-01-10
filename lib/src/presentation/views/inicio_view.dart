import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../core/components/component.dart';
import '../widgets/widget.dart';

///Vista principal en el HomePage.
///Muestra banner video.
///Muestra tres Cards a seleccionar.
///Muestra Button para obtener Geoxus "QUIERO GEOXUS"

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  String? _errorMessage;

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Column(
        children: [
          Stack(
            children: [
              VideoFondoWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  isLoading: _isLoading,
                  errorMessage: _errorMessage,
                  controller: _controller),
              Column(
                children: [
                  TextoBannerWidget(
                      screenHeight: screenHeight, screenWidth: screenWidth),
                  QuieroGeoxusComponent(
                      screenWidth: screenWidth, screenHeight: screenHeight),
                ],
              )
            ],
          ),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          AvatarSelectionWidget(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          )
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
      height: screenHeight * 0.4,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeIn(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'Bienvenido a Geoxus. Bienvenido al futuro.',
                  style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              FadeIn(
                duration: const Duration(milliseconds: 1300),
                child: Text(
                  'Releva y monitorea eventos en tiempo real. Potencia los procesos de resolución.',
                  style: TextStyle(
                      fontSize: screenWidth * 0.015,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
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
      height: screenHeight * 0.03,
      width: screenWidth,
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
