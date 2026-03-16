# Dynamic Contact App 🪪✨

A feature-rich Contact Management application built with Flutter. This project showcases the transition from static UI to interactive applications, handling user input, media files, and implementing scalable state management.

## 🎯 Key Technical Milestones

* **📸 Advanced Media Handling:** Integrated the `image_picker` package to allow users to select profile pictures directly from their gallery, handling local `File` paths effectively.
* **🎬 Interactive Animations:** Enhanced the User Experience (UX) by integrating `Lottie` animations to provide visual feedback when the contact list is empty.
* **📐 Modern Grid Layout:** Utilized `GridView.builder` with a custom `SliverGridDelegate` to create a responsive and organized 2-column display for contact cards.
* **📥 Seamless User Input:** Implemented a `ModalBottomSheet` for adding new contacts, featuring real-time preview of user data using `TextEditingControllers`.

* **⚙️ Scalable State Management (Provider):** Migrated from local `setState` to the `provider` package. Centralized the business logic within a `ChangeNotifier` to completely decouple data management from the UI.
* **⚡ Performance Optimization:** Refactored the main screen to a `StatelessWidget` and utilized `Consumer` widgets. This prevents expensive full-screen rebuilds, ensuring only specific UI components update when the state changes.
* **🎨 Sophisticated UI Design:** - Used `Gradients` and `ClipRRect` for polished visuals.
  - Implemented a detailed `ContactInfo` screen with `extendBodyBehindAppBar` for a modern, immersive look.

## 🛠️ Tech Stack & Packages Used
* **UI Framework:** Flutter (Material Design).
* **State Management:** `provider`.
* **Animations:** `lottie`.
* **Media:** `image_picker`.
* **Icons:** `font_awesome_flutter` & `cupertino_icons`.
* **Layouts:** `GridView`, `Stack`, `Positioned`, `ModalBottomSheet`.

## 🚀 How to Run
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run`.