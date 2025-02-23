import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/data/products.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_bars.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/core/utils/widgets/show_modal_sheet.dart';
import 'package:miswag_clone/screens/items_screen/widgets/list_item_card.dart';
import 'package:miswag_clone/screens/items_screen/widgets/thumbnail_item_card.dart';

enum SortOption {
  defaultOption,
  priceLowToHigh,
  priceHighToLow,
  newest,
  oldest,
}

enum ViewMode { grid, list }

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  SortOption? _selectedSort;

  ViewMode _viewMode = ViewMode.grid; // Add view mode state
  final CartController cartController = Get.put(CartController());

  void _toggleViewMode() {
    setState(() {
      _viewMode = _viewMode == ViewMode.grid ? ViewMode.list : ViewMode.grid;
    });
  }

  void _openSortModal() {
    showModal(
      SortOptionsModal(
        currentSelection: _selectedSort,
        onSelectionChanged: (option) {
          setState(() => _selectedSort = option);
        },
      ),
    );
  }

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
                    color:
                        const Color.fromARGB(255, 230, 230, 230).withAlpha(100),
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
                        showModal(
                          FilterationModalContent(),
                        );
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
                      onPressed: () {
                        _openSortModal();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: _toggleViewMode,
                      icon: Icon(
                        _viewMode == ViewMode.grid
                            ? Icons.list // Show list icon when in grid view
                            : Icons
                                .window_outlined, // Show grid icon when in list view
                        size: 20,
                        color: ColorsManager.blackText,
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(15),
            Expanded(
                child: _viewMode == ViewMode.grid
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.65,
                        ),
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.only(right: 10, left: 10, bottom: 50),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ThumbnailItemCard(
                            product: products[index],
                          );
                        },
                      )
                    : ListView.builder(
                        padding:
                            EdgeInsets.only(right: 10, left: 10, bottom: 50),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ListItemCard(
                            product: products[index],
                          );
                        },
                      )),
          ],
        ),
      ),
    );
  }
// ! END BUILD HERE ==--=-============================================
}

// ? ================= FILTERATION MODAL CONTENT
class FilterationModalContent extends StatefulWidget {
  const FilterationModalContent({
    super.key,
  });

  @override
  State<FilterationModalContent> createState() =>
      _FilterationModalContentState();
}

