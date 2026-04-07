<div align="center">
  <img src="assets/images/ic_logo.png" alt="BD Stock Trend Logo" width="120"/>
  
  # BD Stock Trend 📈
  
  **A comprehensive Bangladesh Stock Market tracking application**
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.10+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![License](https://img.shields.io/badge/License-Proprietary-red?style=for-the-badge)](LICENSE)
  
</div>

---

## 📖 Overview

BD Stock Trend is a feature-rich mobile application designed for tracking Bangladesh's stock market, including the **Dhaka Stock Exchange (DSE)**. The app provides real-time market data, company insights, and trend analysis to help investors make informed decisions.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📊 **Dashboard** | Real-time market overview with key indicators and trends |
| 🏢 **Company Listings** | Browse and search listed companies with detailed information |
| 📈 **Company Details** | In-depth company analysis with charts and historical data |
| 🔐 **Authentication** | Secure login and registration system |
| 💳 **Payment Integration** | SSLCommerz payment gateway integration |
| ⚙️ **Settings** | User profile management and app preferences |
| 🌍 **Localization** | Multi-language support (English and more) |
| 🌙 **Dark Theme** | Eye-friendly dark mode interface |

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles with a feature-first approach:

```
lib/
├── core/               # Core modules (API, routing, resources, widgets)
│   ├── api/           # Dio client and API configurations
│   ├── resources/     # Colors, dimensions, styles, images
│   ├── widgets/       # Reusable UI components
│   └── localization/  # i18n support
├── features/          # Feature modules
│   ├── auth/          # Authentication (login, register)
│   ├── dashboard/     # Market dashboard & DSE data
│   ├── companies/     # Company listings & details
│   └── settings/      # User settings & preferences
├── common/            # Shared models and widgets
└── utils/             # Extensions, helpers, services
```

### Feature Structure
Each feature follows a layered architecture:
```
feature/
├── data/              # Data sources, repositories implementation
├── domain/            # Entities, repository interfaces, use cases
└── pages/             # UI screens and state management (BLoC/Cubit)
```

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| **Framework** | Flutter 3.10+ |
| **Language** | Dart 3.0+ |
| **State Management** | flutter_bloc (BLoC/Cubit) |
| **Dependency Injection** | get_it |
| **Routing** | go_router |
| **Network** | Dio |
| **Local Storage** | Hive |
| **Charts** | fl_chart |
| **Code Generation** | Freezed, JSON Serializable, Build Runner |
| **Payment** | SSLCommerz |
| **Testing** | flutter_test, bloc_test, mockito |
| **E2E Testing** | Maestro |

---

## 📐 Prerequisites

| Technology | Recommended Version | Installation Guide |
|------------|--------------------|--------------------|
| Flutter | 3.10.x or higher | [Flutter Docs](https://flutter.dev/docs/get-started/install) |
| Dart | 3.0.x or higher | Included with Flutter |
| Android Studio / VS Code | Latest | [Android Studio](https://developer.android.com/studio) / [VS Code](https://code.visualstudio.com/) |

---

## 🚀 Getting Started

### Step 1: Clone the Repository
```bash
git clone <repository-url>
cd bdstocktrend-app
```

### Step 2: Verify Flutter Installation
Ensure Flutter is properly installed and configured:
```bash
flutter doctor
```
Make sure all required components show ✓ (checkmarks).

### Step 3: Install Dependencies
```bash
flutter pub get
```

### Step 4: Generate Required Files

**4.1 Generate Localization files:**
```bash
flutter gen-l10n
```

**4.2 Generate Freezed & JSON serialization files:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> 💡 **Tip:** Use `flutter pub run build_runner watch` during development to auto-generate files on changes.

### Step 5: Environment Setup

Create environment configuration files in the project root:

**For Staging** - Create `.env.stg.json`:
```json
{
  "ENV": "staging",
  "BASE_URL": "https://your-staging-api.com/api"
}
```

**For Production** - Create `.env.prd.json`:
```json
{
  "ENV": "production",
  "BASE_URL": "https://your-production-api.com/api"
}
```

### Step 6: Connect a Device or Emulator

**Option A: Physical Device**
1. Enable Developer Options on your Android/iOS device
2. Enable USB Debugging (Android) or trust the computer (iOS)
3. Connect via USB cable
4. Verify connection:
   ```bash
   flutter devices
   ```

**Option B: Android Emulator**
1. Open Android Studio → Virtual Device Manager
2. Create/Start an emulator
3. Verify it appears in:
   ```bash
   flutter devices
   ```

**Option C: iOS Simulator (macOS only)**
```bash
open -a Simulator
```

### Step 7: Run the Application

**🔧 Run in Staging Mode (Development):**
```bash
flutter run --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json
```

**🚀 Run in Production Mode:**
```bash
flutter run --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json
```

**📱 Run on a Specific Device:**
```bash
# List available devices
flutter devices

# Run on specific device
flutter run --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json -d <device-id>
```

**🐛 Run in Debug Mode with Hot Reload:**
```bash
flutter run --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json --debug
```
- Press `r` for hot reload
- Press `R` for hot restart
- Press `q` to quit

---

## 📦 Build the Application

### Build APK (Android)

**Debug APK:**
```bash
flutter build apk --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json --debug
```

**Release APK:**
```bash
flutter build apk --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json --release
```

**App Bundle (for Play Store):**
```bash
flutter build appbundle --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json --release
```

> 📍 APK Location: `build/app/outputs/flutter-apk/`

### Build iOS (macOS only)

**iOS Build:**
```bash
flutter build ios --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json --release
```

> ⚠️ Requires Xcode and valid Apple Developer certificates for release builds.

---

## 📝 Development Commands

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install dependencies |
| `flutter gen-l10n` | Generate localization files |
| `flutter pub run build_runner build --delete-conflicting-outputs` | Generate Freezed/JSON models |
| `flutter pub run build_runner watch` | Watch mode for code generation |
| `dart run flutter_launcher_icons` | Generate launcher icons |
| `flutter test` | Run unit tests |
| `flutter analyze` | Run static analysis |

---

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Generate Mock Classes
```bash
dart pub run build_runner build
```

### E2E Tests (Maestro)
Maestro test flows are located in `maestro-stg/`:
- `login.yaml` - Login flow
- `register.yaml` - Registration flow
- `dashboard.yaml` - Dashboard interactions
- `settings.yaml` - Settings navigation
- `logout.yaml` - Logout flow

---

## 📱 Build Flavors

The app supports multiple build flavors:

| Flavor | Environment | Purpose |
|--------|-------------|---------|
| `stg` | Staging | Development and testing |
| `prd` | Production | Live production release |

### Generate Launcher Icons
```bash
dart run flutter_launcher_icons
```

### Generate Native Splash
```bash
dart run flutter_native_splash:create
```

---

## 📂 Project Structure

```
bdstocktrend-app/
├── android/                 # Android platform code
├── ios/                     # iOS platform code
├── lib/                     # Dart source code
├── assets/                  # Images, fonts, static files
├── test/                    # Unit and widget tests
├── maestro-stg/             # E2E test flows
├── plugins/                 # Custom plugins (SSLCommerz)
├── pubspec.yaml             # Project dependencies
├── analysis_options.yaml    # Linter configuration
├── l10n.yaml                # Localization config
└── build.yaml               # Build runner config
```

---

## 🎨 Design System

- **Typography:** Poppins font family (100-900 weights)
- **Theme:** Dark mode by default
- **Responsive:** ScreenUtil for adaptive UI
- **Design Size:** 375 x 667 (iPhone SE baseline)

---

## 🔒 Security

- Secure authentication flow with token management
- Local data encryption with Hive
- Environment-based configuration
- SSL/TLS for all API communications

---

## 📄 License

This project is proprietary software. All rights reserved.

---

## 👥 Contributors

<div align="center">
  
  **Developed with ❤️ for Bangladesh's Stock Market Community**
  
</div>

---

<div align="center">
  <sub>Built with Flutter 💙</sub>
</div>