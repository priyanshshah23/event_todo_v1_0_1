import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/widgets/app_bar/custom_app_bar.dart';
import 'package:event_todo/widgets/custom_button.dart';
import 'package:event_todo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'details_provider.dart';

class DetailsScreen extends StatelessWidget {
  Widget builder(
    BuildContext context,
  ) {
    return ChangeNotifierProvider<DetailsProvider>(
      create: (context) => DetailsProvider(context),
      child: DetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DetailsProvider>(
        context); //context.watch<ContactProvider>().myList;
    // return Consumer<DetailsProvider>(builder: (context, provider, child)
    // {
    return provider.doc != null
        ? Scaffold(
            backgroundColor: ColorConstant.red400,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(63.00),
                leadingWidth: 56,
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    provider.myTodoList.clear();
                  },
                  child: CustomImageView(
                      svgPath: ImageConstant.imgArrowleft,
                      height: getSize(36.00),
                      width: getSize(36.00),
                      margin: getMargin(left: 20, bottom: 27)),
                ),
                centerTitle: true,
                title: Text(provider.doc!["dateTime"],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        fontSize: getFontSize(48),
                        fontFamily: 'Flamenco',
                        fontWeight: FontWeight.w400))),
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,
                        child: Padding(
                            padding: getPadding(top: 19),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "at",
                                      style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(18),
                                          fontFamily: 'Flamenco',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(12),
                                          fontFamily: 'Flamenco',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: provider.doc!["TimeOfDay"],
                                      style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(32),
                                          fontFamily: 'Flamenco',
                                          fontWeight: FontWeight.w400))
                                ]),
                                textAlign: TextAlign.left)),
                      ),
                      Expanded(flex: 9,
                        child: Container(
                            width: size.width,
                            margin: getMargin(top: 48),
                            padding: getPadding(
                                left: 38, top: 40, right: 38, bottom: 40),
                            decoration: BoxDecoration(
                                color: ColorConstant.black900,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        getHorizontalSize(30.00)),
                                    topRight: Radius.circular(
                                        getHorizontalSize(30.00)))),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: getPadding(left: 2, top: 1),
                                      child: Text(provider.doc!["tile"],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: ColorConstant.whiteA700,
                                              fontSize: getFontSize(32),
                                              fontFamily: 'Flamenco',
                                              fontWeight: FontWeight.w400))),
                                  Padding(
                                      padding: getPadding(left: 2, top: 9),
                                      child: Text(provider.doc!["description"],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: ColorConstant.whiteA700,
                                              fontSize: getFontSize(20),
                                              fontFamily: 'Flamenco',
                                              fontWeight: FontWeight.w300))),
                                  Padding(
                                      padding: getPadding(left: 0, top: 19),
                                      child: Row(children: [
                                        for (int i = 0;
                                            i < provider.doc!["invite"].length;
                                            i++)
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Container(
                                                width: getSize(30.00),
                                                padding: getPadding(
                                                    left: 8,
                                                    top: 5,
                                                    right: 12,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant.red400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00))),
                                                child: Text(
                                                    provider.doc!["invite"][i]
                                                        ["name"][0],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        fontSize:
                                                            getFontSize(18),
                                                        fontFamily: 'Flamenco',
                                                        fontWeight:
                                                            FontWeight.w400))),
                                          ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GuestListScreen()
                                                          .builder(context)),
                                            );
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Container(
                                                width: getSize(30.00),
                                                padding: getPadding(
                                                    left: 11,
                                                    top: 5,
                                                    right: 12,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                15.00))),
                                                child: Text("+",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .black900,
                                                        fontSize:
                                                            getFontSize(18),
                                                        fontFamily: 'Flamenco',
                                                        fontWeight:
                                                            FontWeight.w400))),
                                          ),
                                        ),
                                      ])),
                                  Padding(
                                      padding: getPadding(
                                          left: 2, top: 30, right: 22),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 2),
                                                child: Text("TO DOs",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        fontSize:
                                                            getFontSize(20),
                                                        fontFamily: 'Flamenco',
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            Spacer(),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCheckmark,
                                                height: getSize(24.00),
                                                width: getSize(24.00)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 5, top: 2, bottom: 3),
                                                child: Text(
                                                    provider.myTodoList
                                                            .where((element) =>
                                                                element.values
                                                                    .contains(
                                                                        false))
                                                            .length
                                                            .toString() +
                                                        "/" +
                                                        provider
                                                            .myTodoList.length
                                                            .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        fontSize:
                                                            getFontSize(18),
                                                        fontFamily: 'Flamenco',
                                                        fontWeight:
                                                            FontWeight.w400)))
                                          ])),
                                  if (provider.doc!.data().containsKey("todo"))
                                    // ListView.builder(itemCount: provider.doc!["todo"].length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,i) {
                                    //   return Padding(
                                    //     padding: EdgeInsets.only(top: 10.0),
                                    //     child: Row(
                                    //       children: [
                                    //         Padding(
                                    //           padding: EdgeInsets.only(right: 10.0),
                                    //           child: GestureDetector(onTap: () {
                                    //             if (provider.doc!["todo"][i]["listStatus"]) {
                                    //               provider.updateKeyValue(
                                    //                   provider.doc!["todo"][i], false);
                                    //             } else {
                                    //               provider.updateKeyValue(
                                    //                   provider.doc!["todo"][i], true);
                                    //             }
                                    //           },
                                    //             child: CustomImageView(
                                    //                 svgPath: provider.doc!["todo"][i]["listStatus"]
                                    //                     ? ImageConstant
                                    //                     .imgComputer
                                    //                     : ImageConstant
                                    //                     .imgCheckmarkWhiteA700),
                                    //           ),
                                    //         ),
                                    //         Text(provider.doc!["todo"][i]["listEvent"]
                                    //             .toString(),
                                    //           style: TextStyle(color: Colors.white),)
                                    //
                                    //       ],
                                    //     ),
                                    //   );
                                    // }
                                    // ),
                                    FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection("todo_list")
                                            .doc(Constants.databaseID)
                                            .get(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasData || snapshot.data.exists) {
                                            return ListView.builder(
                                                itemCount: snapshot
                                                    .data["todo"].length,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right:
                                                                      10.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              if (snapshot.data[
                                                                      "todo"][i]
                                                                  [
                                                                  "listStatus"]) {
                                                                provider.updateKeyValue(
                                                                    snapshot.data![
                                                                        "todo"][i],
                                                                    false,i);
                                                              } else {
                                                                provider.updateKeyValue(
                                                                    snapshot.data![
                                                                        "todo"][i],
                                                                    true,i);
                                                              }
                                                            },
                                                            child: CustomImageView(
                                                                svgPath: snapshot.data!["todo"]
                                                                            [
                                                                            i]
                                                                        [
                                                                        "listStatus"]
                                                                    ? ImageConstant
                                                                        .imgComputer
                                                                    : ImageConstant
                                                                        .imgCheckmarkWhiteA700),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!["todo"]
                                                                  [i][
                                                                  "listEvent"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                          }
                                          return Container();
                                        }),
                                  Spacer(),
                                  CustomButton(
                                      height: 50,
                                      width: 313,
                                      text: "Add To Do",
                                      margin: getMargin(left: 2),
                                      onTap: () => showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: Container(
                                                width: size.width,
                                                padding: getPadding(
                                                  all: 40,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CustomTextFormField(
                                                      width: 313,
                                                      focusNode: FocusNode(),
                                                      controller:
                                                          provider.controller,
                                                      hintText: "To Do",
                                                      shape: TextFormFieldShape
                                                          .CircleBorder25,
                                                      padding:
                                                          TextFormFieldPadding
                                                              .PaddingAll13,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        provider.onTapAddtodo(
                                                            context);
                                                      },
                                                      child: CustomButton(
                                                        height: 50,
                                                        width: 313,
                                                        text: "Add",
                                                        margin: getMargin(
                                                          top: 93,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            isScrollControlled: true,
                                          )),
                                ])),
                      )
                    ])),
          )
        : SizedBox.shrink();
  }
// }
}
