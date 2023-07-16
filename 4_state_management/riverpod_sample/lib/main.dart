import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'views/pages/pages.dart';

final titleProvider = Provider((_) => 'TODOアプリ');

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

@immutable
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = ref.watch(titleProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodosListPage(title: title),
    );
  }
}
