import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: const Text(
        //   "MrQR",
        //   style: TextStyle(
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Scan QR Code",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
              ),
            ),
            const Gap(8),
            const Text(
              "Scan QR Code",
              style: TextStyle(
                fontFamily: 'poppins_regular',
                fontSize: 16,
              ),
            ),
            const Gap(15),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _buildQrView(context),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: (result != null)
                    ? SelectableText(
                        'Barcode Type: ${describeEnum(result!.format)}\n   Data: ${result!.code}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'poppins_regular',
                          fontSize: 16,
                          color: Color(0xFF6565FF),
                        ),
                      )
                    : const Text('Scan a code'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderWidth: 10.0,
        cutOutSize: scanArea,
        borderColor: const Color(0xFF6565FF),
        borderRadius: 10,
        borderLength: 30,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
