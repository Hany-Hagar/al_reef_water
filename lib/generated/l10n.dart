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

  /// `Your favourites list is empty.`
  String get emptyFavourites {
    return Intl.message(
      'Your favourites list is empty.',
      name: 'emptyFavourites',
      desc: 'Message displayed when the user\'s favourites list is empty',
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

  /// `Your cart is empty.`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty.',
      name: 'emptyCart',
      desc: 'Message displayed when the user\'s cart is empty',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Label for the profile screen in the bottom navigation bar',
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

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: 'Label for the preferences section in the settings screen',
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

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Label for the account settings option',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: 'Label for the personal information settings option',
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

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: 'Label for the language settings option',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: 'Option for selecting English language',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: 'Option for selecting Arabic language',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: 'Label for the theme settings option',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: 'Option for selecting light theme',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: 'Option for selecting dark theme',
      args: [],
    );
  }

  /// `System`
  String get System {
    return Intl.message(
      'System',
      name: 'System',
      desc: 'Option for selecting system default theme',
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
