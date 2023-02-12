import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImageWidget extends StatelessWidget {
  const QrImageWidget({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(16),
      height: 240,
      width: 240,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(60),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Colors.white,
            Color(0xFFE4E6F7),
            Colors.white,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Center(
        child: QrImage(
          data: data,
          size: 180,
          foregroundColor: const Color(0xFF8194FE),
        ),
      ),
    );
  }
}
