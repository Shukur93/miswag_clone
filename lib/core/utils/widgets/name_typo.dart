import 'package:flutter/material.dart';

class NameTypoBoldLight extends StatelessWidget {
  const NameTypoBoldLight({
    super.key,
    required this.firstName,
    required this.restOfName,
  });

  final String firstName;
  final String restOfName;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstName,
            style: const TextStyle(
              color: Color(0xFF313131),
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' $restOfName',
            style: const TextStyle(
              color: Color(0xFF313131),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        height: 1.5,
        fontSize: 20,
      ),
      maxLines: 2,
    );
  }
}