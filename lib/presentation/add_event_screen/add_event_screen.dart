import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/widgets/custom_button.dart';
import 'package:event_todo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class AddEventScreen extends StatelessWidget {
  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(context),
      child: AddEventScreen(),
    );
  }
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String? dateTime;
  String? timeOfDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.black900,
        resizeToAvoidBottomInset: false,
        body: Container(
            width: size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgArrowleft,
                      height: getSize(36.00),
                      width: getSize(36.00),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      margin: getMargin(left: 20, top: 30)),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(top: 40),
                          child: Text("Plan Event",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: ColorConstant.whiteA700,
                                  fontSize: getFontSize(32),
                                  fontFamily: 'Flamenco',
                                  fontWeight: FontWeight.w400)))),
                  Expanded(
                    child: Container(
                        width: size.width,
                        margin: getMargin(top: 79),
                        padding: getPadding(all: 40),
                        decoration: BoxDecoration(
                            color: ColorConstant.black900,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(getHorizontalSize(30.00)),
                                topRight:
                                    Radius.circular(getHorizontalSize(30.00))),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorConstant.whiteA7007f,
                                  spreadRadius: getHorizontalSize(2.00),
                                  blurRadius: getHorizontalSize(2.00),
                                  offset: Offset(0, -10))
                            ]),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                  width: 313,
                                  focusNode: FocusNode(),
                                  hintText: "Title",controller: title,
                                  shape: TextFormFieldShape.CircleBorder25,
                                  padding: TextFormFieldPadding.PaddingAll13),
                              CustomTextFormField(
                                  width: 313,
                                  focusNode: FocusNode(),
                                  hintText: "Description",
                                  controller: description,
                                  margin: getMargin(top: 38),
                                  shape: TextFormFieldShape.RoundedBorder30,
                                  padding: TextFormFieldPadding.PaddingAll17,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 7),
                              Padding(
                                  padding: getPadding(top: 38),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(DateTime.now().year,DateTime.now().month+1,DateTime.now().day), initialDate: DateTime.now(),).then((value) => dateTime= DateFormat("d MMM").format(DateTime.parse(value.toString())));
                                          },
                                          child: Container(
                                              padding: getPadding(
                                                  left: 26,
                                                  top: 8,
                                                  right: 26,
                                                  bottom: 8),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant.black900,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              10.00)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            ColorConstant.gray500,
                                                        spreadRadius:
                                                            getHorizontalSize(
                                                                2.00),
                                                        blurRadius:
                                                            getHorizontalSize(
                                                                2.00),
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgCalendar,
                                                        height: getSize(48.00),
                                                        width: getSize(48.00),
                                                        margin:
                                                            getMargin(top: 1)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 15),
                                                        child: Text("Day",
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
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
                                                                        .w400)))
                                                  ])),
                                        ),
                                        InkWell(onTap: (){
                                          showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) => timeOfDay = ("${value?.hourOfPeriod.toString()} : ${value?.hour.toString()}"));
                                        },
                                          child: Container(
                                              padding: getPadding(
                                                  left: 26,
                                                  top: 10,
                                                  right: 26,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant.black900,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              10.00)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            ColorConstant.gray500,
                                                        spreadRadius:
                                                            getHorizontalSize(
                                                                2.00),
                                                        blurRadius:
                                                            getHorizontalSize(
                                                                2.00),
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgClock,
                                                        height: getSize(48.00),
                                                        width: getSize(48.00)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 13),
                                                        child: Text("Time",
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
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
                                                                        .w400)))
                                                  ])),
                                        )
                                      ])),
                              Spacer(),
                              CustomButton(
                                  height: 50,
                                  width: 313,
                                  text: "Done",
                                  onTap: () => onTapDone(context))
                            ])),
                  )
                ])));
  }

  onTapDone(BuildContext context) async {
    print("title....${title.text.toString()}");
    print("description....${description.text.toString()}");
    print("dateTime....${dateTime.toString()}");
    print("TimeOfDay....${timeOfDay.toString()}");
    try {
      await FirebaseFirestore.instance.collection("todo_list").add({
        'tile': title.text.toString(),
        'description': description.text.toString(),
        'dateTime': dateTime,
        'TimeOfDay': timeOfDay,
      }).then((value) => Constants.databaseID = value.id);
    }catch(e){
      print("Exception in FireStore...$e");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GuestListScreen().builder(context)),
    );
  }
}

class AddEvent{
  String? title;
  String? description;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  AddEvent({
    this.title,
    this.description,
    this.dateTime,
    this.timeOfDay,
  });
}
