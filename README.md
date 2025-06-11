
# 📝 Note App – Flutter + PHP REST API

A full-stack **note-taking mobile application** developed using **Flutter** for the frontend and **PHP + MySQL** for the backend, connected via custom-built RESTful APIs. The app supports user authentication, image uploads, and cloud-based note storage.

![Made with Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue?logo=flutter)
![Backend](https://img.shields.io/badge/Backend-PHP%2FMySQL-lightgrey)
![API](https://img.shields.io/badge/REST%20API-Custom-brightgreen)

---

## ✨ Features

🔐 **User Authentication (Login & Signup)**  
Secure login and registration system with backend validation and `SharedPreferences` for session storage.

📝 **Create, Update, and Delete Notes**  
Easily add, modify, or remove personal notes.

🖼️ **Image Upload Support**  
Each note can include an image uploaded to the server via API.

📤 **View All Notes (Cloud Sync)**  
Notes are stored in MySQL and fetched via REST APIs.

🗂️ **Modular Structure**  
Separate modules for auth, notes, and components in both Flutter and PHP.

🌐 **REST API Endpoints**
- `auth/signup.php`
- `auth/login.php`
- `notes/view.php`
- `notes/add.php`
- `notes/update.php`
- `notes/delete.php`

---

## 🧰 Technologies Used

- **Frontend:** Flutter (Dart)  
- **Backend:** PHP (raw)  
- **Database:** MySQL  
- **Storage:** SharedPreferences (Flutter), Local uploads (PHP)  
- **State Management:** setState  
- **Libraries:** awesome_dialog, shared_preferences

---

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kuteybeAllito1/note_App_ApiPhp
   cd note_App_ApiPhp
   ```

2. **Set up the backend:**
   - Import the SQL file to your MySQL server.
   - Update the database credentials in the PHP config file (`db.php` or similar).

3. **Run the Flutter App:**
   ```bash
   flutter pub get
   flutter run
   ```

4. **Test APIs (optional):**
   Use Postman to test the API endpoints.

---

📌 This app is designed as a learning project to demonstrate full-stack mobile development using Flutter and PHP.  
Contributions and feedback are welcome!
