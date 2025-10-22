import 'package:find_job_mobile/app/config/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home — project skeleton is ready'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to empty page
                context.push(RoutePath.empty);
              },
              child: const Text('Go to empty page'),
            ),
          ],
        ),
      ),
    );
  }
}
