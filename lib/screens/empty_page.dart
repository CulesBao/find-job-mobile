import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Empty')),
      body: const Center(
        child: Text('Empty page — add your UI or widgets here'),
      ),
    );
  }
}
