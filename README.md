# iOS Local Recommendations App

This project is an iOS web application designed to connect users with local places, focusing on delivering personalized recommendations rather than navigation. It utilizes the Foursquare API to fetch place information and aggregates reviews from multiple sources to provide users with comprehensive insights.

## Features

- **Local Recommendations**: Discover local places based on user preferences.
- **Place Details**: View detailed information about selected places, including aggregated reviews.
- **User Reviews**: Read individual reviews from various sources to make informed decisions.

## Project Structure

- **src**: Contains the main application code.
  - **App.swift**: Entry point of the application.
  - **Views**: Contains the UI components.
    - **HomeView.swift**: Displays a list of local places.
    - **PlaceDetailView.swift**: Shows detailed information about a selected place.
    - **Components**: Reusable UI components.
      - **ReviewCard.swift**: Displays individual reviews.
      - **PlaceCard.swift**: Represents a place in the list view.
  - **Models**: Data models for the application.
    - **Place.swift**: Represents a local place.
    - **Review.swift**: Represents a user review.
  - **Services**: Handles API interactions and data aggregation.
    - **FoursquareService.swift**: Fetches data from the Foursquare API.
    - **ReviewAggregatorService.swift**: Aggregates reviews from multiple sources.
  - **Utils**: Utility functions and constants.
    - **Constants.swift**: Defines constants used throughout the application.

- **Assets**: Contains color, image, and font assets used in the application.
- **Config**: Configuration files.
  - **.env.local**: Environment variables, including sensitive information.
  - **Secrets.swift**: Manages sensitive data and configurations securely.
  
- **Tests**: Contains unit tests for services and views.
  - **ServicesTests**: Tests for service classes.
  - **ViewsTests**: Tests for view components.

- **Package.swift**: Configuration file for Swift Package Manager.
- **.gitignore**: Specifies files and directories to ignore in version control.

## Setup Instructions

1. Clone the repository.
2. Navigate to the project directory.
3. Install dependencies using Swift Package Manager.
4. Set up your environment variables in the `.env.local` file.
5. Run the application on your iOS device or simulator.

## Security

Ensure that sensitive information, such as API keys, is stored securely and not exposed in the codebase. Use the `Secrets.swift` file to manage sensitive configurations.

## Contribution

Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.