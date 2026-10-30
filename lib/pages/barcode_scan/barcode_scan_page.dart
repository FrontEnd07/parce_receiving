import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:parcel_receiving/shared/barcode/model/linear_barcode_formats.dart';

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});
  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  final _controller = MobileScannerController(
    formats: linearBarcodeFormats,
    autoZoom: true,
  );
  bool _found = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Сканирование штрихкода')),
    body: Stack(
      children: [
        MobileScanner(controller: _controller, onDetect: _onDetect),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 280,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Наведите на трек-код посылки',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 28,
          left: 0,
          right: 0,
          child: Center(
            child: FilledButton.tonalIcon(
              onPressed: _controller.toggleTorch,
              icon: const Icon(Icons.flashlight_on_outlined),
              label: const Text('Фонарик'),
            ),
          ),
        ),
      ],
    ),
  );
  void _onDetect(BarcodeCapture capture) {
    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue?.trim();
      if (_found || value == null || value.isEmpty) continue;
      _found = true;
      context.pop(value);
      return;
    }
  }
}
