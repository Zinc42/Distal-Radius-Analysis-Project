import 'package:flutter/material.dart';
//Temporary class to store some data about where the point in the images native resolution would be

class Coordinate {
   double x;
   double y;
   Coordinate({required this.x, required this.y});

   //Function updates the stored coordinate data by adding the change in x and y when moving the dragable object on screen
   UpdateCordinate(Offset offset, double scalarX, double scalarY) {
     x += (offset.dx * scalarX).round();
     y += (offset.dy * scalarY).round();
   }
}