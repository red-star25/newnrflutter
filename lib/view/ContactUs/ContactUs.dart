import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/wigdets/GlobalWidgets/globalHeader.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUs extends StatelessWidget {
  final List<List> contactUsDetails = [
    ["visit_website", "www.nrlifecare.com", "assets/images/contactus_1.png"],
    ["email", "nrlifecare@gmail.com", "assets/images/contactus_2.png"],
    [
      "address",
      "44, Takshashila Habitat, Vastral, Odhav, S.P Ring Road, Ahmedabad, 382415",
      "assets/images/contactus_3.png"
    ],
  ];

  final List<List> contactUsSecondaryList = [
    [
      "nature_of_business",
      "wholesale_trader",
      "assets/images/contactus_bottom_1.png",
    ],
    [
      "employement",
      "total_employee",
      "assets/images/contactus_bottom_2.png",
    ],
    [
      "establishment",
      "year_of_est",
      "assets/images/contactus_bottom_3.png",
    ],
    [
      "annual_turnover",
      "total_turnover",
      "assets/images/contactus_bottom_4.png",
    ],
    [
      "gst",
      "gst_number",
      "assets/images/contactus_bottom_5.png",
    ],
    [
      "firm",
      "status_of_firm",
      "assets/images/contactus_bottom_6.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButton(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GlobalHeader(title: "contactus"),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 0.53.sh,
                width: 1.sw,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return index.isOdd
                          ? Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contactUsDetails[index][0].toString(),
                                        style: AppTextDecoration.bodyText4,
                                      ).tr(),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                              contactUsDetails[index][1]
                                                  .toString(),
                                              style:
                                                  AppTextDecoration.subtitle2)
                                          .tr(),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Image.asset(
                                      contactUsDetails[index][2].toString(),
                                      height: 120.h,
                                      width: 120.w,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Image.asset(
                                      contactUsDetails[index][2].toString(),
                                      height: 120.h,
                                      width: 120.w,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          contactUsDetails[index][0].toString(),
                                          style: AppTextDecoration.bodyText4,
                                        ).tr(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                                contactUsDetails[index][1]
                                                    .toString(),
                                                style:
                                                    AppTextDecoration.subtitle2)
                                            .tr(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 30.h,
                        ),
                    itemCount: contactUsDetails.length),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Flexible(
                    child: ResuableContactUsCard(
                        contactUsSecondaryList: contactUsSecondaryList,
                        index: 0),
                  ),
                  Flexible(
                    child: ResuableContactUsCard(
                        contactUsSecondaryList: contactUsSecondaryList,
                        index: 1),
                  ),
                  Flexible(
                    child: ResuableContactUsCard(
                        contactUsSecondaryList: contactUsSecondaryList,
                        index: 2),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: ResuableContactUsCard(
                        contactUsSecondaryList: contactUsSecondaryList,
                        index: 3),
                  ),
                  Flexible(
                    child: ResuableContactUsCard(
                        contactUsSecondaryList: contactUsSecondaryList,
                        index: 4),
                  ),
                  Flexible(
                    child: ResuableContactUsCard(
                        contactUsSecondaryList: contactUsSecondaryList,
                        index: 5),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResuableContactUsCard extends StatelessWidget {
  ResuableContactUsCard({
    Key key,
    @required this.contactUsSecondaryList,
    @required this.index,
  }) : super(key: key);

  final List<List> contactUsSecondaryList;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Image.asset(
              contactUsSecondaryList[index][2].toString(),
              height: 120.h,
              width: 120.w,
            ),
          ),
          Column(
            children: [
              Text(
                contactUsSecondaryList[index][0].toString(),
                style: AppTextDecoration.bodyText3,
                textAlign: TextAlign.center,
              ).tr(),
              SizedBox(
                height: 10.h,
              ),
              Text(contactUsSecondaryList[index][1].toString(),
                      style: AppTextDecoration.subtitle3)
                  .tr(),
            ],
          ),
        ],
      ),
    );
  }
}
