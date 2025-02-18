import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';

class ShimmerTitlePlaceholder extends StatelessWidget {
  final double? width;

  const ShimmerTitlePlaceholder({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: Colors.white,
      baseColor: ColorsManager.gray.withOpacity(0.25),
      highlightColor:
          const Color.fromARGB(255, 205, 205, 205).withOpacity(0.75),
      child: Container(
          width: width ?? Get.width * 0.35,
          height: 15.0,
          // border radius
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: Colors.white.withOpacity(0.75),
          )),
    );
  }
}

class ShimmerBannerPlaceholder extends StatelessWidget {
  final double? height;
  const ShimmerBannerPlaceholder({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.gray.withOpacity(0.25),
      highlightColor:
          const Color.fromARGB(255, 205, 205, 205).withOpacity(0.75),
      child: Container(
        width: double.infinity,
        height: height ?? 80.0,
        // border radius
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

class ShimmerGridView extends StatelessWidget {
  const ShimmerGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        // childAspectRatio: 0.9,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 50,
      itemBuilder: (context, index) {
        return const ShimmerBannerPlaceholder();
      },
    );
  }
}

class ShimmerCirclePlaceholder extends StatelessWidget {
  const ShimmerCirclePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.gray.withOpacity(0.25),
      highlightColor:
          const Color.fromARGB(255, 205, 205, 205).withOpacity(0.75),
      child: Container(
        width: 40,
        height: 40.0,

        // border radius
        decoration: ShapeDecoration(
          shape: const OvalBorder(),
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

//
//
//  ****************************************************************************
//
//
//

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    super.key,
    required this.lineType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyShimmerInit extends StatelessWidget {
  const MyShimmerInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        period: const Duration(milliseconds: 1000),
        direction: ShimmerDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ShimmerBannerPlaceholder(),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (1 / .65),
                  ),
                  children: const [
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                    ShimmerBannerPlaceholder(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class MyShimmerInput extends StatelessWidget {
  const MyShimmerInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      period: const Duration(milliseconds: 1000),
      direction: ShimmerDirection.rtl,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: Colors.white.withOpacity(0.5),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class MyShimmerEditForm extends StatelessWidget {
  final bool isBillCard;
  const MyShimmerEditForm({
    super.key,
    this.isBillCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ListView.separated(
            // itemCount: widget.orders.length,
            padding: EdgeInsets.zero,
            itemCount: 10,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemBuilder: (context, index2) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                period: const Duration(milliseconds: 1000),
                direction: ShimmerDirection.rtl,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
