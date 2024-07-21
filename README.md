
# E-commerce App

This is a Flutter-based E-commerce application that showcases a list of products fetched from a remote API. The app includes features such as product listing, product detail view, search functionality, sorting, filtering, and user authentication.

## Features

- **Homepage**: Displays a list of featured products with their images, names, prices, and ratings. Supports infinite scrolling to load additional products.
- **Product Detail Page**: Shows detailed information about a product including images, name, price, description, ratings, and reviews.
- **Product Search Functionality**: Allows users to search for products by typing the product name. Displays search results with product image, name, price, and rating.
- **User Authentication**: Implements login and logout functionality. Validates user registration details, including name, email, phone number, and password.
- **Product Sort Functionality**: Allows users to sort products by price, popularity, and rating. Implements filtering options for categories, price ranges, and ratings.
- **Cart Functionality**: Users can add and remove products from their cart. Displays the cart with a list of added products, quantities, and total price. Includes a checkout button to proceed to the checkout page.

## Getting Started

These instructions will help you set up and run the project on your local machine.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio: [Install Android Studio](https://developer.android.com/studio)
- A GitHub account to clone the repository

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/anshuman8503/ecommerce-app.git
   cd ecommerce-app
   ```

2. **Install dependencies**:
   ```sh
   flutter pub get
   ```

3. **Run the application**:
   - Connect your Android device via USB or start an Android emulator.
   - Run the app using the following command:
     ```sh
     flutter run
     ```

### Project Structure

```
lib/
├── main.dart
├── models/
│   ├── product.dart
│   └── user.dart
├── providers/
│   ├── auth_provider.dart
│   ├── product_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── product_detail_screen.dart
│   ├── login_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── search_delegate.dart
├── services/
│   └── api_service.dart
├── widgets/
│   ├── product_item.dart
│   └── cart_item.dart
├── utils/
│   └── constants.dart
```

### Usage

1. **Homepage**:
   - Displays a list of featured products.
   - Scroll down to load more products.

2. **Product Detail Page**:
   - Click on any product to view its details.

3. **Product Search**:
   - Use the search icon in the app bar to search for products by name.

4. **User Authentication**:
   - Login or register a new account using the login screen.

5. **Sorting and Filtering**:
   - Use the popup menu in the app bar to sort products by price or rating.
   - Implement filtering options to filter products by category, price range, and rating.

6. **Cart**:
   - Add products to the cart.
   - View the cart and proceed to checkout.

### API Used

- [Fake Store API](https://fakestoreapi.com/): Provides a set of dummy products for the app.

### Contributing

Feel free to submit pull requests or create issues to improve the app.

### Contact

If you have any questions or feedback, please reach out to [fitnesshub853@gmail.com].
