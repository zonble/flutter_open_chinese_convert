## 0.7.0

- **BREAKING**: Updates minimum Flutter version requirement to 3.24.0.
- **BREAKING**: Sets minimum Android SDK version to 24 (Android 7.0).
- Supports Flutter 3.35.x with enhanced compatibility.
- Updates OpenCC version for improved conversion accuracy.
- Fixes Android build issues with Flutter 3.27+.
- Resolves gradle build compatibility issues.
- Updates flutter_lints from 5.0.0 to 6.0.0 for better code quality.
- Optimizes CI/CD pipeline by reducing Python version testing overhead.
- Improves dependency management and build processes.

## 0.6.0

- Supports Flutter 3.32.x.

## 0.5.1

- Adds a namespace for Gradle 8 compatibility.
- Enhances Android build system compatibility.

## 0.5.0

- Adds Swift Package Manager (SPM) support - now SPM ready.
- Enhances iOS development workflow with complete SPM integration.

## 0.4.0

- Fixes build compatibility with the latest iOS versions.
- Fixes build compatibility with the latest Android versions.
- Improves cross-platform stability and version compatibility.

## 0.3.3

- Supports Flutter 3.24.x with full compatibility.
- Extends Flutter version compatibility range.

## 0.3.0

- Supports Flutter 3.10.x with full compatibility.
- Provides major Flutter version upgrade support.
- Enhances stability across different Flutter versions.

## 0.2.1

- Updates format of the pubspec.yaml file to follow latest Flutter standards.
- Improves project configuration standards and package metadata organization.

## 0.2.0

- Enables creating native threads for text conversion operations.
- Provides significant performance improvements for concurrent operations.
- Enhances performance for large text processing tasks.
- Improves resource management for text conversion operations.

## 0.1.1

- Updates dependencies to latest secure versions.
- Improves overall security posture with dependency refresh.

## 0.1.0

- Initial release of flutter_open_chinese_convert.
- Integrates OpenCC (開放中文轉換) with Flutter projects.
- Supports comprehensive Chinese text conversion with 8 conversion modes:
  - S2T: Simplified Chinese → Traditional Chinese
  - T2S: Traditional Chinese → Simplified Chinese
  - S2HK: Simplified Chinese → Traditional Chinese (Hong Kong Standard)
  - HK2S: Traditional Chinese (Hong Kong Standard) → Simplified Chinese
  - S2TW: Simplified Chinese → Traditional Chinese (Taiwan Standard)
  - TW2S: Traditional Chinese (Taiwan Standard) → Simplified Chinese
  - S2TWp: Simplified Chinese → Traditional Chinese (Taiwan Standard) with Taiwanese idiom
  - TW2Sp: Traditional Chinese (Taiwan Standard) → Simplified Chinese with Mainland Chinese idiom
- Provides cross-platform support for iOS and Android.
- Offers simple API with `ChineseConverter.convert()` method.
- Implements Flutter plugin architecture for seamless integration.
