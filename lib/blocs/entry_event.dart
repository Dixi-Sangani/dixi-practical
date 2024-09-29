import 'package:equatable/equatable.dart';

abstract class EntryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadEntriesEvent extends EntryEvent {}

class AddEntryEvent extends EntryEvent {
  final String name;
  final String description;

  AddEntryEvent(this.name, this.description);
}

class UpdateEntryEvent extends EntryEvent {
  final int id;
  final String name;
  final String description;

  UpdateEntryEvent(this.id, this.name, this.description);
}

class DeleteEntryEvent extends EntryEvent {
  final int id;

  DeleteEntryEvent(this.id);
}
