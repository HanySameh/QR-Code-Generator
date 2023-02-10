import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';

showQrDialog(BuildContext context, String text) => showDialog(
      context: context,
      builder: (context) {
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
                  Container(
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
                        data: text,
                        size: 180,
                        foregroundColor: const Color(0xFF8194FE),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Here your code!!',
                        style: TextStyle(
                          fontFamily: 'poppins_bold',
                          fontSize: 28,
                          color: Color(0xFF6565FF),
                        ),
                      ),
                      Text(
                        "This is your unique QR code for another person to scan",
                        style: TextStyle(
                          fontFamily: 'poppins_regular',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 32.0,
                                  color:
                                      const Color.fromARGB(255, 133, 142, 212)
                                          .withOpacity(0.68),
                                ),
                              ],
                            ),
                            child: const Icon(
                              EvaIcons.shareOutline,
                              color: Color(0xFF6565FF),
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
                          Container(
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
      },
    );
