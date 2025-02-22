import 'package:flutter/material.dart';

class TinyIconButton extends StatelessWidget {
  const TinyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
