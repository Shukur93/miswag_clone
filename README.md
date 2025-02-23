# Miswag Clone - By Shukur

A pixel-perfect clone with GetX state management, local data, and core e-commerce features.

## Features

- **GetX State Management**: Controllers for cart, favorites, and UI state
- **Cart System**: Add/remove items, quantity control, total calculation
- **Favorites**: Save/remove favorite products with persistence
- **Local Data**: Product catalog loaded from local JSON files
- **Animations**: Custom page transitions and UI interactions
- **Multi-tab Layout**: Organized "More" screen with multiple sections

## Project Architecture

lib/
├── models/ # Data models (Product, User, CartItem)
├── lib/core/controllers/ # # GetX controllers
├── screens/ # App screens (Home, Items, Cart .. etc)
├── lib/core/data/ # Local Data services (load dummy Data)
├── lib/core/utils/ # Constants, helpers, routes and widgets
├── widgets/ # Reusable components (ProductCard, AppBar)
└── main.dart # App entry point
