import 'package:flutter/material.dart';

import '../widgets/widget_exports.dart';

class CreateWebQrScreen extends StatefulWidget {
  const CreateWebQrScreen({super.key});

  @override
  State<CreateWebQrScreen> createState() => _CreateWebQrScreenState();
}

class _CreateWebQrScreenState extends State<CreateWebQrScreen> {
  late final TextEditingController _qrController;
  @override
  void initState() {
    _qrController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenerateQrWidget(
      controller: _qrController,
    );
  }
}
