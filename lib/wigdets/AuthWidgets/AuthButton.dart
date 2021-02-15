import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String btnText;
  final void Function() verify;
  const AuthButton({@required this.btnText, @required this.verify});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      height: 0.08.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.btnColor1,
          ],
        ),
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.transparent,
        onPressed: () {
          // Sign In User
          verify();
        },
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
    );
  }
}
