import 'package:event_todo/core/app_export.dart';
import 'package:event_todo/presentation/guest_list_screen/guest_list_screen.dart';
import 'package:event_todo/widgets/custom_button.dart';
import 'package:event_todo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatelessWidget {
  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(context),
      child: AddTodoScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black900,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          padding: getPadding(
            all: 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFormField(
                width: 313,
                focusNode: FocusNode(),
                hintText: "To Do",
                shape: TextFormFieldShape.CircleBorder25,
                padding: TextFormFieldPadding.PaddingAll13,
                textInputAction: TextInputAction.done,
              ),
              CustomButton(
                height: 50,
                width: 313,
                text: "Add",
                margin: getMargin(
                  top: 93,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
