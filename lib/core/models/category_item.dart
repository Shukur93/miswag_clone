import 'package:flutter/material.dart';

class CategoryItem {
  final String title;
  final IconData icon;
  final Widget content; 

  CategoryItem({
    required this.title,
    required this.icon,
    required this.content,
  });
}