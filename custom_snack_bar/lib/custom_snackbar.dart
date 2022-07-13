import 'package:custom_snack_bar/styles.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required Widget content,
    super.key,
    super.action,
    super.padding = const EdgeInsets.all(0),
    super.behavior = SnackBarBehavior.floating,
    super.elevation = 0,
    super.backgroundColor = Colors.transparent,
    super.duration = const Duration(milliseconds: 4000),
    super.animation,
    super.dismissDirection = DismissDirection.horizontal,
    super.clipBehavior = Clip.hardEdge,
    super.margin,
    super.onVisible,
    super.width,
    Color? borderColor,
    double borderRadius = 16,
    double borderWidth = 2,
  }) : super(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              side: borderColor == null
                  ? BorderSide.none
                  : BorderSide(
                      color: borderColor,
                      width: borderWidth,
                    ),
            ),
            content: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              child: content,
            ));

  static CustomSnackBar primary(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style: TextStyle(
                  color: Styles.primaryText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.primaryText,
      );

  static CustomSnackBar secondary(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style: TextStyle(
                  color: Styles.secondaryText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.secondaryText,
      );

  static CustomSnackBar success(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.success,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style: TextStyle(
                  color: Styles.successText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.successText,
      );

  static CustomSnackBar danger(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.danger,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style: TextStyle(
                  color: Styles.dangerText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.dangerText,
      );

  static CustomSnackBar warning(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.warning,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style: TextStyle(
                  color: Styles.warningText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.warningText,
      );

  static CustomSnackBar info(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.info,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style:
                  TextStyle(color: Styles.infoText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.infoText,
      );

  static CustomSnackBar light(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.light,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style:
                  TextStyle(color: Styles.lightText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.lightText,
      );

  static CustomSnackBar dark(String content) => CustomSnackBar(
        content: ColoredBox(
          color: Styles.dark,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              content,
              style:
                  TextStyle(color: Styles.lightText, fontSize: 16, height: 1.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        borderColor: Styles.darkText,
      );
}
