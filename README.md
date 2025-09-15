# 📱 Bosta iOS Task

This project is a clean and well-structured iOS application built as part of a technical task for **Bosta**.  
It demonstrates modern iOS development practices using **UIKit**, **MVVM**, **Combine**, and **Moya**, with clean architecture and a focus on maintainability.  

---

Uploading Simulator Screen Recording - iPhone 16 Pro - 2025-09-15 at 19.03.40.mp4…

---

## 🚀 Features

### Profile Screen
- Displays user information (**name & address**) at the top.  
- Lists all user albums fetched from the `/albums` endpoint using `userId`.  

### Album Details Screen
- Shows photos from a selected album in an **Instagram-like grid layout**.  
- Supports **searching** photos by title in real-time using **Combine**.  
- Smooth navigation from albums to photos.  

### Bonus Feature
- Open photos in a **full-screen viewer** with zooming and sharing support.  

---

## 🛠 Tech Stack

- **Swift 5.5**  
- **UIKit** – UI implementation  
- **MVVM** – Clean architecture & separation of concerns  
- **Combine** – Reactive bindings and state management  
- **Moya** – Networking abstraction  
- **Kingfisher** – Efficient image downloading & caching  
- **Swift Package Manager (SPM)** – Dependency management  

---

## 📡 API Endpoints

Data is powered by [JSONPlaceholder](https://jsonplaceholder.typicode.com):  

- **Users** → `/users`  
- **Albums** → `/albums?userId={id}`  
- **Photos** → `/photos?albumId={id}`  

---

## 💡 Key Highlights

- Clean, modular, and well-structured codebase.  
- Uses **DiffableDataSource** for smooth UI updates.  
- Search bar integrated seamlessly without reloading headers.  
- Follows **best practices in MVVM & Combine** for reactive flows.  

---

## 🙌 Feedback

I’ll be happy to hear your feedback and suggestions for improvements.  
Feel free to open an issue or share your thoughts!  
