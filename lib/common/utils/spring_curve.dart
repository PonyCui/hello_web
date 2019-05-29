import 'dart:math';
import 'package:flutter_web/material.dart';

class SpringCurve extends Curve {
  final double a;
  final double b;

  SpringCurve({this.a = 6, this.b = 12});

  @override
  double transform(double t) {
    c12(t) =>
        -0.5 *
        exp(-this.a * t) *
        (-2 * exp(this.a * t) + sin(this.b * t) + 2 * cos(this.b * t));
    return c12(t) + t * (1 - 0.9985733108072201);
  }
}
