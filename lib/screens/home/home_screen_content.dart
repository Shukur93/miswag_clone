import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/widgets/search_bar_engine.dart';
import 'package:miswag_clone/core/utils/widgets/shimmer_placeholders.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  // final connectivityController = Get.put(ConnectivityController());

  // search controller
  final TextEditingController searchController = TextEditingController();

  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // Map<String, dynamic> _deviceData = <String, dynamic>{};
  // String deviceId = '';
  // var _androidIdPlugin = AndroidId();

  @override
  void initState() {
    super.initState();
  }

  // Future<void> initPlatformState() async {
  //   var deviceData = <String, dynamic>{};

  //   try {
  //     if (Platform.isAndroid) {
  //       final AndroidDeviceInfo androidInfo =
  //           await deviceInfoPlugin.androidInfo;
  //       // deviceData = _readAndroidBuildData(androidInfo);
  //       deviceId = await _getAndroidDeviceId(androidInfo);
  //     } else if (Platform.isIOS) {
  //       final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
  //       // deviceData = _readIosDeviceInfo(iosInfo);
  //       deviceId = _getIosDeviceId(iosInfo);
  //     }
  //   } on PlatformException {
  //     deviceData = <String, dynamic>{
  //       'Error:': 'Failed to get platform version.'
  //     };
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _deviceData = deviceData;
  //   });
  // }

  // Future<String> _getAndroidDeviceId(AndroidDeviceInfo build) async {
  //   // return build.id;
  //   return await _androidIdPlugin.getId() ?? '';
  // }

  // String _getIosDeviceId(IosDeviceInfo data) {
  //   return data.identifierForVendor ?? '';
  // }

  @override
  Widget build(BuildContext context) {
    // print('===================== ');
    // print('deviceId: $deviceId');
    // print('===================== ');
    return RefreshIndicator(
      onRefresh: () async => (),
      color: ColorsManager.primary,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(top: 5, bottom: 5),
          color: Color(0xFFF3F3F5),
          child: Column(
            spacing: 15,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset('assets/images/qi-banner.png'),
                //  grid view
              ),
              SizedBox(
                height: 200,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.7,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  children: [
                    Image.asset('assets/images/a1.png'),
                    Image.asset('assets/images/a2.png'),
                    Image.asset('assets/images/a3.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView onLoadingListView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 30, left: 30),
      separatorBuilder: (context, index) => horizontalSpace(15),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const SizedBox(width: 150, child: ShimmerBannerPlaceholder());
      },
    );
  }

  GridView onLoadingGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 3,
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1 / 0.7,
      ),
      padding: const EdgeInsets.only(right: 30, left: 30),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ShimmerBannerPlaceholder();
      },
    );
  }
}