class _FilterationModalContentState extends State<FilterationModalContent> {
  RangeValues _currentRangeValues = const RangeValues(12000, 3850000);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.8,
      alignment: Alignment.topCenter,
      color: ColorsManager.white,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      horizontalSpace(10),
                      Text(
                        'تصفية نتائج البحث',
                        style: TextStyles.font16BlackBold,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 37,
                        width: 37,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: ColorsManager.lightGray,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // verticalSpace(15),
                // rest of the content
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      color: ColorsManager.containerBackground,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الاصناف',
                            style: TextStyles.font16BlackBold,
                          ),
                          verticalSpace(15),
                          MyMultiSelection(
                            items: [
                              MultiSelectCard(
                                  value: 'سماعات لاسلكية',
                                  label: 'سماعات لاسلكية'),
                              MultiSelectCard(
                                  value: 'كومبيوتر لوحي',
                                  label: 'كومبيوتر لوحي'),
                              MultiSelectCard(
                                  value: 'أجهزة الكترونية',
                                  label: 'أجهزة الكترونية'),
                              MultiSelectCard(
                                  value: 'أجهزة منزلية', label: 'أجهزة منزلية'),
                              MultiSelectCard(value: "غسالات", label: "غسالات"),
                            ],
                          ),
                          verticalSpace(25),
                          Text(
                            'الاحجام',
                            style: TextStyles.font16BlackBold,
                          ),
                          verticalSpace(15),
                          MyMultiSelection(
                            items: [
                              MultiSelectCard(value: "حجم1", label: "حجم1"),
                              MultiSelectCard(value: "حجم2", label: "حجم2"),
                              MultiSelectCard(value: "حجم3", label: "حجم3"),
                            ],
                          ),
                          // color picker
                          verticalSpace(25),
                          Text(
                            'الالوان',
                            style: TextStyles.font16BlackBold,
                          ),
                          verticalSpace(15),
                          colorItems(),
                          // Price Range
                          verticalSpace(25),
                          Text(
                            'السعر',
                            style: TextStyles.font16BlackBold,
                          ),
                          verticalSpace(15),
                          Center(
                            child: Text(
                              '${thousandFormatter(_currentRangeValues.start)} د.ع - ${thousandFormatter(_currentRangeValues.end)} د.ع',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalSpace(20),
                          RangeSlider(
                            values: _currentRangeValues,
                            max: 5000000,
                            divisions: 10,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            activeColor: ColorsManager.secondary,
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: AppTextButton(
                    buttonText: 'اغلاق',
                    isOutlinedBtn: true,
                    backgroundColor: ColorsManager.secondary,
                    textStyle: TextStyles.font16BlackBold
                        .copyWith(color: ColorsManager.secondary),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AppTextButton(
                    buttonText: 'عرض النتائج',
                    backgroundColor: ColorsManager.secondary,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MyMultiSelection colorItems() {
    return MyMultiSelection(
      items: [
        MultiSelectCard(
          value: 'purple',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.purple,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'red',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.red,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'green',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.green,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'blue',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.blue,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'yellow',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.yellow,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'orange',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.orange,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'pink',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.pink,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'brown',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.brown,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.brown,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'grey',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.grey,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        MultiSelectCard(
          value: 'black',
          label: '',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(width: 2)),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
      ],
    );
  }
}

class MyMultiSelection extends StatelessWidget {
  final List<MultiSelectCard<String>> items;
  const MyMultiSelection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
      textStyles: MultiSelectTextStyles(
        textStyle: TextStyle(
          fontFamily: 'Vazirmatn',
          fontWeight: FontWeight.bold,
        ),
        selectedTextStyle: TextStyle(
          fontFamily: 'Vazirmatn',
          fontWeight: FontWeight.bold,
          color: ColorsManager.blackText,
        ),
      ),
      itemsDecoration: MultiSelectDecorations(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(10),
        ),
        selectedDecoration: BoxDecoration(
          color: ColorsManager.unselectedTabGray,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorsManager.blackText, width: 2),
        ),
      ),
      animations: MultiSelectAnimations(
        decorationAimationDuration: Duration(milliseconds: 100),
        labelAimationDuration: Duration(milliseconds: 100),
      ),
      items: items,
      onChange: (allSelectedItems, selectedItem) {},
    );
  }
}

class SortOptionsModal extends StatefulWidget {
  final SortOption? currentSelection;
  final Function(SortOption) onSelectionChanged;

  const SortOptionsModal({
    super.key,
    required this.currentSelection,
    required this.onSelectionChanged,
  });

  @override
  State<SortOptionsModal> createState() => _SortOptionsModalState();
}

class _SortOptionsModalState extends State<SortOptionsModal> {
  late SortOption? _selected;

  @override
  void initState() {
    super.initState();
    // Set default selection to SortOption.defaultOption if null
    _selected = widget.currentSelection ?? SortOption.defaultOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40), // For balance
                Text(
                  'ترتيب',
                  style: TextStyles.font16BlackBold,
                ),
                Container(
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    color: ColorsManager.lightGray,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, size: 20),
                  ),
                ),
              ],
            ),
          ),

          // Options List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: SortOption.values
                  .map((option) => _buildCustomRadio(option))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomRadio(SortOption option) {
    bool isSelected = _selected == option;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.secondary.withAlpha(25) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          _getOptionText(option),
          style: TextStyles.font14BlackBold.copyWith(
            color:
                isSelected ? ColorsManager.secondary : ColorsManager.blackText,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                // ? const Color.fromARGB(255, 214, 226, 234)
                ? ColorsManager.secondary.withAlpha(20)
                : Colors.transparent,
          ),
          padding: EdgeInsets.all(3),
          child: Icon(
            isSelected ? Icons.check : Icons.circle_outlined,
            size: 18,
            color: isSelected ? ColorsManager.secondary : Colors.transparent,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {
          setState(() => _selected = option);
          widget.onSelectionChanged(option);
          Get.back();
        },
      ),
    );
  }

  String _getOptionText(SortOption option) {
    switch (option) {
      case SortOption.defaultOption:
        return "الترتيب الافتراضي";
      case SortOption.priceLowToHigh:
        return "الترتيب تنازلي حسب السعر";
      case SortOption.priceHighToLow:
        return "الترتيب تصاعدي حسب السعر";
      case SortOption.newest:
        return "الترتيب حسب الاحدث";
      case SortOption.oldest:
        return "الترتيب حسب الاقدم";
    }
  }
}
