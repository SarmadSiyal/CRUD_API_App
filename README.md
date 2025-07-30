# CRUD API Flutter App

This is a Flutter app that performs full **CRUD (Create, Read, Update, Delete)** operations using a **REST API**, MockAPi. The app is developed as part of Flutter Developer Internship , featuring clean architecture, state management with `Provider`, form validation, custom error handling, and more.

# How to Run the App

1. **Clone this repository** or download the source code.
2. **Install dependencies**:
   ```bash
   flutter pub get
# API Used
- This app uses MockAPI – a free online REST API for prototyping and testing.
- Base URL: https://6888e92cadf0e59551bbe434.mockapi.io/items
- Each item has:
- id (String)
- title (String)
- description (String)

# Architecture & State Management
- lib/
- api_service.dart       # Handles API calls (GET, POST, PUT, DELETE)
- item_model.dart        # Data model for an Item
- item_view_model.dart   # Business logic and state
- home_screen.dart       # Shows list of items with search, edit, delete
- add_edit_screen.dart   # Form screen for creating/updating items
- main.dart

# State Management:
- Uses ChangeNotifier from the provider package.
- Automatically listens to changes and updates the UI.
- Separates logic from UI for better maintainability.  

# Features
- View list of items from REST API
- Create new item with form
- Update existing item
- Delete item with confirmation
- Search items
- Form validation and loading indicators
- Custom error messages and empty state handling
- MVVM-like code structure
- Figma-like theme (Material 3 ready)
- Toast/snackbar messages after actions

# Packages Used
- http: For REST API calls
- provider: For state management
- flutter/material.dart: Core UI components  
