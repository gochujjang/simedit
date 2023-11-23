import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blueColor = const Color(0xff3547AC);
Color darkBlueColor = const Color(0xff1F2963);
Color subtleBlueColor = const Color(0xffCCDAFC);
Color greenColor = const Color(0xff22B07D);
Color redColor = const Color(0xffFB4141);
Color subtleRedColor = const Color(0xffE28173);
Color blackColor = const Color(0xff404040);
Color greyColor = const Color(0xffC7C9D9);
Color darkGreyColor = const Color(0xffA3A3A3);
Color lightGreyColor = const Color(0xffEDEFF9);
Color bgColor = const Color(0xffF6F9FF);
Color whiteColor = const Color(0xffFFFFFF);

// textstyle
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);
TextStyle darkGreyTextStyle = GoogleFonts.poppins(
  color: darkGreyColor,
);
TextStyle darkBlueTextStyle = GoogleFonts.poppins(
  color: darkBlueColor,
);
TextStyle blueTextStyle = GoogleFonts.poppins(
  color: blueColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: bgColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: redColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w700;
FontWeight bold = FontWeight.w800;
FontWeight extraBold = FontWeight.w900;

BoxShadow themeShadow = BoxShadow(
  color: darkGreyColor.withOpacity(0.2),
  blurRadius: 10.0,
  spreadRadius: 0,
);
