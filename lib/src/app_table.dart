import 'package:flutter/material.dart';

import 'table_model.dart';

/// A widget that displays a customizable table with a header and rows of data.
class AppTable extends StatefulWidget {
  /// Data for the header row.
  final List<TableModel>? headerData;

  /// Data for the table rows.
  final List<List<TableModel>> data;

  /// Title of the table.
  final String? title;

  /// Style for the title text.
  final TextStyle? titleStyle;

  /// Style for the table text.
  final TextStyle? textStyle;

  /// Alignment for the table cells.
  final Alignment alignment;

  /// Text alignment for the table cells.
  final TextAlign textAlign;

  /// Width of the table.
  final double? width;

  /// Height of the table.
  final double? height;

  /// Minimum width of the table.
  final double? minWidth;

  /// Minimum height of the table.
  final double? minHeight;

  /// Border radius for the table.
  final double borderRadius;

  /// Width of the bottom border of the header row.
  final double? headerBottomBorderWidth;

  /// Width of the bottom border of the data rows.
  final double? dataBottomBorderWidth;

  /// Width of the table border.
  final double? tableBorderWidth;

  /// Background color for the header row.
  final Color? headerBackgroundColor;

  /// Color of the bottom border of the header row.
  final Color? headerBottomBorderColor;

  /// Background color for the table.
  final Color? backgroundColor;

  /// Color of the bottom border of the data rows.
  final Color? dataBottomBorderColor;

  /// Color of the table border.
  final Color? tableBorderColor;

  /// Padding for the table title.
  final EdgeInsets titlePadding;

  /// Padding for the header row.
  final EdgeInsets? headerPadding;

  /// Padding for the table cells.
  final EdgeInsets padding;

  /// Scroll controller for the table.
  final ScrollController? horizontalScrollController;
  final ScrollController? verticalScrollController;

  /// Constructor for the AppTable widget.
  const AppTable({
    super.key,
    this.headerData,
    required this.data,
    this.title,
    this.titleStyle,
    this.textStyle,
    this.alignment = Alignment.centerLeft,
    this.textAlign = TextAlign.left,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.borderRadius = 0,
    this.headerBottomBorderWidth,
    this.dataBottomBorderWidth = 1,
    this.tableBorderWidth,
    this.headerBackgroundColor,
    this.headerBottomBorderColor,
    this.backgroundColor,
    this.dataBottomBorderColor,
    this.tableBorderColor,
    this.titlePadding = const EdgeInsets.only(bottom: 14),
    this.headerPadding,
    this.padding = const EdgeInsets.all(12),
    this.horizontalScrollController,
    this.verticalScrollController,
  });

  @override
  State<AppTable> createState() => _AppTableState();
}

class _AppTableState extends State<AppTable> {
  /// Controller for scrolling the table.
  ScrollController horizontalScrollController = ScrollController();
  ScrollController verticalScrollController = ScrollController();

  @override
  void initState() {
    horizontalScrollController =
        widget.horizontalScrollController ?? ScrollController();
    verticalScrollController =
        widget.verticalScrollController ?? ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    horizontalScrollController.dispose();
    verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(),
        Container(
          foregroundDecoration: BoxDecoration(
            border: widget.tableBorderWidth != null
                ? Border.all(
                    width: widget.tableBorderWidth!,
                    color: widget.tableBorderColor ??
                        Theme.of(context).colorScheme.outlineVariant,
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: SingleChildScrollView(
              controller: horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: Container(
                width: widget.width ?? MediaQuery.sizeOf(context).width,
                constraints: BoxConstraints(minWidth: widget.minWidth ?? 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.headerData != null
                        ? header(widget.headerData!)
                        : const SizedBox.shrink(),
                    Container(
                      height: widget.height,
                      constraints:
                          BoxConstraints(minWidth: widget.minHeight ?? 0),
                      child: SingleChildScrollView(
                        controller: verticalScrollController,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(widget.data.length, (i) {
                            return row(widget.data[i]);
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the title widget for the table.
  Widget title() {
    if (widget.title == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: widget.titlePadding,
      child: Text(
        widget.title ?? '',
        style: widget.titleStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Builds the header row for the table.
  Widget header(List<TableModel> header) {
    return Container(
      decoration: BoxDecoration(
        color: widget.headerBackgroundColor ??
            Theme.of(context).colorScheme.surfaceContainer,
        border: widget.headerBottomBorderWidth != null
            ? Border(
                bottom: BorderSide(
                  width: widget.headerBottomBorderWidth!,
                  color: widget.headerBottomBorderColor ??
                      Theme.of(context).colorScheme.outlineVariant,
                ),
              )
            : null,
      ),
      child: Row(
        children: List.generate(
          header.length,
          (i) => header[i].expanded
              ? Expanded(
                  flex: header[i].flex,
                  child: header[i].child != null
                      ? header[i].child!
                      : child(header[i]),
                )
              : header[i].child != null
                  ? header[i].child!
                  : child(header[i]),
        ),
      ),
    );
  }

  /// Builds a row of data for the table.
  Widget row(List<TableModel> data) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ??
            Theme.of(context).colorScheme.surfaceContainerLow,
        border: widget.dataBottomBorderWidth != null
            ? Border(
                bottom: BorderSide(
                  width: widget.dataBottomBorderWidth!,
                  color: widget.dataBottomBorderColor ??
                      Theme.of(context).colorScheme.outlineVariant,
                ),
              )
            : null,
      ),
      child: Row(
        children: List.generate(
          data.length,
          (i) => data[i].expanded
              ? Expanded(
                  flex: data[i].flex,
                  child:
                      data[i].child != null ? data[i].child! : child(data[i]),
                )
              : data[i].child != null
                  ? data[i].child!
                  : child(data[i]),
        ),
      ),
    );
  }

  /// Builds a cell widget for the table.
  Widget child(TableModel data) {
    return Container(
      padding: widget.padding,
      alignment: widget.alignment,
      color: data.color,
      child: Text(
        data.data ?? '',
        textAlign: widget.textAlign,
        overflow: TextOverflow.ellipsis,
        style: data.textStyle ??
            widget.textStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
