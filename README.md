---  Attendance Management System ---

A web-based Attendance Management System designed to simplify and automate the process of student attendance tracking for schools and colleges. The system supports two roles — **Admin (Teacher)** and **Student** — with different permissions and features.

## 🚀 Features

### 👨‍🏫 Admin (Faculty)
- Secure login and dashboard
- Add, update, delete student records
- Mark student attendance
- View student attendance history
- Role-based access control

### 👨‍🎓 Student
- Register and log in
- View personal details
- Check attendance status
- Edit profile

## 🧰 Tech Stack

- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Backend**: Java, JSP, Servlets
- **Database**: MySQL
- **Architecture**: MVC (Model View Controller)

## 📁 Project Structure

```

attendance\_management\_system/
├── src/
│   ├── controller/
│   ├── dao/
│   ├── model/
│   └── util/
├── WebContent/
│   ├── css/
│   ├── js/
│   ├── jsp/
│   └── index.jsp
├── lib/
├── README.md
└── database.sql

````

## 🔐 Login Credentials (Demo)

- **Admin**
  - Username: `admin`
  - Password: `admin123`

- **Student**
  - Register via the student registration form

## 📸 Screenshots

<img width="1885" height="1079" alt="Screenshot 2025-07-30 114635" src="https://github.com/user-attachments/assets/5c42eac4-ef6e-48ed-86d8-63b73d100ea6" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124833" src="https://github.com/user-attachments/assets/1586d118-e171-4c9e-8374-73799cadf766" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124045" src="https://github.com/user-attachments/assets/5e74b081-5f88-4b45-b513-cf2f80b5d268" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124112" src="https://github.com/user-attachments/assets/d031e028-46a5-445d-a165-6e68940e691c" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124129" src="https://github.com/user-attachments/assets/c9cddbe4-04fb-44fc-9ea8-203cad5261e7" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124152" src="https://github.com/user-attachments/assets/ea6779b8-82bd-4563-bdb7-1cda6b789e6e" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124233" src="https://github.com/user-attachments/assets/b4022740-1039-403c-a0b5-685b22e6dd4c" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124255" src="https://github.com/user-attachments/assets/dcac2788-fbf3-495d-a5ba-66f1952e0d3b" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 125032" src="https://github.com/user-attachments/assets/9f0d1da3-dc29-4cfe-aa58-98ebf8da3db0" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124435" src="https://github.com/user-attachments/assets/ec90bc2c-820f-4006-89fe-cfaf2c14e47c" />
<img width="1920" height="1080" alt="Screenshot 2025-07-30 124522" src="https://github.com/user-attachments/assets/6a8d291f-620f-4c07-bc11-12920c14c6e2" />


## ⚙️ How to Run

1. Clone this repository
2. Import it into Eclipse/IntelliJ as a Dynamic Web Project
3. Configure MySQL database using the `database.sql` file
4. Update DB credentials in `DBConnection.java`
5. Deploy on Apache Tomcat server
6. Access via `http://localhost:8080/attendance_management_system`

## 🙌 Contribution

If you'd like to improve the UI or add new features (like email notifications or PDF exports), feel free to fork the repo and submit a pull request!

## 📃 License

This project is open-source and available under the [MIT License](LICENSE).

---

### 📌 Note:

This system does not use JSTL — it’s entirely built using Servlets, JSP, and JDBC for backend logic.

---


