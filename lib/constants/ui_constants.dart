import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsConstants.twitterLogo,
      colorFilter: const ColorFilter.mode(
        Pallete.blueColor, 
        BlendMode.srcIn,
        ),
      height: 30,
      ),
      centerTitle: true,
    );
  }
}