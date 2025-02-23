import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/models/category_item.dart';
import 'package:miswag_clone/screens/items_screen/items_screen.dart';

final List<CategoryItem> categories = [
  CategoryItem(
    title: 'تخفيضات وعروض',
    icon: Icons.percent_outlined,
    content: DummyLabels(),
  ),
  CategoryItem(
    title: 'الجمال والعناية',
    icon: Icons.health_and_safety_outlined,
    content: InkWell(
      onTap: () => Get.to(() => const ItemsScreen()),
      child: Image.asset('assets/images/category/categ2.png'),
    ),
  ),
  CategoryItem(
    title: 'أجهزة منزلية',
    icon: Icons.home_max_outlined,
    content: DummyLabels(),
  ),
  CategoryItem(
    title: 'الكمبيوتر والألعاب',
    icon: Icons.computer_outlined,
    content: Text('الكمبيوتر والألعاب'),
  ),
  CategoryItem(
    title: 'الهواتف والأجهزة اللوحية',
    icon: Icons.phone_android_outlined,
    content: InkWell(
      onTap: () => Get.to(() => const ItemsScreen()),
      child: Image.asset('assets/images/category/categ2.png'),
    ),
  ),
  CategoryItem(
    title: 'الأزياء والموضة',
    icon: Icons.shopping_bag_outlined,
    content: Text('الأزياء والموضة'),
  ),
  CategoryItem(
    title: 'الأثاث والديكور',
    icon: Icons.chair_outlined,
    content: InkWell(
      onTap: () => Get.to(() => const ItemsScreen()),
      child: Image.asset('assets/images/category/categ3.png'),
    ),
  ),
  CategoryItem(
    title: 'السيارات والدراجات',
    icon: Icons.directions_bike_outlined,
    content: InkWell(
      onTap: () => Get.to(() => const ItemsScreen()),
      child: Image.asset('assets/images/category/categ2.png'),
    ),
  ),
  CategoryItem(
    title: 'الألعاب والهوايات',
    icon: Icons.sports_esports_outlined,
    content: DummyLabels(),
  ),
  CategoryItem(
    title: 'الأجهزة الكهربائية',
    icon: Icons.electric_bolt_outlined,
    content: Text('الأجهزة الكهربائية'),
  ),
  CategoryItem(
    title: 'الأدوات المنزلية',
    icon: Icons.home_work_outlined,
    content: InkWell(
      onTap: () => Get.to(() => const ItemsScreen()),
      child: Image.asset('assets/images/category/categ3.png'),
    ),
  ),
  CategoryItem(
    title: 'الأدوات المكتبية',
    icon: Icons.work_outline_outlined,
    content: Text('الأدوات المكتبية'),
  ),
  CategoryItem(
    title: 'الأدوات الصحية',
    icon: Icons.health_and_safety_outlined,
    content: Text('الأدوات الصحية'),
  ),
  CategoryItem(
    title: 'الأدوات المائية',
    icon: Icons.water_drop_outlined,
    content: DummyLabels(),
  ),
  CategoryItem(
    title: 'الأدوات الطبية',
    icon: Icons.medical_services_outlined,
    content: Text('الأدوات الطبية'),
  ),
  CategoryItem(
    title: 'الأدوات الصناعية',
    icon: Icons.factory_outlined,
    content: DummyLabels(),
  ),
  CategoryItem(
    title: 'الأدوات الزراعية',
    icon: Icons.agriculture_outlined,
    content: InkWell(
      onTap: () => Get.to(() => const ItemsScreen()),
      child: Image.asset('assets/images/category/categ2.png'),
    ),
  ),
  CategoryItem(
    title: 'الأدوات المكتبية',
    icon: Icons.work_outline_outlined,
    content: Text('الأدوات المكتبية'),
  ),
];

class DummyLabels extends StatelessWidget {
  const DummyLabels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 13,
      children: [
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ1.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ2.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ3.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ4.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ5.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ1.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ2.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ3.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ4.png'),
        ),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset('assets/images/category/categ5.png'),
        ),
      ],
    );
  }
}
