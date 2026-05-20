# Aura — E-Commerce Mobile Application

Aura is a full-stack e-commerce mobile application built with Flutter, 
following Clean Architecture principles across 25+ screens. Powered by a 
custom PHP/MySQL RESTful backend with 30+ API endpoints, the app supports 
three distinct user roles: customer, admin, and delivery agent.

## Features

### Authentication
- Email sign-up and login via REST API
- Secure token-based authentication

### Products & Browsing
- Product listing with categories and filtering
- Product detail pages with custom options
- Ratings and reviews system

### User Experience
- Wishlist / favourites
- Shopping cart
- Address management
- Coupon and discount support
- Push notifications (Firebase Cloud Messaging)

### Orders & Delivery
- Order placement and checkout flow
- Order history and status tracking
- Live delivery tracking with Google Maps, polylines, and real-time location updates

### Multi-Role System
- **Customer app** — browse, order, track
- **Admin app** — manage products, categories, and orders
- **Delivery app** — handle assigned orders and update delivery status

## Architecture

Aura follows the **MVC (Model-View-Controller)** pattern:

- **Model** — data classes, API response models, local storage
- **View** — Flutter screens and widgets
- **Controller** — GetX controllers handling state and business logic

State management is handled with **GetX**.


## Tech Stack

- Flutter / Dart
- GetX (state management)
- Clean Architecture
- PHP / MySQL (custom REST API backend)
- Firebase Cloud Messaging (push notifications)
- Google Maps + Geolocator + Geocoding (live delivery tracking)
- OpenStreetMap integration
- SQLite + SharedPreferences (local caching)
- QR Code scanning

## Backend

The backend is implemented as a separate PHP/MySQL REST API:  
https://github.com/alaawael-dev/ecommerce-backend

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Configure the API base URL in the environment config
4. Run on an emulator or physical device

## Purpose

Built as a portfolio project to demonstrate:

- Full frontend-backend integration with a custom REST API
- MVC architecture applied across a large-scale Flutter app
- Multi-role system across three separate app experiences
- Live delivery tracking with Google Maps and real-time location
- Firebase push notifications end to end
