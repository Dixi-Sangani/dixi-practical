import 'package:dixi_prectical/models/models.dart';
import 'package:equatable/equatable.dart';



abstract class EntryState extends Equatable {
  @override
  List<Object> get props => [];
}

class EntryInitialState extends EntryState {}

class EntriesLoadingState extends EntryState {}

class EntriesLoadedState extends EntryState {
  final List<Entry> entries;

  EntriesLoadedState(this.entries);
}

class EntriesErrorState extends EntryState {
  final String message;

  EntriesErrorState(this.message);
}
