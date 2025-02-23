import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/models/sections_model.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/screens/favorites/favorites_screen.dart';

final List<SectionGroup> sectionGroups = [
  SectionGroup(
    items: [
      SectionItem(
        title: 'Shukur Mahmood',
        subtitle: '07711178315',
        icon: Icons.person_outline,
      ),
    ],
  ),
  SectionGroup(
    items: [
      SectionItem(
        title: 'اللغة',
        subtitle: 'العربية',
        icon: Icons.language,
      ),
    ],
  ),
  SectionGroup(
    items: [
      SectionItem(
        title: 'المفضلات',
        icon: Icons.favorite,
        iconColor: ColorsManager.primary,
        onTap: () {
          Get.to(() => const FavoritesScreen());
        },
      ),
      SectionItem(
        title: 'الطلبيات',
        icon: Icons.add_box,
        iconColor: Colors.green,
      ),
      SectionItem(
          title: 'متجر النقاط',
          icon: Icons.shopping_cart,
          iconColor: Colors.amber),
    ],
  ),
  SectionGroup(
    items: [
      // بطاقات الهدايا
      SectionItem(
        title: 'بطاقات الهدايا',
        icon: Icons.card_giftcard_outlined,
      ),

      // الاشعارت
      SectionItem(
        title: 'الاشعارت',
        icon: Icons.notifications_none_outlined,
      ),
    ],
  ),
  SectionGroup(
    items: [
      // تواصل معنا
      SectionItem(
        title: 'تواصل معنا',
        icon: Icons.phone_outlined,
      ),
      // مركز المساعدة
      SectionItem(
        title: 'مركز المساعدة',
        icon: Icons.help_outline,
      ),
      // خدمات مسواگ
      SectionItem(
        title: 'خدمات مسواگ',
        icon: Icons.phone_outlined,
      ),
      // سياسة الخصوصية
      SectionItem(
        title: 'سياسة الخصوصية',
        icon: Icons.privacy_tip_outlined,
      ),
      // عن شركة مسواگ
      SectionItem(
        title: 'عن شركة مسواگ',
        icon: Icons.info_outline,
      ),
    ],
  ),
  SectionGroup(
    items: [
      // خدمة التوصيل
      SectionItem(
        title: 'خدمة التوصيل',
        icon: Icons.local_shipping_outlined,
      ),
    ],
  ),
  SectionGroup(
    items: [
      // مشاركة التطبيق,
      SectionItem(
        title: 'مشاركة التطبيق',
        icon: Icons.share_outlined,
      )
    ],
  ),
  SectionGroup(
    items: [
      // ايقونة التطبيق
      SectionItem(
        title: 'ايقونة التطبيق',
        icon: Icons.app_registration_outlined,
      ),
    ],
  ),
];
