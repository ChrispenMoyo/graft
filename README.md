# GRAFT - Zimbabwe's Hyperlocal Services Marketplace

## What is GRAFT?

GRAFT is a Zimbabwean hyperlocal services marketplace that connects customers who need work done with local workers who have the skills to do it.

The word "graft" is Zimbabwean slang for **work / a job**. It's also a local app for finding workers and getting jobs done.

### Who can use GRAFT?

**Customers**: People who need small jobs done around their home or business:
- Gardening, grass cutting
- Cleaning
- Plumbing, electrical work
- Painting
- Moving assistance
- Handyman work
- Errands
- Small repairs

**Workers**: Unemployed, informal, freelance, or independent workers who want to find nearby jobs and earn money from their skills.

## Technology

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider pattern (lightweight)
- **Routing**: Material Router
- **Target**: Android-first, mobile-first, iOS-ready

## Running Locally

```bash
# Get dependencies
flutter pub get

# Run the application
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze

# Build debug APK
flutter build apk --debug
```

## Configuration

The application uses the following configuration:

| Variable | Default | Description |
|------------|---------|-------------|
| `API_BASE_URL` | `https://api.graft.co.zw/v1` | Backend API endpoint |
| `ENVIRONMENT` | `development` | Environment variable |

## Project Structure

```
lib/
├── app/                  # Main application widget
│   ├── app.dart
│   ├── config/
│   └── router/
├── core/                 # Core utilities
│   ├── constants/
│   ├── extensions/
│   ├── utils/
│   └── widgets/
├── features/             # Feature modules
│   ├── auth/
│   ├── home/
│   ├── jobs/
│   ├── profile/
│   └── onboarding/
├── models/               # Domain models
│   ├── enums/
│   └── index.dart
└── main.dart
```

## Current MVP Status (Batch 1)

This is the foundation for Batch 1 of the GRAFT MVP:

✅ **Completed**:
- Flutter project structure with clean architecture
- Core models (User, Job, Location, JobCategory, Payment)
- User roles (Customer, Worker, Admin)
- Verification status enum (KYC foundation)
- Zimbabwe-specific constants (currency, phone codes)
- Core UI widgets (Loading, Error, Empty states)
- Initial screens (Onboarding, Login, Home)
- Basic tests for models and enums
- GRAFT branding and theme
- Responsive UI for mobile devices

## Deferred Functionality

The following are intentionally **NOT** implemented yet (Batch 2+):

- Full authentication with OTP
- KYC document processing
- Live GPS tracking
- Real-time worker matching
- Production map integration
- Job bidding system
- In-app chat
- Push notifications
- Live EcoCash payments
- Payment settlement
- Ratings/reviews
- Worker earnings system
- Admin dashboard
- Fraud detection
- Advanced search
- Production analytics

## Environment Variables

Copy `.env.example` to `.env` and update values as needed:

```
API_BASE_URL=https://api.graft.co.zw/v1
ENVIRONMENT=development
```

## Contributing

This project follows the GRAFT architecture guidelines. Please ensure:
1. Code follows Dart/Flutter best practices
2. Tests pass before committing
3. Architecture remains clean and maintainable
4. Zimbabwe-specific requirements are respected

## License

This project is proprietary to GRAFT.