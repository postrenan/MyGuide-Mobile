import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart'; // Popup Toast [Mensajes de alerta]

class ToastMyGuide {
  static ToastificationStyle _setStyle(String style) {
    switch (style) {
      case 'fill':
        return ToastificationStyle.fillColored;
      
      case 'flat':
        return ToastificationStyle.flat;
      
      case 'flatColored':
        return ToastificationStyle.flatColored;
      
      case 'minimal':
        return ToastificationStyle.minimal;
      
      case 'simple':
        return ToastificationStyle.simple;
      
      default:
        return ToastificationStyle.flatColored;
    }
  }

  static ToastificationType _setType(String type) {
    switch(type) {
      case 'error':
        return ToastificationType.error;

      case 'info':
        return ToastificationType.info;
      
      case 'success':
        return ToastificationType.success;
      
      case 'warning':
        return ToastificationType.warning;

      default:
        return ToastificationType.info;
    }
  }

  static void show(BuildContext context, String text, {String style = '', String type = '', int closeDuration = 5}) {
    toastification.show(
      context: context,
      style: _setStyle(style),
      type: _setType(type),
      title: Text(text),
      autoCloseDuration: Duration(seconds: closeDuration)
    );
  }
}
