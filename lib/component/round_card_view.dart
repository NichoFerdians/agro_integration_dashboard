import 'package:bordered_text/bordered_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RoundCardView extends StatelessWidget {
  const RoundCardView({
    required this.label,
    required this.primary,
    required this.onPrimary,
    required this.onTap,
    this.isCenter = false,
    Key? key,
  }) : super(key: key);

  final String label;
  final bool isCenter;
  final Color primary;
  final Color onPrimary;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onTap ?? () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor:
                MaterialStateProperty.all(primary), // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue.withAlpha(30); // <-- Splash color
              }
            }),
          ),
          child: const Icon(
            EvaIcons.activity,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _buildLabel()
      ],
    );
  }

  Widget _buildLabel() {
    if (isCenter) {
      return BorderedText(
        strokeColor: Colors.black,
        strokeWidth: 3,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: onPrimary,
            letterSpacing: 1,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 110),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
      );
    }
  }
}
