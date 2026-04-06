# Fitbit Tracking App

A Flutter application for visualizing and tracking health data from Fitbit devices. This app provides users with an intuitive interface to monitor their daily fitness metrics including heart rate, step count, and sleep patterns.

## Features

- **Heart Rate Monitoring**: Real-time visualization of heart rate data with interactive charts
- **Step Tracking**: Daily step count statistics and analysis using staggered grid layouts
- **Sleep Analysis**: Track and analyze sleep patterns and quality
- **User Profile**: Manage personal health profile information
- **Navigation Drawer**: Seamless navigation between different health metrics
- **Data Visualization**: Charts powered by `charts_flutter` for comprehensive health insights
- **Responsive UI**: Material Design with adaptive layout components

## Technical Stack

- **Framework**: Flutter
- **Language**: Dart
- **UI Components**: 
  - Material Design widgets
  - Flutter Staggered Grid View for dynamic layouts
  - Charts Flutter for data visualization
- **Architecture**: MVVM with FutureBuilder for asynchronous data loading
- **Data Management**: JSON-based local data repository

## Project Structure

```
FitbitTrackingApp/
├── main.dart                 # Application entry point & main dashboard
├── heart_rate.dart          # Heart rate monitoring screen
├── steps.dart               # Step tracking screen
├── sleep.dart               # Sleep analysis screen
├── profile.dart             # User profile management
├── main_drawer.dart         # Navigation drawer component
├── pubspec.yaml             # Project dependencies
└── data_repo/              # Local data storage
    ├── heartrate.json      # Heart rate data
    ├── steps.json          # Steps data
    ├── sleep.json          # Sleep data
    └── profile.json        # Profile information
```

## Getting Started

### Prerequisites

- Flutter SDK (>=2.7.0)
- Dart SDK
- A code editor (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/sfragkiadakhs/FitbitTrackingApp.git
cd FitbitTrackingApp
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Key Implementation Details

### State Management
- Uses `StatefulWidget` for managing screen states
- `FutureBuilder` for asynchronous JSON data loading
- Real-time widget rebuilding on data changes

### Data Loading
- Assets loaded from local JSON files in `data_repo/` directory
- Efficient future-based loading for improved performance
- JSON parsing using Dart's `json.decode()`

### UI/UX Highlights
- Material Design implementation with custom theming
- Staggered grid layout for optimal mobile responsiveness
- Interactive navigation with smooth route transitions
- Elevation and shadow effects for modern aesthetics

## Dependencies

- **charts_flutter**: ^0.9.0 - Data visualization
- **flutter_staggered_grid_view**: ^0.3.2 - Responsive grid layouts
- **cupertino_icons**: ^1.0.0 - iOS-style icons

## Development Highlights

This project demonstrates proficiency in:
- ✅ Flutter/Dart mobile development
- ✅ State management and widget lifecycle
- ✅ Asynchronous programming with Futures
- ✅ JSON data parsing and handling
- ✅ UI/UX design with Material Design
- ✅ Navigation and routing in Flutter
- ✅ Data visualization and charts integration

## Future Enhancements

- Integration with real Fitbit API
- Cloud data synchronization
- Advanced analytics and trending
- Push notifications for health goals
- Offline data persistence with local database

## License

This project is private. For inquiries, please contact the project owner.

---

**Author**: sfragkiadakhs  
**Repository**: [FitbitTrackingApp](https://github.com/sfragkiadakhs/FitbitTrackingApp)
