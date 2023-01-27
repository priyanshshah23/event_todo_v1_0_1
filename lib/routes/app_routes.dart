import 'package:flutter/material.dart';
import 'package:event_todo/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:event_todo/presentation/add_event_screen/add_event_screen.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/presentation/invite_screen/invite_screen.dart';
import 'package:event_todo/presentation/home_screen/home_screen.dart';
import 'package:event_todo/presentation/details_screen/details_screen.dart';
import 'package:event_todo/presentation/add_todo_screen/add_todo_screen.dart';
import 'package:event_todo/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String signInScreen = '/sign_in_screen';

  static const String addEventScreen = '/add_event_screen';

  static const String guestListScreen = '/guest_list_screen';

  static const String inviteScreen = '/invite_screen';

  static const String homeScreen = '/home_screen';

  static const String detailsScreen = '/details_screen';

  static const String addTodoScreen = '/add_todo_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    signInScreen: (context) => SignInScreen().builder(context),
    addEventScreen: (context) => AddEventScreen().builder(context),
    guestListScreen: (context) => GuestListScreen().builder(context),
    inviteScreen: (context) => InviteScreen().builder(context),
    homeScreen: (context) => HomeScreen().builder(context),
     detailsScreen: (context) => DetailsScreen().builder(context),
    addTodoScreen: (context) => AddTodoScreen().builder(context),
    appNavigationScreen: (context) => AppNavigationScreen().builder(context)
  };
}
