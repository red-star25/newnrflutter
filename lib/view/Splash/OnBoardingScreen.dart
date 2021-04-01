import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';

class OnBoardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    final _pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 30.0.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor),
      bodyTextStyle: bodyStyle,
      descriptionPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "Wide range of Products",
            image: SvgPicture.asset(
              "assets/images/ob_medicine.svg",
            ),
            decoration: _pageDecoration,
            bodyWidget: Text(
              "We, NR Life Care, are a trustworthy pharmaceutical company involved as an Exporter, Wholesaler and Trader of a wide range of medicinal products, Antibiotic Medicine, Analgesic and Antipyretic Medicines, Pharmaceutical Medicines, Pharmaceutical Products such as Vitamin etc.",
              style: AppTextDecoration.bodyText4.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PageViewModel(
            title: "Fast and Realiable Delivery",
            image: SvgPicture.asset(
              "assets/images/ob_delivery.svg",
            ),
            bodyWidget: Text(
              "Our skilled staff support us in satisfying our Client by supplying high grade medicinal Products. We make medicines easily available with Value for money to satisfy the demands of the Customers.",
              style: AppTextDecoration.bodyText4.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: _pageDecoration,
          ),
          PageViewModel(
            title: "Search Product Easily",
            image: SvgPicture.asset(
              "assets/images/ob_search.svg",
            ),
            bodyWidget: Text(
              "You can easily search for any product that you want to order. We have provided the best possible searching experience so that user can easily search for the profuct that they want.",
              style: AppTextDecoration.bodyText4.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: _pageDecoration,
          ),
          PageViewModel(
            title: "Flexible Payment Modes",
            image: SvgPicture.asset(
              "assets/images/ob_payment.svg",
            ),
            bodyWidget: Text(
              "We have flexible payment modes for hassle free financial transactions. We render prompt delivery of medicines to our clients. We make medicines easily available to satisfy the demands of the customers.",
              style: AppTextDecoration.bodyText4.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: _pageDecoration,
          ),
        ],
        onSkip: () => _onIntroEnd(),
        onDone: () => _onIntroEnd(),
        showSkipButton: true,
        showNextButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }

  void _onIntroEnd() async {
    await SharedPrefs.setOnBoard(onBoard: true);
    Get.offAllNamed("/login");
  }
}
