import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/widgets/app_bars.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen>
    with TickerProviderStateMixin {
// ! BUILD HERE ==--=-============================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(),
      body: Container(
        color: ColorsManager.containerBackground,
        child: Column(
          children: [
            verticalSpace(10),
            Container(
              color: ColorsManager.white,
              child: Row(
                children: [
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
// ! END BUILD HERE ==--=-============================================
}
