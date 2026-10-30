import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:parcel_receiving/features/capture_photo/lib/photo_storage.dart';

class CapturePhotoPage extends StatefulWidget {
  const CapturePhotoPage({super.key, this.fallbackBarcode});
  final String? fallbackBarcode;
  @override
  State<CapturePhotoPage> createState() => _CapturePhotoPageState();
}

class _CapturePhotoPageState extends State<CapturePhotoPage> {
  CameraController? _camera;
  List<CameraDescription> _cameras = const [];
  var _cameraIndex = 0;
  var _flashMode = FlashMode.off;
  String? _error;
  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    try {
      _cameras = await availableCameras();
      final camera = _cameras[_cameraIndex];
      final controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();
      final minimumZoom = await controller.getMinZoomLevel();
      final maximumZoom = await controller.getMaxZoomLevel();
      await controller.setZoomLevel(
        1.0.clamp(minimumZoom, maximumZoom).toDouble(),
      );
      if (mounted) setState(() => _camera = controller);
    } catch (error) {
      if (mounted) setState(() => _error = error.toString());
    }
  }

  @override
  void dispose() {
    _camera?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Фото посылки')),
    body: _error != null
        ? Center(child: Text(_error!))
        : _camera == null
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio:
                          MediaQuery.orientationOf(context) ==
                              Orientation.portrait
                          ? 1 / _camera!.value.aspectRatio
                          : _camera!.value.aspectRatio,
                      child: CameraPreview(_camera!),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: _toggleFlash,
                      icon: Icon(
                        _flashMode == FlashMode.torch
                            ? Icons.flash_on
                            : Icons.flash_off,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filledTonal(
                      onPressed: _cameras.length > 1 ? _switchCamera : null,
                      icon: const Icon(Icons.cameraswitch_outlined),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: Center(
                  child: FilledButton.icon(
                    onPressed: _capture,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Снять'),
                  ),
                ),
              ),
            ],
          ),
  );
  Future<void> _capture() async {
    final image = await _camera!.takePicture();
    final path = await PhotoStorage().save(image, widget.fallbackBarcode);
    if (mounted) context.pop(path);
  }

  Future<void> _toggleFlash() async {
    final next = _flashMode == FlashMode.torch
        ? FlashMode.off
        : FlashMode.torch;
    await _camera!.setFlashMode(next);
    if (mounted) setState(() => _flashMode = next);
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2) return;
    await _camera?.dispose();
    setState(() {
      _camera = null;
      _cameraIndex = (_cameraIndex + 1) % _cameras.length;
    });
    await _setup();
  }
}
