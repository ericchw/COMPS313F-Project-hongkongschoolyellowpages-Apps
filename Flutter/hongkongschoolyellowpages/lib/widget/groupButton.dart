import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GroupButtonWidget extends StatelessWidget {
  GroupButtonWidget({
    required this.buttons,
    this.onSelected,
  });
  final List<String> buttons;
  final onSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GroupButton(
          spacing: 10,
          isRadio: true,
          direction: Axis.horizontal,
          onSelected: onSelected,
          buttons: buttons,
          selectedButton: 0,
          selectedTextStyle: TextStyle(
            fontSize: 12,
            color: Colors.blue,
          ),
          unselectedTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.grey[600],
          ),
          selectedColor: Colors.white,
          //buttonHeight: MediaQuery.of(context).size.height * 0.1,
          // buttonWidth: MediaQuery.of(context).size.width * 0.21,
          unselectedColor: Colors.grey[300],
          selectedBorderColor: Colors.blue,
          unselectedBorderColor: Colors.grey[500],
          borderRadius: BorderRadius.circular(5.0),
          selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
          unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
        ));
  }
}
