import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/presentation/add_event_screen/add_event_screen.dart';
import 'package:event_todo/presentation/details_screen/details_screen.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(context),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.black900,
        bottomNavigationBar: CustomButton(
            height: 50,
            width: 313,
            text: "Plan Event",
            onTap: () => onTapPlanevent(context)),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: getPadding(top: 27),
                  child: Text("EventLy",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(48),
                          fontFamily: 'Freehand',
                          fontWeight: FontWeight.w400))),
              Expanded(
                child: Container(
                  width: size.width,
                  margin: getMargin(top: 49),
                  padding: getPadding(all: 40),
                  decoration: BoxDecoration(
                      color: ColorConstant.black900,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getHorizontalSize(30.00)),
                          topRight: Radius.circular(getHorizontalSize(30.00))),
                      boxShadow: [
                        BoxShadow(
                            color: ColorConstant.whiteA7007f,
                            spreadRadius: getHorizontalSize(2.00),
                            blurRadius: getHorizontalSize(2.00),
                            offset: Offset(0, -10))
                      ]),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("todo_list")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.docs.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              onTapColumn23nov(context,
                                                  snapshot.data?.docs[index]);
                                            },
                                            child: Container(
                                                width:
                                                    getHorizontalSize(313.00),
                                                padding: getPadding(all: 15),
                                                decoration: BoxDecoration(
                                                    color:
                                                        ColorConstant.black900,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                10.00)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: ColorConstant
                                                              .gray500,
                                                          spreadRadius:
                                                              getHorizontalSize(
                                                                  2.00),
                                                          blurRadius:
                                                              getHorizontalSize(
                                                                  2.00),
                                                          offset: Offset(0, 0))
                                                    ]),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              right: 5),
                                                          child: Row(children: [
                                                            CustomButton(
                                                                height: 40,
                                                                width: 97,
                                                                text: snapshot
                                                                            .data
                                                                            ?.docs[
                                                                        index][
                                                                    "dateTime"],
                                                                variant:
                                                                    ButtonVariant
                                                                        .FillRed400,
                                                                shape: ButtonShape
                                                                    .CircleBorder20,
                                                                padding:
                                                                    ButtonPadding
                                                                        .PaddingAll4,
                                                                fontStyle:
                                                                    ButtonFontStyle
                                                                        .FlamencoRegular26),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 5,
                                                                        top: 14,
                                                                        bottom:
                                                                            12),
                                                                child: RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "at",
                                                                              style: TextStyle(color: ColorConstant.whiteA700, fontSize: getFontSize(12), fontFamily: 'Flamenco', fontWeight: FontWeight.w400)),
                                                                          TextSpan(
                                                                              text: " ",
                                                                              style: TextStyle(color: ColorConstant.whiteA700, fontSize: getFontSize(12), fontFamily: 'Flamenco', fontWeight: FontWeight.w400)),
                                                                          TextSpan(
                                                                              text: snapshot.data?.docs[index]["TimeOfDay"],
                                                                              style: TextStyle(color: ColorConstant.whiteA700, fontSize: getFontSize(20), fontFamily: 'Flamenco', fontWeight: FontWeight.w400))
                                                                        ]),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left)),
                                                            Spacer(),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgCheckmark,
                                                                height: getSize(
                                                                    24.00),
                                                                width: getSize(
                                                                    24.00),
                                                                margin:
                                                                    getMargin(
                                                                        top: 8,
                                                                        bottom:
                                                                            8)),
                                                            Padding(
                                                                padding: getPadding(
                                                                    left: 5,
                                                                    top: 10,
                                                                    bottom: 11),
                                                                child: Text(
                                                                    "01/10",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        fontSize: getFontSize(
                                                                            18),
                                                                        fontFamily:
                                                                            'Flamenco',
                                                                        fontWeight:
                                                                            FontWeight.w400)))
                                                          ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 15),
                                                          child: Text(
                                                              snapshot.data?.docs[
                                                                      index][
                                                                  "tile"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign: TextAlign
                                                                  .left,
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .whiteA700,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          18),
                                                                  fontFamily:
                                                                      'Flamenco',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 4),
                                                          child: Text(
                                                              snapshot.data
                                                                          ?.docs[
                                                                      index][
                                                                  "description"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color:
                                                                      ColorConstant
                                                                          .whiteA700,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          14),
                                                                  fontFamily:
                                                                      'Flamenco',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 16),
                                                          child: Row(children: [
                                                            for (int i = 0;
                                                                i <
                                                                    snapshot
                                                                        .data
                                                                        ?.docs[
                                                                            index]
                                                                            [
                                                                            "invite"]
                                                                        .length;
                                                                i++)
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8.0),
                                                                child: Container(
                                                                    width: getSize(
                                                                        30.00),
                                                                    padding: getPadding(
                                                                        left: 8,
                                                                        top: 5,
                                                                        right:
                                                                            12,
                                                                        bottom:
                                                                            5),
                                                                    decoration: BoxDecoration(
                                                                        color: ColorConstant
                                                                            .red400,
                                                                        borderRadius: BorderRadius.circular(getHorizontalSize(
                                                                            15.00))),
                                                                    child: Text(
                                                                        snapshot.data?.docs[index]["invite"][i]["name"]
                                                                            [0],
                                                                        overflow: TextOverflow
                                                                            .ellipsis,
                                                                        textAlign: TextAlign
                                                                            .left,
                                                                        style: TextStyle(
                                                                            color: ColorConstant.whiteA700,
                                                                            fontSize: getFontSize(18),
                                                                            fontFamily: 'Flamenco',
                                                                            fontWeight: FontWeight.w400))),
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
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            8.0),
                                                                child: Container(
                                                                    width: getSize(
                                                                        30.00),
                                                                    padding: getPadding(
                                                                        left:
                                                                            11,
                                                                        top: 5,
                                                                        right:
                                                                            12,
                                                                        bottom:
                                                                            5),
                                                                    decoration: BoxDecoration(
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(
                                                                                15.00))),
                                                                    child: Text(
                                                                        "+",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: TextStyle(
                                                                            color:
                                                                                ColorConstant.black900,
                                                                            fontSize: getFontSize(18),
                                                                            fontFamily: 'Flamenco',
                                                                            fontWeight: FontWeight.w400))),
                                                              ),
                                                            ),
                                                          ]))
                                                    ]))),
                                        // Spacer(),
                                      ]),
                                );
                              });
                        }
                        return SizedBox();
                      }),
                ),
              )
            ]));
  }

  onTapColumn23nov(BuildContext context, QueryDocumentSnapshot? doc) {
    Navigator.pushNamed(context, AppRoutes.detailsScreen,arguments: doc);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => DetailsScreen().builder(context,)),
    // );
  }

  onTapPlanevent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEventScreen()),
    );
  }
}
