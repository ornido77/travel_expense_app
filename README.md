# Travel Expense App

A Flutter mini travel expense application demonstrating clean architecture, functional error handling, Riverpod state management, and REST API integration.

## Features

* Mock authentication using REST API
* View travel expenses
* View expense details
* Add a new expense
* Form validation for amount, date, category, and note
* Pull-to-refresh expense list
* Loading, error, and empty states
* Functional error handling using `Either`
* Mock REST API using `json-server`

## Tech Stack

* Flutter / Dart
* Riverpod with code generation
* Freezed + JSON Serializable
* `fpdart`
* `get_it`
* `go_router`
* `json-server`
* Clean Architecture

## Running the Project

### 1. Install Flutter dependencies

From the Flutter project root:

```bash
flutter pub get
```

Generate the required files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 2. Start the mock API

Open a separate terminal and navigate to the mock API directory:

```bash
cd mock_api
npm install
npm start
```

The mock API runs on port `3000` and listens on all network interfaces:

```text
http://0.0.0.0:3000
```

### 3. Configure the API URL

The application uses a configurable API base URL defined in:

```text
lib/core/constants/api_constants.dart
```

The default configuration is:

```text
http://localhost:3000
```

Choose the appropriate URL depending on where the Flutter application is running.

#### Android Emulator

Use:

```text
http://10.0.2.2:3000
```

`10.0.2.2` maps the Android emulator to the host machine's localhost.

#### iOS Simulator

Use:

```text
http://localhost:3000
```

The iOS simulator can access services running on the development machine through `localhost`.

#### Physical Android/iOS Device

The device and computer running `json-server` must be connected to the same local network.

Find the computer's local IP address.

For example:

```text
192.168.1.100
```

Then update the API base URL to:

```text
http://192.168.1.100:3000
```

Make sure `json-server` is running with:

```bash
json-server db.json --host 0.0.0.0 --port 3000
```

and that the computer's firewall allows connections to port `3000`.

### 4. Run the Flutter application

From the Flutter project root:

```bash
flutter run
```

### Demo Credentials

```text
Email: user1@test.com
Password: pass123

Email: user2@test.com
Password: pass123

Email: user3@test.com
Password: pass123
```

## Architecture

The application follows Clean Architecture with three main layers:

```text
Presentation
     ↓
Domain
     ↓
Data
     ↓
REST API
```

### Key Architectural Decisions

**1. Clean Architecture**

The application separates presentation, domain, and data responsibilities. Domain use cases depend on repository abstractions rather than concrete data sources, making business logic easier to test and maintain.

**2. Riverpod with Code Generation**

Riverpod Notifiers manage application state while keeping UI widgets focused on presentation. Code generation provides strongly typed providers and avoids the legacy Provider API.

**3. Functional Error Handling**

Repositories return:

```text
Either<Failure, T>
```

instead of exposing infrastructure exceptions to the presentation layer. Exceptions are converted into domain-level failures at the repository boundary, allowing the UI to handle errors consistently through Riverpod's `AsyncValue`.

## Assumptions

* Expenses belong to the currently authenticated user and are retrieved using the user's ID.
* The expense detail screen is read-only because the specification requires viewing expense details but does not specify an edit-expense feature.
* Notes are optional free-text input.
* Amounts must be greater than zero.
* Dates are selected through a date picker.
* The application uses Philippine Peso (`₱`) for displaying expense amounts.

## Testing

Run all tests with:

```bash
flutter test
```

The test suite includes coverage for domain and data behavior, including repository error handling.

## Building the APK

Generate a release APK with:

```bash
flutter build apk --release
```

The generated APK can be found at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### APK and Mock API Note

The provided APK is built using the local mock API configuration. If the APK is installed on another physical device, `localhost` refers to that device rather than the computer running `json-server`.

To run the APK against a local `json-server`, configure the API base URL to use the host computer's local network IP address as described above.
