import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final Icon icon;
  const SocialIconButton({
    Key? key,
    this.onPressed,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 60,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      color: color,
      shape: const CircleBorder(),
      child: icon,
    );
  }
}
