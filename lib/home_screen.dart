import 'package:flutter/material.dart';

import 'get_comment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Request'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => id += 1),
        child: Text(id.toString()),
      ),
      body: FutureBuilder(
        future: getComment(id),
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(
              child: Text(
                snap.error.toString(),
              ),
            );
          }

          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final comment = snap.data!;

          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(comment.body),
                ),
              );
            },
            leading: CircleAvatar(
              child: Text(
                comment.id.toString(),
              ),
            ),
            title: Text(
              comment.name,
            ),
            subtitle: Text(
              comment.email,
            ),
          );
        },
      ),
    );
  }
}
