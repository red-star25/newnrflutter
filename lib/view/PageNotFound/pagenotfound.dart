import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Page not found ❌",
          style: AppTextDecoration.bodyText2,
        ),
      ),
    );
  }
}
