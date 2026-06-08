# Lotto Number Picker

A multi-platform lottery number generator and picker application built with modern cross-platform technologies.

## Overview

Lotto Number Picker is a sophisticated application designed to help users generate, select, and analyze lottery numbers across multiple platforms. The project is built with a diverse technology stack including C++, Dart, Swift, and CMake, ensuring robust performance and native experiences on various devices.

**Live Demo:** [https://lotto-number-picker-hn4d-asa-mastersons-projects.vercel.app](https://lotto-number-picker-hn4d-asa-mastersons-projects.vercel.app)

## Technology Stack

- **C++ (39.3%)** - Core lottery number generation algorithms and mathematical computations
- **CMake (32.2%)** - Build system configuration for C++ components
- **Dart (20.9%)** - Cross-platform UI with Flutter framework
- **Swift (3%)** - Native iOS integration and platform-specific features
- **C (2.3%)** - Low-level utility functions and system interfaces
- **HTML (2%)** - Web interface components
- **Other (0.3%)** - Miscellaneous resources and configuration files

## Features

- **Multi-Platform Support** - Desktop, mobile (iOS/Android), and web applications
- **Advanced Number Generation** - Sophisticated algorithms for lottery number picking
- **Cross-Platform UI** - Built with Flutter/Dart for consistent experience across devices
- **Native Performance** - C++ core for optimal computational performance
- **Web Interface** - Accessible through modern web browsers

## Project Structure

```
Lotto-Number-Picker/
├── C++/CMake Components    # Core lottery algorithms
├── Dart/Flutter App        # Cross-platform UI layer
├── Swift Files            # iOS native enhancements
├── Web Components         # Browser-based interface
└── Configuration Files    # Build and project setup
```

## Getting Started

### Prerequisites

- **For Desktop/Mobile:** Flutter SDK ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **For C++ Components:** CMake 3.10+ and a C++ compiler
- **For Web:** Modern web browser with JavaScript support

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/asa-masterson/Lotto-Number-Picker.git
   cd Lotto-Number-Picker
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Build C++ components** (if needed)
   ```bash
   mkdir build && cd build
   cmake ..
   make
   ```

### Running the Application

**Flutter App (Mobile/Desktop):**
```bash
flutter run
```

**Web Version:**
```bash
flutter run -d chrome
```

**iOS (if on macOS):**
```bash
flutter run -d ios
```

## Development

### Building from Source

```bash
# Get dependencies
flutter pub get

# Build for specific platform
flutter build apk          # Android
flutter build ios          # iOS
flutter build windows      # Windows
flutter build linux        # Linux
flutter build web          # Web
```

### Running Tests

```bash
flutter test
```

### Code Structure

- Dart/Flutter components handle the user interface and cross-platform logic
- C++ modules provide high-performance lottery number generation algorithms
- Native Swift code enhances iOS-specific functionality

## Usage

1. Launch the application on your preferred platform
2. Configure lottery parameters (number range, quantity, etc.)
3. Generate lottery numbers using advanced algorithms
4. View results and statistics
5. Share or export your generated numbers

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is currently not licensed. Please check with the repository owner before using this code in your own projects.

## Repository Info

- **Repository:** [asa-masterson/Lotto-Number-Picker](https://github.com/asa-masterson/Lotto-Number-Picker)
- **Default Branch:** `master`
- **Created:** December 2, 2025
- **Last Updated:** December 3, 2025

## Author

[asa-masterson](https://github.com/asa-masterson)

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [C++ Reference](https://cppreference.com)
- [CMake Documentation](https://cmake.org/documentation/)

## Support

For issues, questions, or suggestions, please open an [issue](https://github.com/asa-masterson/Lotto-Number-Picker/issues) on GitHub.

---

**Note:** The default branch for this repository is `master`.
