import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'qr_dialog.dart';

class GenerateQrWidget extends StatelessWidget {
  final TextEditingController controller;

  const GenerateQrWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 243, 234, 245),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                EvaIcons.arrowIosBackOutline,
                color: Color(0xFF6565FF),
                size: 32,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 234, 245),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Make my code \nscan to website",
                    style: TextStyle(
                      fontFamily: 'poppins_bold',
                      fontSize: 24,
                    ),
                  ),
                  Gap(8),
                  Text(
                    "Your QR Code will be generated automatically",
                    style: TextStyle(
                      fontFamily: 'poppins_regular',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFF4E3F7),
              height: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter your website url",
                    style: TextStyle(
                      fontFamily: 'poppins_semi_bold',
                      fontSize: 16,
                    ),
                  ),
                  const Gap(16),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'https://Test.com',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 241, 239, 239),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showQrDialog(context, controller.text),
        backgroundColor: const Color(0xFF6565FF),
        child: const Icon(Icons.qr_code_2_sharp),
      ),
    );
  }
}
