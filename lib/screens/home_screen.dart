import 'package:dixi_prectical/blocs/blocs.dart';
import 'package:dixi_prectical/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD with BLoC and SQLite'),
      ),
      body: BlocBuilder<EntryBloc, EntryState>(
        builder: (context, state) {
          if (state is EntriesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EntriesLoadedState) {
            return ListView.builder(
              itemCount: state.entries.length,
              itemBuilder: (context, index) {
                final entry = state.entries[index];
                return Card(
                  margin: const  EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  child: ListTile(
                    title: Text("Name: ${entry.name}"),
                    subtitle: Text("Des: ${entry.description}"),
                    leading: Text("${index + 1}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.deepPurple,),
                          onPressed: () => _showEditDialog(context, entry),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent,),
                          onPressed: () {
                            BlocProvider.of<EntryBloc>(context).add(DeleteEntryEvent(entry.id!));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is EntriesErrorState) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Add Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                BlocProvider.of<EntryBloc>(context).add(
                  AddEntryEvent(nameController.text, descriptionController.text),
                );
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Entry entry) {
    final nameController = TextEditingController(text: entry.name);
    final descriptionController = TextEditingController(text: entry.description);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Edit Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const  InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                BlocProvider.of<EntryBloc>(context).add(
                  UpdateEntryEvent(entry.id!, nameController.text, descriptionController.text),
                );
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }
}
