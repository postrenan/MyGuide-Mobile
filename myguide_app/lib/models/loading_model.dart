import 'package:flutter/material.dart';

class LoadingModel {
  static Center set() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.orange)
    );
  }
}
