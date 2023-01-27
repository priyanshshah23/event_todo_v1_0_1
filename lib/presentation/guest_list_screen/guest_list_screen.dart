import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_todo/presentation/home_screen/home_screen.dart';
import 'package:event_todo/presentation/invite_screen/invite_screen.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:provider/provider.dart';

import '../guest_list_screen/widgets/guest_list_item_widget.dart';
import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:event_todo/core/constants/constants.dart';

class GuestListScreen extends StatelessWidget {
  GuestListScreen();

  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(context),
      child: GuestListScreen(),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getContact();
  // }
  // void getContact() async {
  //   if (await FlutterContacts.requestPermission()) {
  //     contacts = await FlutterContacts.getContacts(
  //         withProperties: true, withPhoto: true);
  //     print(contacts);
  //     setState(() {});
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    var contacts = Provider.of<ContactProvider>(context)
        .contacts; //context.watch<ContactProvider>().myList;

    // return ChangeNotifierProvider<ContactProvider>(create:(_) => ContactProvider(),
    //   builder: (context,child) {
    //     contacts = context.watch<ContactProvider>().contacts;
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
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
                              padding: getPadding(top: 42),
                              child: Text("Guest List",
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
                            padding: getPadding(all: 40),
                            decoration: BoxDecoration(
                                color: ColorConstant.black900,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        getHorizontalSize(30.00)),
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
                                  FutureBuilder(
                                    future: FlutterContacts.getContacts(
                                        withProperties: true, withPhoto: true),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  height:
                                                      getVerticalSize(25.00));
                                            },
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index) {
                                              return GuestListItemWidget(
                                                  snapshot.data![index]);
                                            });
                                      }
                                      return Container();
                                    },
                                  ),
                                  Spacer(),
                                  CustomButton(
                                      height: 50,
                                      width: 313,
                                      text: "Invite",
                                      onTap: () => onTapInvite(context))
                                ])),
                      )
                    ]))));
    //   },
    // );
  }

  onTapInvite(BuildContext context) {
    List<Map<String, dynamic>> updatedList = [];
    for (int i = 0; i < Constants.myList.length; i++) {
      Map<String, dynamic> member = Map<String, dynamic>();
      member.addAll({"name": Constants.myList[i].displayName});
      member.addAll({"number": Constants.myList[i].phones[0].number});
      updatedList.add(member);
    }
    context.read<ContactProvider>().clearList();

    Map<String, dynamic> updatedData = {
      'invite': updatedList,
    };

    FirebaseFirestore.instance
        .collection("todo_list")
        .doc(Constants.databaseID)
        .update(updatedData);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }
}

class ContactProvider with ChangeNotifier {
  ContactProvider(BuildContext context) : super() {
    Constants().getContacts();
  }

  List<Contact> get contacts => Constants.contacts;

  List<Contact> get myList => Constants.myList;

  List<Map<String, bool>> get myTodoList => Constants.myTodoList;

  void addToList(Contact contacts) {
    myList.add(contacts);
    print(myList.length);
    notifyListeners();
    print("Add List....${myList.length}");
  }

  void removeFromList(Contact contacts) {
    myList.remove(contacts);
    notifyListeners();
    print("Remove List....${myList.length}");
  }

  updateList(var contacts) {
    if (!myList.contains(contacts)) {
      addToList(contacts);
    } else {
      removeFromList(contacts);
    }
  }

  clearList() {
    myList.clear();
  }

  void addToDoList(Map<String, bool> list) {
    myTodoList.add(list);
    print(myTodoList.length);
    notifyListeners();
    print("Add Todo List....${myTodoList.length}");
  }
}
