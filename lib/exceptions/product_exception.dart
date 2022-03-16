import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductException implements Exception {
  String? message;

  // This can be different based on the httpClient library we use.
  ProductException.fromFlutterError(FlutterError flutterError) {
      message = flutterError.message;
  }

  String _handleError(statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'Something you are looking for is not available';
      case 500:
        return "Internal server error, Contact Support Team";
      default:
        return "Oops something went wrong";
    }
  }

  @override
  String toString() => message.toString();
}