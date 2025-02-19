import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_bars.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<User>? selectedUserList = [];
// ! BUILD HERE ==--=-============================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(),
      body: Container(
        color: ColorsManager.containerBackground,
        child: Column(
          children: [
            verticalSpace(15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorsManager.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 230, 230, 230).withAlpha(100),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextButton(
                      backgroundColor: ColorsManager.white,
                      overlayColor: WidgetStatePropertyAll(
                        ColorsManager.lighterGray,
                      ),
                      textStyle: TextStyles.font14BlackBold,
                      buttonText: 'تصنيف',
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: ColorsManager.blackText,
                        size: 25,
                      ),
                      isWithIcon: true,
                      onPressed: () {
                        _openFilterDialog();
                      },
                    ),
                  ),
                  Expanded(
                    child: AppTextButton(
                      backgroundColor: ColorsManager.white,
                      overlayColor: WidgetStatePropertyAll(
                        ColorsManager.lighterGray,
                      ),
                      textStyle: TextStyles.font14BlackBold,
                      buttonText: 'ترتيب',
                      icon: Icon(
                        Icons.unfold_more,
                        color: ColorsManager.blackText,
                        size: 25,
                      ),
                      isWithIcon: true,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.window_outlined,
                          size: 20,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
// ! END BUILD HERE ==--=-============================================

  Future<void> _openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(
        context,
        choiceChipTheme: ChoiceChipThemeData.light(context),
      ),
      headlineText: 'Select Users',
      height: 600,
      listData: userList,
      selectedListData: selectedUserList,
      choiceChipLabel: (item) => item!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (user, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },

      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
      onCloseWidgetPress: () {
        // Do anything with the close button.
        //print("hello");
        Navigator.pop(context, null);
      },

      /// uncomment below code to create custom choice chip
      /* choiceChipBuilder: (context, item, isSelected) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
          )),
          child: Text(
            item.name,
            style: TextStyle(
                color: isSelected ? Colors.blue[300] : Colors.grey[500]),
          ),
        );
      }, */
    );
  }
}

class User {
  final String? name;
  final String? avatar;
  User({this.name, this.avatar});
}

List<User> userList = [
  User(name: "Abigail", avatar: "user.png"),
  User(name: "Audrey", avatar: "user.png"),
  User(name: "Ava", avatar: "user.png"),
  User(name: "Bella", avatar: "user.png"),
  User(name: "Bernadette", avatar: "user.png"),
  User(name: "Carol", avatar: "user.png"),
  User(name: "Claire", avatar: "user.png"),
  User(name: "Deirdre", avatar: "user.png"),
  User(name: "Donna", avatar: "user.png"),
  User(name: "Dorothy", avatar: "user.png"),
  User(name: "Faith", avatar: "user.png"),
  User(name: "Gabrielle", avatar: "user.png"),
  User(name: "Grace", avatar: "user.png"),
  User(name: "Hannah", avatar: "user.png"),
  User(name: "Heather", avatar: "user.png"),
  User(name: "Irene", avatar: "user.png"),
  User(name: "Jan", avatar: "user.png"),
  User(name: "Jane", avatar: "user.png"),
  User(name: "Julia", avatar: "user.png"),
  User(name: "Kyle", avatar: "user.png"),
  User(name: "Lauren", avatar: "user.png"),
  User(name: "Leah", avatar: "user.png"),
  User(name: "Lisa", avatar: "user.png"),
  User(name: "Melanie", avatar: "user.png"),
  User(name: "Natalie", avatar: "user.png"),
  User(name: "Olivia", avatar: "user.png"),
  User(name: "Penelope", avatar: "user.png"),
  User(name: "Rachel", avatar: "user.png"),
  User(name: "Ruth", avatar: "user.png"),
  User(name: "Sally", avatar: "user.png"),
  User(name: "Samantha", avatar: "user.png"),
  User(name: "Sarah", avatar: "user.png"),
  User(name: "Theresa", avatar: "user.png"),
  User(name: "Una", avatar: "user.png"),
  User(name: "Vanessa", avatar: "user.png"),
  User(name: "Victoria", avatar: "user.png"),
  User(name: "Wanda", avatar: "user.png"),
  User(name: "Wendy", avatar: "user.png"),
  User(name: "Yvonne", avatar: "user.png"),
  User(name: "Zoe", avatar: "user.png"),
];
