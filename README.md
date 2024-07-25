# AppTable Flutter Package

A Flutter widget that displays a customizable table with headers and rows of data. It supports various customization options for styling and layout. The AppTable widget provides a variety of customization options, including customizable header and data rows, configurable title with styles, support for different text alignments and cell alignments, customizable table dimensions and padding, scrollable table content, and customizable border widths and colors.

<br/>
<p align="left">
  <img src="https://github.com/elrizwiraswara/app_table/raw/main/1.png" alt="Image 1" height="500">
</p>

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  app_table: ^0.0.1
```

Then run `flutter pub get` to install the package.

## Usage
### Basic Usage

```
import 'package:app_table/app_table.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TableModel> _buildHeaderData() {
    return [
      TableModel(
        expanded: false,
        child: Checkbox(
          value: true,
          onChanged: (val) {},
        ),
      ),
      TableModel(
        data: 'Header 1',
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      TableModel(
        data: 'Header 2',
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      TableModel(
        data: 'Header 3',
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      TableModel(
        data: 'Header 4',
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    ];
  }

  List<List<TableModel>> _buildDataCustom() {
    return List.generate(
      4,
      (index) => [
        TableModel(
          expanded: false,
          child: Checkbox(
            value: false,
            onChanged: (val) {},
          ),
        ),
        TableModel(data: 'Data $index', color: Theme.of(context).colorScheme.errorContainer),
        TableModel(data: 'Data $index'),
        TableModel(data: 'Data $index', color: Theme.of(context).colorScheme.errorContainer),
        TableModel(data: 'Data $index'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AppTable(
          title: 'This Is Custom Table',
          headerData: _buildHeaderData(),
          data: _buildDataCustom(),
          headerBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
          backgroundColor: Theme.of(context).colorScheme.surfaceDim,
          dataBottomBorderWidth: 1,
          headerBottomBorderWidth: 1,
          dataBottomBorderColor: Theme.of(context).colorScheme.outline,
          headerBottomBorderColor: Theme.of(context).colorScheme.primary,
          borderRadius: 8,
          tableBorderWidth: 1,
          tableBorderColor: Theme.of(context).colorScheme.outline,
          minWidth: 400,
          minHeight: 400,
        ),
      ),
    );
  }
}
```

## Example
Check out the [example](example) directory for a complete sample app demonstrating the use of the app_image package.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

<a href="https://trakteer.id/elrizwiraswara/tip" target="_blank"><img id="wse-buttons-preview" src="https://cdn.trakteer.id/images/embed/trbtn-red-6.png?date=18-11-2023" height="40" style="border:0px;height:40px;margin-top:14px" alt="Trakteer Saya"></a>
