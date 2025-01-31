# Shopping App  
This is a simple Flutter shopping app showcasing products and hot offers.  

## Features  
- **App Bar**: Displays "Shopping App".  
- **Product Carousel**: Showcases product images.  
- **Product Grid**: Grid view for product display and cart addition.  
- **Hot Offers**: Scrollable list of featured products.  
- **Signup & Login Pages**: User registration and authentication with Firebase.  
- **Localization**: Supports Arabic and English using `easy_localization`.  

## Firebase Authentication  

### Setup  
1. **Firebase Integration**:  
   - Configure Firebase for your Flutter app.  
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).  

2. **Dependencies**:  
   ```yaml  
   dependencies:  
     firebase_core: ^latest_version  
     firebase_auth: ^latest_version

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
- Signup: Users register with email/password.

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

    

## Login Page
Login: Users log in with email/password.

## Animation with <flutter_animate>

The app incorporates smooth transition animations using the flutter_animate package for better user experience:

1. Fade-In and Shimmer on Navigation to Home Page:

- After the user successfully signs up, a dialog confirms their registration.

- Upon clicking "Continue," the signup page fades out, and the home page fades in with a shimmer effect.

## Assets  
---  
Make sure to include the necessary image assets in the assets directory:  
---

 ## Screenshots
| :---: | :---: | :---: |
| Login | Signup |

| ![Login](firebase%20screenshots/login.jpg) | ![signup](firebase%20screenshots/signup.jpg) | ![firebase_users](firebase%20screenshots/firebase_users.jpg) |
