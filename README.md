# 🍽️ Recipe Finder App

A modern and user-friendly Flutter application that integrates a public REST API to explore recipes from around the world. The app allows users to browse meals by category, filter by country, view detailed cooking instructions, and switch between light and dark themes.

This project was developed as part of an **Activity-Based Learning Assignment (ALA)** and demonstrates REST API integration, JSON parsing, and responsive UI design using Flutter.

---

## 📱 Features

* 🔄 **Real-Time Data** from TheMealDB REST API
* 🍲 **Browse Recipes by Category**
* 🌍 **Filter Recipes by Country (State/Area)**
* ⭐ **Popular & Latest Recipes Section**
* 📖 **Detailed Recipe Instructions and Ingredients**
* 🔍 **Category-Based Navigation**
* 🌗 **Light and Dark Mode Toggle**
* 📡 **Online Data Fetching with HTTP Requests**
* 📋 **JSON Parsing and Dynamic UI Rendering**
* 📱 **Responsive and User-Friendly Interface**

---

## 🛠️ Technologies Used

| Technology      | Description                                 |
| --------------- | ------------------------------------------- |
| Flutter         | Cross-platform mobile development framework |
| Dart            | Programming language used in Flutter        |
| REST API        | Fetches real-time recipe data               |
| TheMealDB API   | Source of meal and recipe data              |
| HTTP Package    | Handles API requests                        |
| Material Design | UI/UX design system                         |
| Git & GitHub    | Version control and repository hosting      |

---

## 🌐 API Information

**API Name:** TheMealDB
**Base URL:** https://www.themealdb.com/api.php

### Endpoints Used

| Feature            | Endpoint                                                     |
| ------------------ | ------------------------------------------------------------ |
| Latest Recipes     | https://www.themealdb.com/api/json/v1/1/latest.php           |
| Filter by Category | https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood |
| Filter by Area     | https://www.themealdb.com/api/json/v1/1/filter.php?a=Indian  |
| Meal Details       | https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772   |

---

## 📂 Project Structure

```
recipe_finder_app/
│── lib/
│   └── main.dart
│── pubspec.yaml
│── README.md
│── screenshots/
```

---

## 📸 Screenshots

<img width="1919" height="1079" alt="Screenshot 2026-04-16 093513" src="https://github.com/user-attachments/assets/3e08ad47-3a61-4843-9b92-308835b37b53" />
<img width="1917" height="1077" alt="Screenshot 2026-04-16 093507" src="https://github.com/user-attachments/assets/ba85409e-87c5-424b-8a77-4414e201edf4" />
<img width="1919" height="1079" alt="Screenshot 2026-04-16 093453" src="https://github.com/user-attachments/assets/b660b598-ec14-46a9-9379-5ce70ca06801" />
<img width="1919" height="1079" alt="Screenshot 2026-04-16 093443" src="https://github.com/user-attachments/assets/d5f5ed57-9b81-4273-a0ef-8360e9f8371a" />
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/1cc51a7d-896d-460d-a772-222b185d9463" />


---
## 📸 DRIVE link

https://drive.google.com/drive/folders/1dssqWVqPGVg21VnffpPoRztjAIW46JPe?usp=drive_link


## 🚀 Getting Started

### Prerequisites

* Flutter SDK installed
* Android Studio or Visual Studio Code
* Git installed
* Internet connection

---

### 📥 Installation Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/flutter-recipe-finder.git
   ```

2. **Navigate to the Project Directory**

   ```bash
   cd flutter-recipe-finder
   ```

3. **Install Dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the Application**

   ```bash
   flutter run
   ```

---

## 📦 Dependencies

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.1
```

---

## 🎯 Learning Outcomes

* Understanding RESTful API integration in Flutter
* Parsing and handling JSON data
* Designing responsive mobile applications
* Implementing navigation and dynamic UI
* Applying theme switching (Light/Dark Mode)
* Managing version control using GitHub
* Documenting projects professionally using Markdown

---

## 📊 App Functionality

| Selection          | Output                                         |
| ------------------ | ---------------------------------------------- |
| Category Selected  | Displays recipes from the chosen category      |
| Country Selected   | Displays recipes from the chosen country       |
| Category + Country | Displays filtered recipes                      |
| Latest Recipes     | Shows real-time popular meals                  |
| Recipe Selected    | Displays detailed ingredients and instructions |
| Theme Toggle       | Switches between Light and Dark Mode           |

---

## 🎓 Academic Submission Details

* **Course:** Flutter Mobile Application Development
* **Assignment:** Activity-Based Learning Assignment (ALA)
* **Type:** Individual Project
* **Submission:** GitHub Repository Link on GMIU Web Portal

---

## 👨‍💻 Author

**URSHIT SACHPARA**

🎓 En.No.– 20230905080002

📧 email= urshitpatel7@gmail.com
🔗 (https://github.com/urshitpatel/recipe_finder)

---

## 📜 License

This project is developed for educational purposes. It is free to use and modify for learning and academic submissions.

---

## ⭐ Acknowledgements

* TheMealDB API – https://www.themealdb.com
* Flutter Documentation – https://flutter.dev
* Dart Documentation – https://dart.dev
* Material Design – https://material.io

---

### 🌟 If you found this project helpful, please consider giving it a star on GitHub!
