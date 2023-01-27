part of 'details_screen.dart';

class DetailsProvider with ChangeNotifier {
  QueryDocumentSnapshot? doc;
  TextEditingController controller = TextEditingController();

  DetailsProvider(BuildContext context) : super() {
    Timer.run(() {
      doc = ModalRoute.of(context)?.settings.arguments as QueryDocumentSnapshot;
      notifyListeners();
    });
  }

  List<Map<String, bool>> get myTodoList => Constants.myTodoList;

  void addToDoList(Map<String, bool> list) {
    myTodoList.add(list);
    print(myTodoList.length);
    notifyListeners();
    print("Add Todo List....${myTodoList.length}");
  }


  updateKeyValue(key1,val,int i){
    print("before......${key1}");

    FirebaseFirestore.instance.collection('todo_list').doc(Constants.databaseID).update({"todo": FieldValue.arrayUnion([{
    "listEvent":"test2","listStatus":false}])});

    notifyListeners();
}

  onTapAddtodo(BuildContext context) {
    addToDoList({controller.text: false});
    controller.clear();
    addToFirebase();
    Navigator.pop(context);
  }

  addToFirebase(){
    List<Map<String, dynamic>> updatedList = [];
    for(int i=0;i<myTodoList.length;i++){
      Map<String,dynamic> member = Map<String,dynamic>();
      member.addAll({"listEvent": myTodoList[i].keys.first});
      member.addAll({"listStatus":!myTodoList[i].values.first});
      updatedList.add(member);
    }
    // FirebaseFirestore.instance.collection("todo_list").doc(Constants.databaseID).update(updatedData);
    FirebaseFirestore.instance.collection('todo_list').doc(Constants.databaseID).update({"todo": FieldValue.arrayUnion(updatedList)});

    notifyListeners();

  }
}
