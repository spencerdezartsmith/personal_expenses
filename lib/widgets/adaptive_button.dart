import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Function onPressHandler;
  final String text;

  AdaptiveButton(this.text, this.onPressHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text),
            onPressed: onPressHandler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(text),
            onPressed: onPressHandler,
          );
  }
}
