import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      transform: GradientRotation(6.5),
                      stops: [0, 100],
                      colors: <Color>[
                        Color(0xFF9068FD),
                        Color(0xFF1E3B8C),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                    const Size(double.maxFinite, 52),
                  ),
                ),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyles.font16WhiteBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
