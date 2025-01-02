import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // TODO page route!!!
            context.go('/post');
          },
          child: Text('Go to PostListPage'),
        ),
      ),
    );
  }
}
