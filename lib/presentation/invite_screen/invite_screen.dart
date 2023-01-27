import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/presentation/home_screen/home_screen.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:provider/provider.dart';

import '../invite_screen/widgets/invite_item_widget.dart';
import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class InviteScreen extends StatelessWidget {

  Widget builder(BuildContext context){
    return ChangeNotifierProvider(create: (context)=>ContactProvider(context),child: InviteScreen(),);
  }

  @override
  Widget build(BuildContext context) {
    var contacts = Provider.of<ContactProvider>(context).contacts;//context.watch<ContactProvider>().myList;
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            body: Container(
                width: size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(onTap: (){
                        Navigator.of(context).pop();

                      },
                        child: CustomImageView(
                            svgPath: ImageConstant.imgArrowleft,
                            height: getSize(36.00),
                            width: getSize(36.00),
                            margin: getMargin(left: 20, top: 30)),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 42),
                              child: Text("Invite",
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
                            margin: getMargin(top: 67),
                            padding: getPadding(
                                left: 39, top: 40, right: 39, bottom: 40),
                            decoration: BoxDecoration(
                                color: ColorConstant.black900,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(getHorizontalSize(30.00)),
                                    topRight: Radius.circular(
                                        getHorizontalSize(30.00))),
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
                                  Padding(
                                      padding: getPadding(right: 1),
                                      child: ListView.separated(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                                height: getVerticalSize(25.00));
                                          },
                                          itemCount: contacts.length,
                                          itemBuilder: (context, index) {
                                            return InviteItemWidget(contacts[index]);
                                          })),
                                  Spacer(),
                                  CustomButton(
                                      height: 50,
                                      width: 313,
                                      text: "Done",
                                      onTap: () => onTapDone(context,contacts))
                                ])),
                      )
                    ]))));
  }

  onTapDone(BuildContext context,List<Contact> contacts) {
    List<Map<String, dynamic>> updatedList = [];
    for(int i=0;i<contacts.length;i++){
      Map<String,dynamic> member = Map<String,dynamic>();
      member.addAll({"name":contacts[i].displayName});
      member.addAll({"number":contacts[i].phones[0].number});
      updatedList.add(member);
    }
    Map<String, dynamic> updatedData = {
      'invite': updatedList,
    };

    FirebaseFirestore.instance.collection("todo_list").doc(Constants.databaseID).update(updatedData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  HomeScreen()),
    );  }
}
