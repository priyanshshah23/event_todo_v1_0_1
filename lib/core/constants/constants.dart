import 'package:flutter_contacts/flutter_contacts.dart';
class Constants {
  static final List<Contact> myList = [];
  static final List<Map<String,bool>> myTodoList = [];
  static final List<Map<String,dynamic>> myTodoList1 = [];
  static List<Contact> contacts = [];


  getContacts() async {
    contacts =  (await FlutterContacts.getContacts(withProperties: true, withPhoto: true));
  }

  static String? databaseID = "";
}
