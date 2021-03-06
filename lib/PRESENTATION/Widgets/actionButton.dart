import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final actionModel;
  final name;
  final Function action;
  ActionButton({this.actionModel, @required this.name, this.action});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: actionModel['padding'],
      child: SizedBox(
        width: actionModel['width'],
        height: actionModel['height'],
        child: RaisedButton(
          color: actionModel['raisedButton']['color'],
          child:
              Text('$name', style: actionModel['raisedButton']['titleStyle']),
          onPressed: action,
        ),
      ),
    );
  }
}
