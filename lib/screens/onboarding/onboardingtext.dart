import 'package:flutter/material.dart';

class PageModel {

  String _title;
  String _text;
  IconData _icon;
  String _image;

  PageModel(this._title, this._text, this._icon, this._image);

  String get image => _image;

  IconData get icon => _icon;

  String get text => _text;

  String get title => _title;


}