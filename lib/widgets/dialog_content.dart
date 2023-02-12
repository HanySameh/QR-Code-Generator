import 'dart:io';
import 'dart:typed_data';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'widget_exports.dart';

class DialogContent extends StatefulWidget {
  const DialogContent({super.key, required this.text});
  final String text;
  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final ScreenshotController _screenshotController = ScreenshotController();

  Future _saveQrCodeImage() async {
    final image = await _screenshotController.capture();
    await _saveImage(image as Uint8List);
  }

  Future<String> _saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');

    final String name = 'QR_$time';

    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }

  Future _shareQrImage() async {
    final bytes = await _screenshotController.capture();
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/qr.png');
    image.writeAsBytesSync(bytes!);
    XFile file = XFile(image.path);
    await Share.shareXFiles(
      [file],
      text: 'Share Your QR Code image with friends',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 36,
          ),
          height: MediaQuery.of(context).size.height * 0.60,
          width: MediaQuery.of(context).size.width * 0.860,
          decoration: const BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xFFFEEDFC),
                Colors.white,
                Color(0xFFE4E6F7),
                Color(0xFFE2E5F5),
              ],
              tileMode: TileMode.mirror,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Screenshot(
                    controller: _screenshotController,
                    child: QrImageWidget(data: widget.text),
                  ),
                  const Gap(10.0),
                  const Text(
                    'Here your code!!',
                    style: TextStyle(
                      fontFamily: 'poppins_bold',
                      fontSize: 28,
                      color: Color(0xFF6565FF),
                    ),
                  ),
                  const Text(
                    "This is your unique QR code for another person to scan",
                    style: TextStyle(
                      fontFamily: 'poppins_regular',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await _shareQrImage();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 32.0,
                                color: const Color.fromARGB(255, 133, 142, 212)
                                    .withOpacity(0.68),
                              ),
                            ],
                          ),
                          child: const Icon(
                            EvaIcons.shareOutline,
                            color: Color(0xFF6565FF),
                          ),
                        ),
                      ),
                      const Gap(8),
                      const Text(
                        "Share",
                        style: TextStyle(
                          fontFamily: 'poppins_semi_bold',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await _saveQrCodeImage();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 32.0,
                                color: const Color.fromARGB(
                                  255,
                                  133,
                                  142,
                                  212,
                                ).withOpacity(0.68),
                              ),
                            ],
                          ),
                          child: const Icon(
                            EvaIcons.saveOutline,
                            color: Color(0xFF6565FF),
                          ),
                        ),
                      ),
                      const Gap(8),
                      const Text(
                        "Save",
                        style: TextStyle(
                          fontFamily: 'poppins_semi_bold',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
