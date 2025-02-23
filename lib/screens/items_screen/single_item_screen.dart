import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/bottom_navbar/bottom_navbar_controller.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/controllers/favorite/favorite_controller.dart';
import 'package:miswag_clone/core/data/products.dart';
import 'package:miswag_clone/core/models/cart_item.dart';
import 'package:miswag_clone/core/models/product_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_bars.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/core/utils/widgets/show_modal_sheet.dart';
import 'package:miswag_clone/core/utils/widgets/start_chatting.dart';
import 'package:miswag_clone/core/utils/widgets/tiny_icon_button.dart';
import 'package:miswag_clone/core/utils/widgets/warrentary_showcase.dart';
import 'package:miswag_clone/screens/home/home_screen.dart';
import 'package:miswag_clone/screens/items_screen/items_screen.dart';
import 'package:miswag_clone/screens/items_screen/widgets/thumbnail_item_card.dart';

class SingleItemScreen extends StatefulWidget {
  final Product product;
  const SingleItemScreen({super.key, required this.product});

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  final CartController cartController = Get.find();
  final FavoriteController favoriteController = Get.find();
  final BottomNavController bottomNavController = Get.find();

  bool _isExpanded = false;
  bool _isTextOverflowing = false;

  // Add this in your initState to check text overflow
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: widget.product.description ?? '',
          style: TextStyles.font16BlackRegular,
        ),
        maxLines: 3,
        textDirection: TextDirection.rtl,
      );
      textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 30);
      setState(() {
        _isTextOverflowing = textPainter.didExceedMaxLines;
      });
    });
  }

  void favoritesHandler() {
    if (favoriteController.isProductInFavorites(widget.product)) {
      favoriteController.removeFromFavorites(widget.product);
    } else {
      favoriteController.addToFavorites(widget.product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        isSingleItem: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.product.imageUrl,
                  height: 400,
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Obx(
                    () => TinyIconButton(
                      containerSize: 43,
                      icon: Icon(
                        favoriteController.isProductInFavorites(widget.product)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 30,
                        color: favoriteController
                                .isProductInFavorites(widget.product)
                            ? ColorsManager.primary
                            : null,
                      ),
                      onPressed: () {
                        favoritesHandler();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.product.brand!,
                    style: TextStyles.font18BlackRegular,
                  ),
                  Text(
                    widget.product.name,
                    style:
                        TextStyles.font16PrimaryTextBold.copyWith(height: 1.7),
                  ),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                  Text(
                    '${thousandFormatter(widget.product.price)} د.ع',
                    style: TextStyles.font25PrimaryTextBold,
                  ),
                  if (widget.product.oldPrice! > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${thousandFormatter(widget.product.oldPrice)} د.ع',
                          style: TextStyles.font18BlackRegular.copyWith(
                            height: 2,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        DiscountLabel(
                          discountPercentage: 10,
                          fontSize: 18,
                          isMinimal: true,
                        )
                      ],
                    ),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('القياس - Size',
                          style: TextStyles.font16BlackMedium),
                      horizontalSpace(10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: ColorsManager.lightGray,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        child: Text(
                          'جهاز',
                          style: TextStyles.font13BlackMedium,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                  clickableTile(
                    title: 'تفاصيل ضمان المنتج',
                    onTap: () => showModal(WarrentaryShowcase()),
                    icon: Icons.verified_user_outlined,
                  ),
                  verticalSpace(10),
                  clickableTile(
                    title: 'تواصل معنا للاستفسارات',
                    onTap: () => showModal(StartChatting()),
                    icon: Icons.verified_user_outlined,
                  ),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                  quickLabels(),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.list),
                      horizontalSpace(10),
                      Text('الوصف - Highlight',
                          style: TextStyles.font16BlackMedium),
                    ],
                  ),
                  verticalSpace(10),
                  _buildExpandableText(
                    '${widget.product.description!} lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                  sellerDetails(),
                  Divider(
                    height: 60,
                    color: ColorsManager.lightGray,
                  ),
                ],
              ),
            ),
            horizontalListView(),
            verticalSpace(50),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(() {
            final existingItem = cartController.cartItems.firstWhereOrNull(
                (item) => item.product.id == widget.product.id);
            return existingItem != null
                ? Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: AppTextButton(
                          isOutlinedBtn: true,
                          backgroundColor: ColorsManager.secondary,
                          buttonText: 'اشتري الآن',
                          textStyle: TextStyle(
                            color: ColorsManager.secondary,
                            fontSize: 16,
                          ),
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorsManager.secondary,
                          ),
                          isWithIcon: true,
                          onPressed: () {
                            Get.to(() => HomeScreen());
                            bottomNavController.changeIndexWithArgs(2);
                          },
                        ),
                      ),
                      horizontalSpace(15),
                      Flexible(child: quantityControls(existingItem)),
                    ],
                  )
                : AppTextButton(
                    buttonText: 'اضافة للسلة',
                    backgroundColor: ColorsManager.secondary,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorsManager.white,
                    ),
                    isWithIcon: true,
                    onPressed: () {
                      cartController.addToCart(widget.product, 1);
                    },
                  );
          }),
        ),
      ),
    );
  }

  Widget horizontalListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'منتجات من نفس القسم',
                style: TextStyles.font16BlackBold,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => ItemsScreen());
                },
                child: Text(
                  'مشاهدة المزيد',
                  style: TextStyles.font16GrayRegular.copyWith(
                    color: ColorsManager.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => horizontalSpace(10),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 160,
                child: ThumbnailItemCard(
                  product: products[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container sellerDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.gray.withAlpha(40),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(0, 1),
            ),
          ]),
      child: ListTile(
        dense: true,
        title: Text('تفاصيل التاجر - Seller Details',
            style: TextStyles.font16BlackMedium),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.product.brand!,
                      style: TextStyles.font16BlackBold,
                    ),
                    horizontalSpace(10),
                    Icon(
                      Icons.verified_outlined,
                      size: 20,
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                ),
              ],
            ),
            verticalSpace(15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.lightGray,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_outline,
                          size: 18,
                        ),
                        horizontalSpace(5),
                        Flexible(child: Text('4.5'))
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(
                          Icons.production_quantity_limits,
                          size: 15,
                        ),
                        horizontalSpace(5),
                        Flexible(
                          child: Text(
                            '94 منتجات',
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(
                          Icons.tag_rounded,
                          size: 18,
                        ),
                        horizontalSpace(5),
                        Flexible(
                            child: Text(
                          '1 ماركات',
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container quickLabels() {
    return Container(
      color: ColorsManager.lightGray,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_shipping_outlined,
                  size: 30,
                ),
                verticalSpace(5),
                Text('توصيل سريع', style: TextStyles.font14BlackBold),
              ],
            ),
          ),
          VerticalDivider(
            color: ColorsManager.gray.withAlpha(50),
            thickness: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: 30,
                ),
                verticalSpace(5),
                Text('داخل الضمان', style: TextStyles.font14BlackBold),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clickableTile({
    required String title,
    required IconData icon,
    required void Function() onTap,
  }) {
    return Container(
      // height: 30,
      decoration: BoxDecoration(
        color: ColorsManager.gray.withAlpha(40),
        borderRadius: BorderRadius.circular(50),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          dense: true,
          leading: Icon(
            icon,
            size: 18,
            color: Colors.black,
          ),
          title: Text(title),
          titleTextStyle: TextStyles.font16BlackBold.copyWith(
              fontFamily: 'Vazirmatn', color: ColorsManager.blackText),
          trailing: Icon(Icons.chevron_right,
              color: ColorsManager.blackText, size: 18),
          // tileColor: Colors.white,
          onTap: onTap,
        ),
      ),
    );
  }

  Container quantityControls(CartItem existingItem) {
    return Container(
      height: 52,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorsManager.lightGray,
          )
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withAlpha(20),
          //     blurRadius: 10,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: existingItem.quantity == 1
                  ? const Icon(
                      Icons.delete_outline,
                      size: 20,
                    )
                  : Text(
                      '-',
                      style: TextStyles.font24BlackRegular,
                    ),
              onPressed: () {
                cartController.decreaseQuantity(widget.product);
              },
            ),
          ),
          horizontalSpace(5),
          Text(
            '${existingItem.quantity}',
            style: TextStyles.font16BlackBold.copyWith(height: 0),
          ),
          horizontalSpace(5),
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Text(
                '+',
                style: TextStyles.font24BlackRegular,
              ),
              onPressed: () {
                cartController.addToCart(widget.product, 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableText(String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(
          text: text,
          style: TextStyles.font16BlackRegular,
        );

        // Calculate text layout for overflow detection
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: 6,
          textDirection: TextDirection.rtl,
        )..layout(maxWidth: constraints.maxWidth);

        _isTextOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                IntrinsicHeight(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: ConstrainedBox(
                      constraints: _isExpanded
                          ? const BoxConstraints()
                          : BoxConstraints(maxHeight: textPainter.height * 3),
                      child: Text(
                        text,
                        style: TextStyles.font16BlackRegular,
                        maxLines: _isExpanded ? null : 6,
                        overflow: _isExpanded ? null : TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
                if (!_isExpanded && _isTextOverflowing)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            ColorsManager.containerBackground.withAlpha(20),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (_isTextOverflowing)
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isExpanded ? 'عرض أقل' : 'عرض المزيد',
                        style: TextStyles.font14BlackBold.copyWith(
                          color: ColorsManager.secondary,
                        ),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: ColorsManager.secondary,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
