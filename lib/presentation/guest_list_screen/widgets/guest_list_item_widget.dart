import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GuestListItemWidget extends StatelessWidget {

  final Contact contacts;
  GuestListItemWidget(this.contacts);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<ContactProvider>().updateList(contacts);
      },
      child: Container(
        padding: getPadding(
          left: 15,
          top: 9,
          right: 15,
          bottom: 9,
        ),
        decoration: BoxDecoration(
          color: ColorConstant.black900,
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                    left: 8,
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
                    contacts.displayName[0].toUpperCase(),
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
                    right: 152,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contacts.displayName,
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
                         contacts.phones[0].number,
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
              ],
            ),
            context.watch<ContactProvider>().myList.contains(contacts)?
            Expanded(
              child: CustomIconButton(
                height: 20,
                width: 20,

                child: CustomImageView(
                  svgPath: ImageConstant.imgCheckmark,
color: Colors.white,                ),
              ),
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}
