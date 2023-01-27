import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

// ignore: must_be_immutable
class InviteItemWidget extends StatelessWidget {
  Contact contact;
  InviteItemWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 15,
        top: 9,
        right: 15,
        bottom: 9,
      ),
      decoration: BoxDecoration(
        color: ColorConstant.gray900,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray500,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getSize(
              30.00,
            ),
            margin: getMargin(
              top: 5,
              bottom: 5,
            ),
            padding: getPadding(
              left: 12,
              top: 5,
              right: 12,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.red400,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  15.00,
                ),
              ),
            ),
            child: Text(
              contact.displayName[0].toUpperCase(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorConstant.whiteA700,
                fontSize: getFontSize(
                  18,
                ),
                fontFamily: 'Flamenco',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 19,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contact.displayName,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.whiteA700,
                    fontSize: getFontSize(
                      18,
                    ),
                    fontFamily: 'Flamenco',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 7,
                  ),
                  child: Text(
                    contact.phones[0].number,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.whiteA700,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Flamenco',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomIconButton(
            height: 20,
            width: 20,
            margin: getMargin(
              top: 10,
              bottom: 10,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgArrowleft,
            ),
          ),
        ],
      ),
    );
  }
}
