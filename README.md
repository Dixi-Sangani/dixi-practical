# Flutter CRUD with BLoC and SQLite

This is a Flutter application that demonstrates how to implement CRUD (Create, Read, Update, Delete) operations using the BLoC (Business Logic Component) pattern and SQLite for local database storage.

## Features

- **Create**: Add new entries with a name and description.
- **Read**: Display a list of entries stored in the SQLite database.
- **Update**: Edit existing entries to update their details.
- **Delete**: Remove entries from the database.

## Technologies Used

- **Create**: Add new entries with a name and description.
- **Read**: Display a list of entries stored in the SQLite database.
- **Update**: Edit existing entries to update their details.
- **Delete**: Remove entries from the database.

## Folder Structure
dixi_practical/
├── lib/
│   ├── bloc/
│   │   ├── entry_bloc.dart         # BLoC for managing entry states and events
│   │   ├── entry_event.dart        # Events for entry actions
│   │   └── entry_state.dart        # States for entry management
│   ├── models/
│   │   └── entry_model.dart        # Model for entry data
│   ├── database/
│   │   └── database_helper.dart   # database operations
│   ├── screens/
│   │   └── home_screen.dart        # Main screen for displaying and managing entries
│   └── main.dart                   # Main entry point of the application
├── pubspec.yaml                    # Flutter package configuration
└── README.md                       # Project documentation


## Getting Started 

### Prerequisites

Make sure you have the following installed:

- Flutter SDK installed on your machine.
- An IDE (like Visual Studio Code or Android Studio) for Flutter development.
 

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Dixi-Sangani/dixi-practical.git
   ```
   
2. Install the dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```


### Usage
- **Add Entry**: Click the "+" button on the home screen to open a dialog for adding a new entry. Fill in the name and description, then click "Save".

- **Edit Entry**: Click the pencil icon next to an entry to open the edit dialog. Make your changes and click "Update".

- **Delete Entry**: Click the trash icon next to an entry to delete it.

### For the run TestCase 
```bash
  flutter test integration_test/app_test.dart
```
