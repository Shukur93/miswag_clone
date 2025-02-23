import 'package:flutter/material.dart';

class SectionGroup {
  final List<SectionItem> items;

  SectionGroup({required this.items});
}

class SectionItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  SectionItem(
      {required this.title,
      required this.icon,
      this.onTap,
      this.subtitle,
      this.iconColor});
}
