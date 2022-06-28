import 'package:cat_management/utils/app_theme_data.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants.dart';

class MyShimmerEffectUI extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const MyShimmerEffectUI.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const MyShimmerEffectUI.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey,
        period: const Duration(seconds: 3),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey,
            shape: shapeBorder,
          ),
        ),
      );
}

class LoadingCatLine extends StatelessWidget {
  LoadingCatLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: const MyShimmerEffectUI.rectangular(
            width: 100,
            height: 100,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.vertical,
            spacing: 4,
            children: const [
              MyShimmerEffectUI.rectangular(
                height: 18,
                width: Constants.secondBlockWidth,
              ),
              MyShimmerEffectUI.rectangular(
                height: 20,
                width: Constants.secondBlockWidth,
              ),
              MyShimmerEffectUI.rectangular(
                height: 50,
                width: Constants.secondBlockWidth,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LoadingCatWidget extends StatelessWidget {
  const LoadingCatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return LoadingCatLine();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class NetErrorWidget extends StatelessWidget {
  const NetErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            'Sorry, we have some problems loading these cats 😿',
            style: AppThemeData.lineStyle,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class NetworkCallWidget extends StatelessWidget {
  Widget child;
  NetworkCallWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Connectivity().checkConnectivity(),
      builder: (_, result) {
        if (result.connectionState == ConnectionState.done) {
          if ((result.data == ConnectivityResult.wifi) ||
              (result.data == ConnectivityResult.mobile)) {
            return child;
          } else {
            return const NetErrorWidget();
          }
        } else {
          return const LoadingCatWidget();
        }
      },
    );
  }
}
