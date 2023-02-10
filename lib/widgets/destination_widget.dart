import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DestinationWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  final Color color;
  const DestinationWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 16.0,
              color: const Color.fromARGB(255, 194, 200, 244).withOpacity(0.50),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
                const Gap(8),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'poppins_regular',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Icon(
              EvaIcons.arrowIosForwardOutline,
              color: Color(0xFF6565FF),
            ),
          ],
        ),
      ),
    );
  }
}
