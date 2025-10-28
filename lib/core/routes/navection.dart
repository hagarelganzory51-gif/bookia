import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: strict_top_level_inference

Future pushTo(BuildContext context, String route, {Object? extra}) {
  return context.push(route, extra: extra);

  Future pushTo(BuildContext context, String route, {Object? extra}) {return
  context.push(route, extra: extra);

}

// ignore: strict_top_level_inference
pushWithReplacement(BuildContext context, String route, {Object? extra}) {
  context.pushReplacement(route, extra: extra);
}

// ignore: strict_top_level_inference
goToBase(BuildContext context, String route, {Object? extra}) {
  context.go(route, extra: extra);
}

// ignore: strict_top_level_inference
pop(BuildContext context) {
  context.pop();
}
