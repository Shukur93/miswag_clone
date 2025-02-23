import 'package:flutter/material.dart';
import 'package:miswag_clone/core/data/categories.dart';
import 'package:miswag_clone/core/models/category_item.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedIndex = 0;
  final List<Widget> _contentPages = [];

  @override
  void initState() {
    super.initState();
    // Initialize content pages
    _contentPages.addAll(
      categories.map((category) => _buildContentPage(category)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Navigation Bar (Right Side)
          Container(
            width: 115,
            decoration: BoxDecoration(
                // color: ColorsManager.lightGray,
                color: Color(0xFFF2F2F2)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...categories.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
                    return _buildNavItem(category, index);
                  }),
                ],
              ),
            ),
          ),
          // Content Area (Left Side)
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                key: ValueKey<int>(_selectedIndex),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: Color(0xFFF6F6F8),
                child: _contentPages[_selectedIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(CategoryItem category, int index) {
    final isSelected = index == _selectedIndex;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.secondary.withAlpha(15)
              : Colors.transparent,
          border: Border(
            right: BorderSide(
              color: isSelected ? ColorsManager.secondary : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(category.icon, color: ColorsManager.blackText, size: 20,),
            verticalSpace(5),
            Text(
              category.title,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? ColorsManager.secondary
                    : ColorsManager.blackText,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentPage(CategoryItem category) {
    return SingleChildScrollView(
      child: category.content,
    );
  }
}
