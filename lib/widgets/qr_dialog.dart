import 'package:flutter/material.dart';

import 'widget_exports.dart';

showQrDialog(BuildContext context, String text) => showDialog(
      context: context,
      builder: (context) {
        return DialogContent(
          text: text,
        );
      },
    );
