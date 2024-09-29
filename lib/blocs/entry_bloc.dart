import 'package:dixi_prectical/blocs/blocs.dart';
import 'package:dixi_prectical/database/database.dart';
import 'package:dixi_prectical/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final DatabaseHelper entryRepository;

  EntryBloc(this.entryRepository) : super(EntryInitialState()) {
    // Register the event handlers here
    on<LoadEntriesEvent>((event, emit) async {
      emit(EntriesLoadingState());
      try {
        final entries = await entryRepository.getEntries();
        emit(EntriesLoadedState(entries));
      } catch (e) {
        emit(EntriesErrorState("Failed to load entries"));
      }
    });

    on<AddEntryEvent>((event, emit) async {
      await entryRepository.addEntry(Entry(name: event.name, description: event.description));
      add(LoadEntriesEvent()); // Load entries again after adding
    });

    on<UpdateEntryEvent>((event, emit) async {
      await entryRepository.updateEntry(Entry(id: event.id, name: event.name, description: event.description));
      add(LoadEntriesEvent()); // Load entries again after updating
    });

    on<DeleteEntryEvent>((event, emit) async {
      await entryRepository.deleteEntry(event.id);
      add(LoadEntriesEvent()); // Load entries again after deleting
    });
  }
}
