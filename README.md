# 📱 Find Job Mobile

A modern Flutter mobile application for job searching and career opportunities.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## ✨ Features

- 🔐 **User Authentication** - Secure login and registration system
- 🔍 **Job Search** - Find job opportunities with advanced filters
- 📅 **Calendar Integration** - Track interviews and important dates with table_calendar
- 💼 **Job Management** - Save and manage your job applications
- 🎨 **Modern UI** - Beautiful and responsive design with custom fonts (DM Sans)
- 🌐 **Multi-platform** - Support for Android, iOS, Web, Windows, macOS, and Linux

## 🏗️ Architecture

This project follows a modular architecture with clean code principles:

```
lib/
├── app/
│   ├── main.dart              # Application entry point
│   └── config/
│       ├── app_router.dart    # Navigation configuration
│       ├── app_widget.dart    # Root widget
│       ├── route_path.dart    # Route definitions
│       └── service_locator.dart # Dependency injection
├── modules/
│   ├── auth/                  # Authentication module
│   └── setup/                 # Setup module
└── shared/
    ├── components/            # Reusable UI components
    ├── constants/             # App constants
    ├── data/                  # Data models and repositories
    ├── styles/                # Theme and styling
    └── utils/                 # Utility functions
```

## 🛠️ Tech Stack

### Core
- **Flutter** - UI framework
- **Dart** - Programming language

### State Management & Architecture
- **flutter_bloc** (^9.1.1) - State management using BLoC pattern
- **bloc** (^9.1.0) - Business logic component
- **get_it** (^8.2.0) - Service locator for dependency injection

### Navigation
- **go_router** (^16.2.5) - Declarative routing
- **auto_route** (^10.2.0) - Advanced routing solution

### UI & Design
- **flutter_screenutil** (^5.9.3) - Responsive UI adaptation
- **font_awesome_flutter** (^10.11.0) - Font Awesome icons
- **icons_plus** (^5.0.0) - Additional icon packs
- **asuka** (^2.2.1) - Elegant overlay/toast notifications
- **table_calendar** (^3.2.0) - Calendar widget

### Networking & API
- **dio** (^5.7.0) - HTTP client
- **retrofit** (^4.4.1) - Type-safe REST client
- **pretty_dio_logger** (^1.4.0) - Network logging

### Data Management
- **shared_preferences** (^2.3.3) - Local storage
- **json_annotation** (^4.9.0) - JSON serialization
- **freezed_annotation** (^2.4.4) - Code generation for data classes

### Utilities
- **intl** (^0.20.2) - Internationalization and localization
- **talker_flutter** (^5.0.2) - Advanced logging

### Development Tools
- **build_runner** (^2.4.13) - Code generation
- **retrofit_generator** (^9.1.4) - Retrofit code generation
- **json_serializable** (^6.8.0) - JSON serialization code generation
- **freezed** (^2.5.7) - Data class code generation
- **flutter_lints** (^5.0.0) - Linting rules

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>= 3.9.2)
- [Dart SDK](https://dart.dev/get-dart) (>= 3.9.2)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for mobile development)
- A code editor ([VS Code](https://code.visualstudio.com/) recommended)

## 🚀 Getting Started

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/CulesBao/find-job-mobile.git
   cd find-job-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for Retrofit, Freezed, JsonSerializable)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # For development
   flutter run
   
   # For specific platform
   flutter run -d chrome        # Web
   flutter run -d windows       # Windows
   flutter run -d macos         # macOS
   flutter run -d linux         # Linux
   ```

### Development Mode

Watch for file changes and auto-generate code:
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎨 Design System

The app uses a custom design system with:
- **Font Family**: DM Sans (Regular, Medium, Bold)
- **Responsive Design**: flutter_screenutil for adaptive layouts
- **Icons**: Font Awesome and custom icon sets

## 📁 Project Structure

```
find-job-mobile/
├── android/           # Android platform code
├── ios/              # iOS platform code
├── web/              # Web platform code
├── windows/          # Windows platform code
├── macos/            # macOS platform code
├── linux/            # Linux platform code
├── lib/              # Main application code
├── assets/           # Images, fonts, and other assets
│   ├── fonts/
│   └── images/
├── test/             # Unit and widget tests
├── pubspec.yaml      # Project dependencies
└── README.md         # This file
```

## 🧪 Testing

Run tests with:
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 🔧 Configuration

### Environment Setup

The app uses service locator pattern for dependency injection. Configure your services in:
```
lib/app/config/service_locator.dart
```

### API Configuration

Configure your API endpoints and networking in the appropriate data layer files.

## 📝 Code Generation

This project uses code generation for:
- **Retrofit**: REST API client generation
- **Freezed**: Immutable data classes
- **JsonSerializable**: JSON serialization/deserialization

After making changes to annotated classes, run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/amazing-feature`)
3. Commit your changes following [Conventional Commits](.github/copilot-instructions.md)
4. Push to the branch (`git push origin feat/amazing-feature`)
5. Open a Pull Request

### Commit Convention

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification. See [commit guidelines](.github/copilot-instructions.md) for details.

Example commit messages:
```bash
feat(auth): add login functionality
fix(ui): correct job card layout on mobile
docs: update README installation steps
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **CulesBao** - [GitHub Profile](https://github.com/CulesBao)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- All open-source contributors whose packages are used in this project

## 📞 Support

If you have any questions or need help, please:
- Open an issue on [GitHub](https://github.com/CulesBao/find-job-mobile/issues)
- Contact the maintainers

## 🗺️ Roadmap

- [ ] Implement job search filters
- [ ] Add user profile management
- [ ] Integrate real-time notifications
- [ ] Add dark mode support
- [ ] Implement offline mode
- [ ] Add unit and integration tests
- [ ] Multi-language support

---

**Made with ❤️ using Flutter**
