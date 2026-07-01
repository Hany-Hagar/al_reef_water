// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: 'Title for the login screen',
      args: [],
    );
  }

  /// `Welcome back! Please login to your account.`
  String get loginSubtitle {
    return Intl.message(
      'Welcome back! Please login to your account.',
      name: 'loginSubtitle',
      desc: 'Subtitle for the login screen',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: 'Label for the email address field',
      args: [],
    );
  }

  /// `Enter your email address`
  String get emailAddressHint {
    return Intl.message(
      'Enter your email address',
      name: 'emailAddressHint',
      desc: 'Hint text for the email address field',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Label for the password field',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: 'Hint text for the password field',
      args: [],
    );
  }

  /// `Did you forget your password?`
  String get didyouForgetPassword {
    return Intl.message(
      'Did you forget your password?',
      name: 'didyouForgetPassword',
      desc: 'Text for the forgot password option in the login screen',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: 'Text for the login button',
      args: [],
    );
  }

  /// `Or login with`
  String get orLoginWith {
    return Intl.message(
      'Or login with',
      name: 'orLoginWith',
      desc: 'Text for the alternative login options',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signWithGoogle',
      desc: 'Text for the Google sign-in button',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: 'Text for the option to switch to the registration screen',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: 'Text for the register now option in the login screen',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: 'Title for the registration screen',
      args: [],
    );
  }

  /// `Create a new account to get started.`
  String get registerSubtitle {
    return Intl.message(
      'Create a new account to get started.',
      name: 'registerSubtitle',
      desc: 'Subtitle for the registration screen',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: 'Label for the first name field',
      args: [],
    );
  }

  /// `Enter your first name`
  String get firstNameHint {
    return Intl.message(
      'Enter your first name',
      name: 'firstNameHint',
      desc: 'Hint text for the first name field',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: 'Label for the last name field',
      args: [],
    );
  }

  /// `Enter your last name`
  String get lastNameHint {
    return Intl.message(
      'Enter your last name',
      name: 'lastNameHint',
      desc: 'Hint text for the last name field',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: 'Label for the phone number field',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get phoneNumberHint {
    return Intl.message(
      'Enter your phone number',
      name: 'phoneNumberHint',
      desc: 'Hint text for the phone number field',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: 'Label for the confirm password field',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Re-enter your password',
      name: 'confirmPasswordHint',
      desc: 'Hint text for the confirm password field',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message(
      'Register',
      name: 'registerButton',
      desc: 'Text for the register button',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: 'Text for the option to switch to the login screen',
      args: [],
    );
  }

  /// `Login now`
  String get loginNow {
    return Intl.message(
      'Login now',
      name: 'loginNow',
      desc: 'Text for the login now option in the registration screen',
      args: [],
    );
  }

  /// `Registration successful! Please login to your account.`
  String get registerSuccess {
    return Intl.message(
      'Registration successful! Please login to your account.',
      name: 'registerSuccess',
      desc: 'Message displayed when registration is successful',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordTitle',
      desc: 'Title for the forgot password screen',
      args: [],
    );
  }

  /// `Don't worry! It happens. Please enter your email to reset your password.`
  String get forgotPasswordSubtitle {
    return Intl.message(
      'Don\'t worry! It happens. Please enter your email to reset your password.',
      name: 'forgotPasswordSubtitle',
      desc: 'Subtitle for the forgot password screen',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get forgotButton {
    return Intl.message(
      'Send Reset Link',
      name: 'forgotButton',
      desc: 'Text for the send reset link button in the forgot password screen',
      args: [],
    );
  }

  /// `A password reset link has been sent to your email.`
  String get forgotSuccess {
    return Intl.message(
      'A password reset link has been sent to your email.',
      name: 'forgotSuccess',
      desc:
          'Message displayed when the password reset link is successfully sent',
      args: [],
    );
  }

  /// `SAR`
  String get riyal {
    return Intl.message(
      'SAR',
      name: 'riyal',
      desc: 'Currency symbol for Saudi Riyal',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Label for the home screen in the bottom navigation bar',
      args: [],
    );
  }

  /// `Hi👋`
  String get hi {
    return Intl.message(
      'Hi👋',
      name: 'hi',
      desc: 'A greeting used to welcome the user',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: 'A message used to welcome the user back to the app',
      args: [],
    );
  }

  /// `Today's Deals`
  String get todayDeals {
    return Intl.message(
      'Today\'s Deals',
      name: 'todayDeals',
      desc:
          'Title for the section that displays today\'s deals on the home screen',
      args: [],
    );
  }

  /// `Mosque Deals`
  String get mosqueDeals {
    return Intl.message(
      'Mosque Deals',
      name: 'mosqueDeals',
      desc:
          'Title for the section that displays mosque deals on the home screen',
      args: [],
    );
  }

  /// `Company Deals`
  String get companiesDeals {
    return Intl.message(
      'Company Deals',
      name: 'companiesDeals',
      desc:
          'Title for the section that displays company deals on the home screen',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: 'Text for the add to cart button',
      args: [],
    );
  }

  /// `Product added to cart successfully!`
  String get addProductToCartSuccess {
    return Intl.message(
      'Product added to cart successfully!',
      name: 'addProductToCartSuccess',
      desc:
          'Message displayed when a product is successfully added to the cart',
      args: [],
    );
  }

  /// `No products found.`
  String get noProductsFound {
    return Intl.message(
      'No products found.',
      name: 'noProductsFound',
      desc:
          'Message displayed when no products are found in a search or category',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: 'Label for the favourites screen in the bottom navigation bar',
      args: [],
    );
  }

  /// `Your Favourites`
  String get favouritesTitle {
    return Intl.message(
      'Your Favourites',
      name: 'favouritesTitle',
      desc: 'Title for the favourites screen',
      args: [],
    );
  }

  /// `You haven't added any products to your favourites yet.`
  String get noFavouritesYet {
    return Intl.message(
      'You haven\'t added any products to your favourites yet.',
      name: 'noFavouritesYet',
      desc:
          'Message displayed when the user has not added any products to their favourites',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: 'Label for the cart screen in the bottom navigation bar',
      args: [],
    );
  }

  /// `Your Cart`
  String get cartTitle {
    return Intl.message(
      'Your Cart',
      name: 'cartTitle',
      desc: 'Title for the cart screen',
      args: [],
    );
  }

  /// `Price:  `
  String get price {
    return Intl.message(
      'Price:  ',
      name: 'price',
      desc: 'Label for the price in the cart items',
      args: [],
    );
  }

  /// `Total:  `
  String get total {
    return Intl.message(
      'Total:  ',
      name: 'total',
      desc: 'Label for the total in the cart items',
      args: [],
    );
  }

  /// `Quantity:  `
  String get quantity {
    return Intl.message(
      'Quantity:  ',
      name: 'quantity',
      desc: 'Label for the quantity in the cart items',
      args: [],
    );
  }

  /// `Your cart is empty.`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty.',
      name: 'emptyCart',
      desc: 'Message displayed when the user\'s cart is empty',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: 'Title for the order details screen',
      args: [],
    );
  }

  /// `Review your order details before proceeding to payment.`
  String get orderDetailsSubtitle {
    return Intl.message(
      'Review your order details before proceeding to payment.',
      name: 'orderDetailsSubtitle',
      desc: 'Subtitle for the order details screen',
      args: [],
    );
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc:
          'Label for the delivery address section in the order details screen',
      args: [],
    );
  }

  /// `+ Add New`
  String get addNew {
    return Intl.message(
      '+ Add New',
      name: 'addNew',
      desc: 'Text for the add new address option in the order details screen',
      args: [],
    );
  }

  /// `Order Now`
  String get orderNow {
    return Intl.message(
      'Order Now',
      name: 'orderNow',
      desc: 'Text for the order now button in the order details screen',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: 'Title for the order summary section in the order details screen',
      args: [],
    );
  }

  /// `Product Total:  `
  String get productsTotal {
    return Intl.message(
      'Product Total:  ',
      name: 'productsTotal',
      desc: 'Label for the product total in the order summary section',
      args: [],
    );
  }

  /// `Products Price:  `
  String get productsPrice {
    return Intl.message(
      'Products Price:  ',
      name: 'productsPrice',
      desc: 'Label for the products price in the order summary section',
      args: [],
    );
  }

  /// `Complete Order`
  String get completeOrder {
    return Intl.message(
      'Complete Order',
      name: 'completeOrder',
      desc: 'Text for the complete order button in the order details screen',
      args: [],
    );
  }

  /// `You have no products in your cart to order.`
  String get noProductsInCart {
    return Intl.message(
      'You have no products in your cart to order.',
      name: 'noProductsInCart',
      desc: 'Message displayed when the user tries to order with an empty cart',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Label for the settings screen in the bottom navigation bar',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Label for the account section in the settings screen',
      args: [],
    );
  }

  /// `Personal Information`
  String get profile {
    return Intl.message(
      'Personal Information',
      name: 'profile',
      desc:
          'Label for the personal information section in the account settings screen',
      args: [],
    );
  }

  /// `Your Personal Information`
  String get profileTitle {
    return Intl.message(
      'Your Personal Information',
      name: 'profileTitle',
      desc:
          'Title for the personal information section in the account settings screen',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Text for the save button in the account settings screen',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: 'Text for the delete account button in the account settings screen',
      args: [],
    );
  }

  /// `Profile updated successfully!`
  String get updateProfileSuccess {
    return Intl.message(
      'Profile updated successfully!',
      name: 'updateProfileSuccess',
      desc: 'Message displayed when the profile is successfully updated',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action cannot be undone.`
  String get deleteAccountConfirmation {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone.',
      name: 'deleteAccountConfirmation',
      desc:
          'Confirmation message displayed when the user attempts to delete their account',
      args: [],
    );
  }

  /// `Your account has been deleted successfully.`
  String get deleteAccountSuccess {
    return Intl.message(
      'Your account has been deleted successfully.',
      name: 'deleteAccountSuccess',
      desc: 'Message displayed when the account is successfully deleted',
      args: [],
    );
  }

  /// `Manage Locations`
  String get manageLocations {
    return Intl.message(
      'Manage Locations',
      name: 'manageLocations',
      desc: 'Label for the manage locations option in the settings screen',
      args: [],
    );
  }

  /// `Your Locations`
  String get locationsTitle {
    return Intl.message(
      'Your Locations',
      name: 'locationsTitle',
      desc: 'Title for the locations screen in the settings section',
      args: [],
    );
  }

  /// `You haven't added any locations yet.`
  String get noLocationsYet {
    return Intl.message(
      'You haven\'t added any locations yet.',
      name: 'noLocationsYet',
      desc:
          'Message displayed when the user has not added any locations in the manage locations section of the settings screen',
      args: [],
    );
  }

  /// `District : `
  String get district {
    return Intl.message(
      'District : ',
      name: 'district',
      desc: 'Label for the district field in the add/edit location screen',
      args: [],
    );
  }

  /// `Street : `
  String get street {
    return Intl.message(
      'Street : ',
      name: 'street',
      desc: 'Label for the street field in the add/edit location screen',
      args: [],
    );
  }

  /// `Building : `
  String get building {
    return Intl.message(
      'Building : ',
      name: 'building',
      desc: 'Label for the building field in the add/edit location screen',
      args: [],
    );
  }

  /// `Floor : `
  String get floor {
    return Intl.message(
      'Floor : ',
      name: 'floor',
      desc: 'Label for the floor field in the add/edit location screen',
      args: [],
    );
  }

  /// `Add New Location`
  String get addLocationTitle {
    return Intl.message(
      'Add New Location',
      name: 'addLocationTitle',
      desc:
          'Title for the add new location screen in the manage locations section',
      args: [],
    );
  }

  /// `Edit Location`
  String get editLocationTitle {
    return Intl.message(
      'Edit Location',
      name: 'editLocationTitle',
      desc:
          'Title for the edit location screen in the manage locations section',
      args: [],
    );
  }

  /// `Location Name`
  String get locationName {
    return Intl.message(
      'Location Name',
      name: 'locationName',
      desc: 'Label for the location name field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter a name for this location (e.g., Home, Work, etc.)`
  String get locationNameHint {
    return Intl.message(
      'Enter a name for this location (e.g., Home, Work, etc.)',
      name: 'locationNameHint',
      desc:
          'Hint text for the location name field in the add/edit location screen',
      args: [],
    );
  }

  /// `Country`
  String get locationCountry {
    return Intl.message(
      'Country',
      name: 'locationCountry',
      desc: 'Label for the country field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the country for this location (e.g., Saudi Arabia, Egypt, etc.)`
  String get locationCountryHint {
    return Intl.message(
      'Enter the country for this location (e.g., Saudi Arabia, Egypt, etc.)',
      name: 'locationCountryHint',
      desc: 'Hint text for the country field in the add/edit location screen',
      args: [],
    );
  }

  /// `🇸🇦 Saudi Arabia`
  String get saudiArabia {
    return Intl.message(
      '🇸🇦 Saudi Arabia',
      name: 'saudiArabia',
      desc:
          'Option for Saudi Arabia in the country field of the add/edit location screen',
      args: [],
    );
  }

  /// `Region Name`
  String get locationRegion {
    return Intl.message(
      'Region Name',
      name: 'locationRegion',
      desc: 'Label for the region field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the region for this location (e.g., Riyadh, Jeddah, etc.)`
  String get locationRegionHint {
    return Intl.message(
      'Enter the region for this location (e.g., Riyadh, Jeddah, etc.)',
      name: 'locationRegionHint',
      desc: 'Hint text for the region field in the add/edit location screen',
      args: [],
    );
  }

  /// `City Name`
  String get locationCity {
    return Intl.message(
      'City Name',
      name: 'locationCity',
      desc: 'Label for the city field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the city for this location (e.g., Riyadh, Jeddah, etc.)`
  String get locationCityHint {
    return Intl.message(
      'Enter the city for this location (e.g., Riyadh, Jeddah, etc.)',
      name: 'locationCityHint',
      desc: 'Hint text for the city field in the add/edit location screen',
      args: [],
    );
  }

  /// `District Name/Number`
  String get locationDistrict {
    return Intl.message(
      'District Name/Number',
      name: 'locationDistrict',
      desc: 'Label for the district field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the district name or number for this location (e.g., Al-Olaya, Al-Rawdah, District 123, etc.)`
  String get locationDistrictHint {
    return Intl.message(
      'Enter the district name or number for this location (e.g., Al-Olaya, Al-Rawdah, District 123, etc.)',
      name: 'locationDistrictHint',
      desc: 'Hint text for the district field in the add/edit location screen',
      args: [],
    );
  }

  /// `Street Name`
  String get locationStreet {
    return Intl.message(
      'Street Name',
      name: 'locationStreet',
      desc: 'Label for the street field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the street name for this location (e.g., King Fahd Road, Main Street, etc.)`
  String get locationStreetHint {
    return Intl.message(
      'Enter the street name for this location (e.g., King Fahd Road, Main Street, etc.)',
      name: 'locationStreetHint',
      desc: 'Hint text for the street field in the add/edit location screen',
      args: [],
    );
  }

  /// `Building Name/Number`
  String get locationBuilding {
    return Intl.message(
      'Building Name/Number',
      name: 'locationBuilding',
      desc: 'Label for the building field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the building name or number for this location (e.g., Kingdom Tower, Building 456, etc.)`
  String get locationBuildingHint {
    return Intl.message(
      'Enter the building name or number for this location (e.g., Kingdom Tower, Building 456, etc.)',
      name: 'locationBuildingHint',
      desc: 'Hint text for the building field in the add/edit location screen',
      args: [],
    );
  }

  /// `Floor Number`
  String get locationFloor {
    return Intl.message(
      'Floor Number',
      name: 'locationFloor',
      desc: 'Label for the floor field in the add/edit location screen',
      args: [],
    );
  }

  /// `Enter the floor number for this location (e.g., 1, 2, etc.)`
  String get locationFloorHint {
    return Intl.message(
      'Enter the floor number for this location (e.g., 1, 2, etc.)',
      name: 'locationFloorHint',
      desc: 'Hint text for the floor field in the add/edit location screen',
      args: [],
    );
  }

  /// `Add Location`
  String get addLocationButton {
    return Intl.message(
      'Add Location',
      name: 'addLocationButton',
      desc: 'Text for the add location button in the add location screen',
      args: [],
    );
  }

  /// `Save Changes`
  String get editLocationButton {
    return Intl.message(
      'Save Changes',
      name: 'editLocationButton',
      desc: 'Text for the save changes button in the edit location screen',
      args: [],
    );
  }

  /// `Location added successfully!`
  String get addLocationSuccess {
    return Intl.message(
      'Location added successfully!',
      name: 'addLocationSuccess',
      desc: 'Message displayed when a location is added successfully',
      args: [],
    );
  }

  /// `Location updated successfully!`
  String get editLocationSuccess {
    return Intl.message(
      'Location updated successfully!',
      name: 'editLocationSuccess',
      desc: 'Message displayed when a location is updated successfully',
      args: [],
    );
  }

  /// `Manage Orders`
  String get manageOrders {
    return Intl.message(
      'Manage Orders',
      name: 'manageOrders',
      desc: 'Label for the manage orders option in the settings screen',
      args: [],
    );
  }

  /// `Order Status`
  String get OrderStatus {
    return Intl.message(
      'Order Status',
      name: 'OrderStatus',
      desc: 'Label for the order status field in the order details screen',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: 'Label for the pending order status',
      args: [],
    );
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message(
      'Confirmed',
      name: 'confirmed',
      desc: 'Label for the confirmed order status',
      args: [],
    );
  }

  /// `Preparing`
  String get preparing {
    return Intl.message(
      'Preparing',
      name: 'preparing',
      desc: 'Label for the preparing order status',
      args: [],
    );
  }

  /// `Out for Delivery`
  String get outForDelivery {
    return Intl.message(
      'Out for Delivery',
      name: 'outForDelivery',
      desc: 'Label for the out for delivery order status',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: 'Label for the delivered order status',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: 'Label for the cancelled order status',
      args: [],
    );
  }

  /// `Order History`
  String get orderHistory {
    return Intl.message(
      'Order History',
      name: 'orderHistory',
      desc: 'Label for the order history option in the settings screen',
      args: [],
    );
  }

  /// `Your Orders`
  String get ordersTitle {
    return Intl.message(
      'Your Orders',
      name: 'ordersTitle',
      desc: 'Title for the orders screen',
      args: [],
    );
  }

  /// `You haven't placed any orders yet.`
  String get noOrdersYet {
    return Intl.message(
      'You haven\'t placed any orders yet.',
      name: 'noOrdersYet',
      desc: 'Message displayed when the user has not placed any orders',
      args: [],
    );
  }

  /// `Delivery Information`
  String get orderDeliveryInfo {
    return Intl.message(
      'Delivery Information',
      name: 'orderDeliveryInfo',
      desc:
          'Label for the delivery information section in the order details screen in the order history',
      args: [],
    );
  }

  /// `Products`
  String get orderProducts {
    return Intl.message(
      'Products',
      name: 'orderProducts',
      desc:
          'Label for the products section in the order details screen in the order history',
      args: [],
    );
  }

  /// `Add Order`
  String get addOrder {
    return Intl.message(
      'Add Order',
      name: 'addOrder',
      desc: 'Text for the add order button in the orders screen',
      args: [],
    );
  }

  /// `Order added successfully!`
  String get addOrderSuccess {
    return Intl.message(
      'Order added successfully!',
      name: 'addOrderSuccess',
      desc: 'Message displayed when an order is added successfully',
      args: [],
    );
  }

  /// `Delete Order`
  String get deleteOrder {
    return Intl.message(
      'Delete Order',
      name: 'deleteOrder',
      desc:
          'Text for the delete order button in the order details screen in the order history',
      args: [],
    );
  }

  /// `Are you sure you want to delete this order? This action cannot be undone.`
  String get areYouSureYouWantToDeleteThisOrder {
    return Intl.message(
      'Are you sure you want to delete this order? This action cannot be undone.',
      name: 'areYouSureYouWantToDeleteThisOrder',
      desc:
          'Confirmation message displayed when the user attempts to delete an order',
      args: [],
    );
  }

  /// `Order deleted successfully!`
  String get deleteOrderSuccess {
    return Intl.message(
      'Order deleted successfully!',
      name: 'deleteOrderSuccess',
      desc: 'Message displayed when an order is deleted successfully',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: 'Label for the preferences section in the settings screen',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Label for the language settings option',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'Option for selecting English language',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: 'Option for selecting Arabic language',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Label for the theme settings option',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: 'Option for selecting light theme',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: 'Option for selecting dark theme',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: 'Option for selecting system default theme',
      args: [],
    );
  }

  /// `Support & Help`
  String get helpSupport {
    return Intl.message(
      'Support & Help',
      name: 'helpSupport',
      desc: 'Label for the support and help section in the settings screen',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: 'Label for the privacy policy option in the settings screen',
      args: [],
    );
  }

  /// `Our online store welcomes you. Below are the terms and conditions governing your use of the store and the legal effects arising from using our services. By using any service or product, you agree to these terms.`
  String get privacyPolicyDescription {
    return Intl.message(
      'Our online store welcomes you. Below are the terms and conditions governing your use of the store and the legal effects arising from using our services. By using any service or product, you agree to these terms.',
      name: 'privacyPolicyDescription',
      desc: 'Description for the privacy policy option in the settings screen',
      args: [],
    );
  }

  /// `1. Introduction and Definitions`
  String get firstPolicy {
    return Intl.message(
      '1. Introduction and Definitions',
      name: 'firstPolicy',
      desc: 'Title for the first section of the privacy policy',
      args: [],
    );
  }

  /// `The preamble is an integral part of this agreement and includes definitions of the store, consumer, and the agreement itself.`
  String get firstPolicyDescription {
    return Intl.message(
      'The preamble is an integral part of this agreement and includes definitions of the store, consumer, and the agreement itself.',
      name: 'firstPolicyDescription',
      desc: 'Description for the first section of the privacy policy',
      args: [],
    );
  }

  /// `2. Consumer Legal Capacity`
  String get secondPolicy {
    return Intl.message(
      '2. Consumer Legal Capacity',
      name: 'secondPolicy',
      desc: 'Title for the second section of the privacy policy',
      args: [],
    );
  }

  /// `The consumer acknowledges having valid legal capacity to deal with the store and being at least 18 years old. In case of violation, the consumer bears the consequences.`
  String get secondPolicyDescription {
    return Intl.message(
      'The consumer acknowledges having valid legal capacity to deal with the store and being at least 18 years old. In case of violation, the consumer bears the consequences.',
      name: 'secondPolicyDescription',
      desc: 'Description for the second section of the privacy policy',
      args: [],
    );
  }

  /// `3. Nature of Commitment`
  String get thirdPolicy {
    return Intl.message(
      '3. Nature of Commitment',
      name: 'thirdPolicy',
      desc: 'Title for the third section of the privacy policy',
      args: [],
    );
  }

  /// `The store’s commitment is to provide the service or product to the customer. It may include additional after-sales services depending on the product or service type.`
  String get thirdPolicyDescription {
    return Intl.message(
      'The store’s commitment is to provide the service or product to the customer. It may include additional after-sales services depending on the product or service type.',
      name: 'thirdPolicyDescription',
      desc: 'Description for the third section of the privacy policy',
      args: [],
    );
  }

  /// `4. Usage Guidelines`
  String get fourthPolicy {
    return Intl.message(
      '4. Usage Guidelines',
      name: 'fourthPolicy',
      desc: 'Title for the fourth section of the privacy policy',
      args: [],
    );
  }

  /// `The consumer must use the platform in accordance with regulations and public morals and must not use the service in violation of applicable laws.`
  String get fourthPolicyDescription {
    return Intl.message(
      'The consumer must use the platform in accordance with regulations and public morals and must not use the service in violation of applicable laws.',
      name: 'fourthPolicyDescription',
      desc: 'Description for the fourth section of the privacy policy',
      args: [],
    );
  }

  /// `5. Accounts and Registration Obligations`
  String get fivthPolicy {
    return Intl.message(
      '5. Accounts and Registration Obligations',
      name: 'fivthPolicy',
      desc: 'Title for the fifth section of the privacy policy',
      args: [],
    );
  }

  /// `The consumer is responsible for the confidentiality of their account data and password, agrees to use accurate and up-to-date information, and the store reserves the right to suspend the account in case of violation.`
  String get fivthPolicyDescription {
    return Intl.message(
      'The consumer is responsible for the confidentiality of their account data and password, agrees to use accurate and up-to-date information, and the store reserves the right to suspend the account in case of violation.',
      name: 'fivthPolicyDescription',
      desc: 'Description for the fifth section of the privacy policy',
      args: [],
    );
  }

  /// `6. Intellectual Property, Payment Services, Modifications, Store Liability, Access Restrictions, and Applicable Laws`
  String get sexthPolicy {
    return Intl.message(
      '6. Intellectual Property, Payment Services, Modifications, Store Liability, Access Restrictions, and Applicable Laws',
      name: 'sexthPolicy',
      desc: 'Title for the sixth section of the privacy policy',
      args: [],
    );
  }

  /// `This includes details on intellectual property, payment services, modifications to the agreement, store liability, access restrictions, and applicable laws—all subject to the full original agreement.`
  String get sexthPolicyDescription {
    return Intl.message(
      'This includes details on intellectual property, payment services, modifications to the agreement, store liability, access restrictions, and applicable laws—all subject to the full original agreement.',
      name: 'sexthPolicyDescription',
      desc: 'Description for the sixth section of the privacy policy',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUsTitle {
    return Intl.message(
      'About Us',
      name: 'aboutUsTitle',
      desc: 'Title for the About Us screen',
      args: [],
    );
  }

  /// `Welcome to "Al-Reef Water", where you’ll find naturally bottled water carefully prepared to meet your daily needs with top quality. We offer low-sodium bottled water, pure and free from unnecessary additives—an ideal choice for everyone, from children to seniors. Al-Reef Water is a healthy choice thanks to advanced production methods that preserve essential minerals your body needs. We put your health first by providing mineral-rich water that supports your overall well-being and balance.`
  String get aboutUsDescription {
    return Intl.message(
      'Welcome to "Al-Reef Water", where you’ll find naturally bottled water carefully prepared to meet your daily needs with top quality. We offer low-sodium bottled water, pure and free from unnecessary additives—an ideal choice for everyone, from children to seniors. Al-Reef Water is a healthy choice thanks to advanced production methods that preserve essential minerals your body needs. We put your health first by providing mineral-rich water that supports your overall well-being and balance.',
      name: 'aboutUsDescription',
      desc: 'Description paragraph used in the About Us screen',
      args: [],
    );
  }

  /// `Our Vision`
  String get visionTitle {
    return Intl.message(
      'Our Vision',
      name: 'visionTitle',
      desc: 'Title for the Vision section in About Us',
      args: [],
    );
  }

  /// `Maintaining the highest quality standards to produce bottled water using best practices compliant with all quality measurements, ensuring pure, healthy water that meets top international specifications.`
  String get visionDescription {
    return Intl.message(
      'Maintaining the highest quality standards to produce bottled water using best practices compliant with all quality measurements, ensuring pure, healthy water that meets top international specifications.',
      name: 'visionDescription',
      desc: 'Description for the Vision section in About Us',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUsTitle {
    return Intl.message(
      'Contact Us',
      name: 'contactUsTitle',
      desc: 'Title for the Contact Us screen',
      args: [],
    );
  }

  /// `If you have questions or need assistance, reach out to us via email or phone. Our customer support team is available to help you with orders, products, and general inquiries.`
  String get contactUsDescription {
    return Intl.message(
      'If you have questions or need assistance, reach out to us via email or phone. Our customer support team is available to help you with orders, products, and general inquiries.',
      name: 'contactUsDescription',
      desc: 'Description paragraph used in the Contact Us screen',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: 'Label for the other section in the settings screen',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Text for the logout option in the settings screen',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
