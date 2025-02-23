import 'package:flutter/material.dart';
import 'package:miswag_clone/core/data/sections.dart';
import 'package:miswag_clone/core/models/sections_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsManager.containerBackground,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            ...sectionGroups.map((group) => _SectionWidget(group: group)),
            verticalSpace(10),
            Center(
              child: Text('Version 4.7.1 (Cloned by Shukur)',
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorsManager.gray,
                  )),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}

class _SectionWidget extends StatelessWidget {
  final SectionGroup group;

  const _SectionWidget({required this.group});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(12),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.lightGray,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                ...group.items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Column(
                    children: [
                      ListTile(
                        onTap: item.onTap,
                        leading: Icon(item.icon,
                            color: item.iconColor ?? ColorsManager.gray),
                        trailing: const Icon(Icons.chevron_right,
                            color: ColorsManager.gray),
                        title: Text(item.title),
                        subtitle:
                            item.subtitle != null ? Text(item.subtitle!) : null,
                        subtitleTextStyle: TextStyle(
                          color: ColorsManager.secondary,
                          fontSize: 12,
                        ),
                        tileColor: ColorsManager.white,
                        dense: true,
                      ),
                      if (index != group.items.length - 1)
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorsManager.lightGray,
                          indent: 16,
                          endIndent: 16,
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
        verticalSpace(20),
      ],
    );
  }


}
