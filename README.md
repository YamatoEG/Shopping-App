# Shopping App
This is a simple Flutter shopping app showcasing a list of products and hot offers.  
New versions' first task added in the `first-version` branch. Subsequent branches: Additional features (e.g., signup page and others).

## Features  

- **App Bar**: Displays the title "Shopping App".  
- **Product Carousel**: A page view to showcase product images.  
- **Product Grid**: A grid view displaying products with an option to add items to the cart.  
- **Hot Offers**: A horizontally scrollable list of featured product images.
- **Signup Page**: A user registration form to create a new account.
- **Localization**: Support for Arabic and English languages using the `easy_localization` package.

## Localization (New Feature)
The app now supports multiple languages (Arabic and English) to provide a localized experience for users.

### Implementation
- Added the `easy_localization` package to the project.
- Created translation files in JSON format for Arabic (`ar.json`) and English (`en.json`).
- Updated the `MaterialApp` widget to use `EasyLocalization` for dynamic language switching.
- Users can switch between Arabic and English through a language selector.

### How to Add Translations
1. Add your localized strings in `assets/translations/en.json` and `assets/translations/ar.json`.
2. Wrap the app in `EasyLocalization` in the `main.dart` file:
   ```dart
   void main() {
     runApp(
       EasyLocalization(
         supportedLocales: [Locale('en'), Locale('ar')],
         path: 'assets/translations', // Translation files location
         fallbackLocale: Locale('en'),
         child: MyApp(),
       ),
     );
   }
   ```
3. Use `tr()` to fetch translations in the app:
   ```dart
   Text('welcome_message'.tr());
   ```

## Signup Page
The Signup Page allows users to register with the following features:

* Full Name:
    - Validates that the first character is capitalized.
* Email Address:
    - Ensures the input contains a valid email format (@ is required).
* Password:
    - Enforces a minimum length of 6 characters.
* Confirm Password:
    - Ensures it matches the entered password.
* Welcome Dialog:
    - Displays a success message with the user's name after signup.
* Navigation:
    - Redirects the user to the home page after successful signup.

## Animation with <flutter_animate>

The app incorporates smooth transition animations using the flutter_animate package for better user experience:

1. Fade-In and Shimmer on Navigation to Home Page:

- After the user successfully signs up, a dialog confirms their registration.

- Upon clicking "Continue," the signup page fades out, and the home page fades in with a shimmer effect.

## Assets  
---  
Make sure to include the necessary image assets in the assets directory:  
---
- prod1.png
- prod2.png
- prod3.webp
- pro1.png
- pro2.png
- pro3.png
- signup.png

