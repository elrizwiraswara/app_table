import 'package:flutter/material.dart';

/// A model representing the data and appearance of a table cell.
class TableModel {
  /// The text data to be displayed in the cell.
  final String? data;

  /// The flex factor for the cell. Determines the amount of space the cell will take relative to others.
  final int flex;

  /// Whether the cell should expand to fill the available space.
  final bool expanded;

  /// A custom widget to be displayed in the cell. If provided, it overrides the [data].
  final Widget? child;

  /// The text style to be applied to the cell's text.
  final TextStyle? textStyle;

  /// The background color of the cell.
  final Color? color;

  /// Creates a [TableModel] instance.
  ///
  /// [data] is the text to be displayed in the cell.
  /// [flex] determines the flex factor for the cell. Default is 1.
  /// [expanded] indicates whether the cell should expand to fill the available space. Default is true.
  /// [child] is a custom widget to be displayed in the cell, overriding [data] if provided.
  /// [textStyle] is the text style to be applied to the cell's text.
  /// [color] is the background color of the cell.
  TableModel({
    this.data,
    this.flex = 1,
    this.expanded = true,
    this.child,
    this.textStyle,
    this.color,
  });
}
