import 'package:app_table/app_table.dart';
import 'package:example/sample_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppTableSamplesView(),
    );
  }
}

class AppTableSamplesView extends StatefulWidget {
  const AppTableSamplesView({super.key});

  @override
  State<AppTableSamplesView> createState() => _AppTableSamplesViewState();
}

class _AppTableSamplesViewState extends State<AppTableSamplesView> {
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
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      TableModel(
        data: 'Header 2',
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      TableModel(
        data: 'Header 3',
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      TableModel(
        data: 'Header 4',
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    ];
  }

  List<List<TableModel>> _buildData() {
    return [
      ...List.generate(
        4,
        (index) => [
          TableModel(
            expanded: false,
            child: Checkbox(
              value: false,
              onChanged: (val) {},
            ),
          ),
          TableModel(data: 'Data $index'),
          TableModel(data: 'Data $index'),
          TableModel(data: 'Data $index'),
          TableModel(data: 'Data $index'),
        ],
      )
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
        TableModel(
            data: 'Data $index',
            color: Theme.of(context).colorScheme.errorContainer),
        TableModel(data: 'Data $index'),
        TableModel(
            data: 'Data $index',
            color: Theme.of(context).colorScheme.errorContainer),
        TableModel(data: 'Data $index'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTable(),
            // defaultTableWithTitle(),
            defaultTableWithoutHeader(),
            customTable(),
          ],
        ),
      ),
    );
  }

  Widget defaultTable() {
    return SampleWrapper(
      title: 'Default Table',
      widget: AppTable(
        headerData: _buildHeaderData(),
        data: _buildData(),
        minWidth: 400,
      ),
    );
  }

  Widget defaultTableWithTitle() {
    return SampleWrapper(
      title: 'Default Table With Title',
      widget: AppTable(
        title: 'Title',
        headerData: _buildHeaderData(),
        data: _buildData(),
        minWidth: 400,
      ),
    );
  }

  Widget defaultTableWithoutHeader() {
    return SampleWrapper(
      title: 'Default Table Without Header',
      widget: AppTable(
        data: _buildData(),
        minWidth: 400,
      ),
    );
  }

  Widget customTable() {
    return SampleWrapper(
      title: 'Custom Table',
      widget: AppTable(
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
    );
  }
}
