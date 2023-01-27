import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/presentation/add_event_screen/add_event_screen.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/presentation/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(context),
      child: SignInScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      Container(
                          width: getHorizontalSize(167.00),
                          child: Text("EventLy",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstant.whiteA700,
                                  fontSize: getFontSize(62),
                                  fontFamily: 'Freehand',
                                  fontWeight: FontWeight.w400))),
                      Container(
                          width: size.width,
                          margin: getMargin(top: 151),
                          padding: getPadding(
                              left: 40, top: 58, right: 40, bottom: 58),
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
                                Container(
                                    width: getHorizontalSize(200.00),
                                    child: Text(
                                        "Plan, Invite and Manage events like a pro.",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ColorConstant.whiteA700,
                                            fontSize: getFontSize(32),
                                            fontFamily: 'Flamenco',
                                            fontWeight: FontWeight.w400))),
                                InkWell(onTap: (){
                                  // signup(context);
                                  onReady(context);
                                },
                                  child: Container(
                                      margin: getMargin(top: 126, bottom: 26),
                                      padding: getPadding(
                                          left: 20,
                                          top: 13,
                                          right: 20,
                                          bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(25.00))),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgGoogle,
                                            height: getSize(24.00),
                                            width: getSize(24.00)),
                                        Padding(
                                            padding: getPadding(
                                                left: 36,
                                                top: 2,
                                                right: 63,
                                                bottom: 3),
                                            child: Text("Continue with Google",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: ColorConstant.black900,
                                                    fontSize: getFontSize(18),
                                                    fontFamily: 'Flamenco',
                                                    fontWeight: FontWeight.w400)))
                                      ])),
                                )
                              ]))
                    ]))));
  }

  // function to implement the google signin

// creating firebase instance

  Future<void> signup(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
print(user?.displayName);
      if (result != null) {
        print("Hello");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddEventScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
    onReady(context);
  }


  onReady(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  AddEventScreen()),
      );
  // });
  }
}
