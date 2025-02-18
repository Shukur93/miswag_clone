import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class DrawerNavItem extends StatelessWidget {
  final String navTitle;
  final Widget navIcon;
  final void Function() onTap;
  final bool isEnabled;
  const DrawerNavItem({
    super.key,
    required this.navTitle,
    required this.navIcon,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.35,
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            // color: Colors.amber,
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35,
                  height: 21,
                  child: navIcon,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    navTitle,
                    style: TextStyles.font15BlackRegular.copyWith(height: 1.25),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
