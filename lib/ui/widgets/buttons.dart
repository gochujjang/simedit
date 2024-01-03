import 'package:flutter/material.dart';
import 'package:SiMedit/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          title,
          style: font_semiBold.copyWith(
            fontSize: 16,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  final String title;
  final Icon? iconUrl;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const PrimaryIconButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.iconUrl,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_add.png',
              width: 24, // Adjust the width as needed
              height: 24, // Adjust the height as needed
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: font_semiBold.copyWith(
                fontSize: 16,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomTextButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: font_regular.copyWith(
            color: blackColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
