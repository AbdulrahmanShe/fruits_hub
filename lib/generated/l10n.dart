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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Added successfully`
  String get addedSuccessfully {
    return Intl.message(
      'Added successfully',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Alert`
  String get alert {
    return Intl.message('Alert', name: 'alert', desc: '', args: []);
  }

  /// `Alert!`
  String get alertExclamation {
    return Intl.message('Alert!', name: 'alertExclamation', desc: '', args: []);
  }

  /// `All`
  String get allCategory {
    return Intl.message('All', name: 'allCategory', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `You are already registered. Please sign in.`
  String get alreadyRegisteredPleaseSignIn {
    return Intl.message(
      'You are already registered. Please sign in.',
      name: 'alreadyRegisteredPleaseSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `Banana`
  String get banana {
    return Intl.message('Banana', name: 'banana', desc: '', args: []);
  }

  /// `Calories`
  String get calories {
    return Intl.message('Calories', name: 'calories', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Cart is empty`
  String get cartIsEmpty {
    return Intl.message(
      'Cart is empty',
      name: 'cartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Check your internet and card validity, then retry.`
  String get checkInternetAndCardThenRetry {
    return Intl.message(
      'Check your internet and card validity, then retry.',
      name: 'checkInternetAndCardThenRetry',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get checkInternetConnection {
    return Intl.message(
      'Check your internet connection.',
      name: 'checkInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get checkInternetConnectionTypo {
    return Intl.message(
      'Check your internet connection.',
      name: 'checkInternetConnectionTypo',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirm logout`
  String get confirmLogoutTitle {
    return Intl.message(
      'Confirm logout',
      name: 'confirmLogoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get confirmLogoutMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'confirmLogoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continuous Updates`
  String get continuousUpdates {
    return Intl.message(
      'Continuous Updates',
      name: 'continuousUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Creating account...`
  String get creatingAccount {
    return Intl.message(
      'Creating account...',
      name: 'creatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `ILS`
  String get currencyShekel {
    return Intl.message('ILS', name: 'currencyShekel', desc: '', args: []);
  }

  /// `March 1, 2026`
  String get date1March2026 {
    return Intl.message(
      'March 1, 2026',
      name: 'date1March2026',
      desc: '',
      args: [],
    );
  }

  /// `February 27, 2026`
  String get date27Feb2026 {
    return Intl.message(
      'February 27, 2026',
      name: 'date27Feb2026',
      desc: '',
      args: [],
    );
  }

  /// `March 2, 2026`
  String get date2March2026 {
    return Intl.message(
      'March 2, 2026',
      name: 'date2March2026',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get defaultUser {
    return Intl.message('User', name: 'defaultUser', desc: '', args: []);
  }

  /// `Delete All`
  String get deleteAll {
    return Intl.message('Delete All', name: 'deleteAll', desc: '', args: []);
  }

  /// `Delivery from location`
  String get deliveryFromLocation {
    return Intl.message(
      'Delivery from location',
      name: 'deliveryFromLocation',
      desc: '',
      args: [],
    );
  }

  /// `Delivery:`
  String get deliveryLabel {
    return Intl.message('Delivery:', name: 'deliveryLabel', desc: '', args: []);
  }

  /// `So we designed a clear shopping journey from product selection to delivery.`
  String get designedClearPurchaseExperience {
    return Intl.message(
      'So we designed a clear shopping journey from product selection to delivery.',
      name: 'designedClearPurchaseExperience',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get designMode {
    return Intl.message('Mode', name: 'designMode', desc: '', args: []);
  }

  /// `30% OFF`
  String get discount30 {
    return Intl.message('30% OFF', name: 'discount30', desc: '', args: []);
  }

  /// `25% OFF`
  String get discount25 {
    return Intl.message('25% OFF', name: 'discount25', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `An easier way to shop for daily essentials`
  String get easierFreshFruitShoppingExperience {
    return Intl.message(
      'An easier way to shop for daily essentials',
      name: 'easierFreshFruitShoppingExperience',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `{amount} ILS`
  String ilsAmount(String amount) {
    return Intl.message(
      '$amount ILS',
      name: 'ilsAmount',
      desc: '',
      args: [amount],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `name@example.com`
  String get emailExample {
    return Intl.message(
      'name@example.com',
      name: 'emailExample',
      desc: '',
      args: [],
    );
  }

  /// `Email is not registered.`
  String get emailNotRegistered {
    return Intl.message(
      'Email is not registered.',
      name: 'emailNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Enter full name`
  String get enterFullName {
    return Intl.message(
      'Enter full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Expiry`
  String get expiry {
    return Intl.message('Expiry', name: 'expiry', desc: '', args: []);
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `Failed to add product to favorites`
  String get failedToAddProductToFavorites {
    return Intl.message(
      'Failed to add product to favorites',
      name: 'failedToAddProductToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load favorites`
  String get failedToLoadFavorites {
    return Intl.message(
      'Failed to load favorites',
      name: 'failedToLoadFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Failed to remove product from favorites`
  String get failedToRemoveProductFromFavorites {
    return Intl.message(
      'Failed to remove product from favorites',
      name: 'failedToRemoveProductFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send reset link.`
  String get failedToSendResetLink {
    return Intl.message(
      'Failed to send reset link.',
      name: 'failedToSendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update data`
  String get failedToUpdateData {
    return Intl.message(
      'Failed to update data',
      name: 'failedToUpdateData',
      desc: '',
      args: [],
    );
  }

  /// `Fast Delivery`
  String get fastDelivery {
    return Intl.message(
      'Fast Delivery',
      name: 'fastDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Favorites are empty`
  String get favoritesEmpty {
    return Intl.message(
      'Favorites are empty',
      name: 'favoritesEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Featured Products`
  String get featuredProducts {
    return Intl.message(
      'Featured Products',
      name: 'featuredProducts',
      desc: '',
      args: [],
    );
  }

  /// `Featured products loaded successfully`
  String get featuredProductsLoadedSuccessfully {
    return Intl.message(
      'Featured products loaded successfully',
      name: 'featuredProductsLoadedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Filtering`
  String get filtering {
    return Intl.message('Filtering', name: 'filtering', desc: '', args: []);
  }

  /// `Final Total`
  String get finalTotal {
    return Intl.message('Final Total', name: 'finalTotal', desc: '', args: []);
  }

  /// `Floor and apartment number`
  String get floorAndApartmentNumber {
    return Intl.message(
      'Floor and apartment number',
      name: 'floorAndApartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Limited time`
  String get limitedTime {
    return Intl.message(
      'Limited time',
      name: 'limitedTime',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordQuestion {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Fruit deals`
  String get fruitDealsTitle {
    return Intl.message(
      'Fruit deals',
      name: 'fruitDealsTitle',
      desc: '',
      args: [],
    );
  }

  /// `From "My Account" then "Language", choose Arabic or English.`
  String get fromMyAccountThenLanguage {
    return Intl.message(
      'From "My Account" then "Language", choose Arabic or English.',
      name: 'fromMyAccountThenLanguage',
      desc: '',
      args: [],
    );
  }

  /// `From "My Orders", open the order to view details and invoice.`
  String get fromMyOrdersOpenOrder {
    return Intl.message(
      'From "My Orders", open the order to view details and invoice.',
      name: 'fromMyOrdersOpenOrder',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Full name is required`
  String get fullNameRequired {
    return Intl.message(
      'Full name is required',
      name: 'fullNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Grapes`
  String get grapes {
    return Intl.message('Grapes', name: 'grapes', desc: '', args: []);
  }

  /// `Guaranteed Quality`
  String get guaranteedQuality {
    return Intl.message(
      'Guaranteed Quality',
      name: 'guaranteedQuality',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Support`
  String get helpSection {
    return Intl.message('Support', name: 'helpSection', desc: '', args: []);
  }

  /// `Holiday Offers`
  String get holidayOffers {
    return Intl.message(
      'Holiday Offers',
      name: 'holidayOffers',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `How do I add a product to favorites?`
  String get howAddProductToFavorites {
    return Intl.message(
      'How do I add a product to favorites?',
      name: 'howAddProductToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `How can we help you today?`
  String get howCanWeHelpToday {
    return Intl.message(
      'How can we help you today?',
      name: 'howCanWeHelpToday',
      desc: '',
      args: [],
    );
  }

  /// `How do I change language?`
  String get howChangeLanguage {
    return Intl.message(
      'How do I change language?',
      name: 'howChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `How do I track my order?`
  String get howTrackOrderStatus {
    return Intl.message(
      'How do I track my order?',
      name: 'howTrackOrderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Invalid sign-in credentials.`
  String get invalidCredentials {
    return Intl.message(
      'Invalid sign-in credentials.',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmail {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invoice QR`
  String get invoiceQr {
    return Intl.message('Invoice QR', name: 'invoiceQr', desc: '', args: []);
  }

  /// `Kiwi`
  String get kiwi {
    return Intl.message('Kiwi', name: 'kiwi', desc: '', args: []);
  }

  /// `km`
  String get kmUnit {
    return Intl.message('km', name: 'kmUnit', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Language will be applied immediately after selection.`
  String get languageAppliedImmediatelyAfterSelection {
    return Intl.message(
      'Language will be applied immediately after selection.',
      name: 'languageAppliedImmediatelyAfterSelection',
      desc: '',
      args: [],
    );
  }

  /// `Vegetable deals`
  String get vegetableDealsTitle {
    return Intl.message(
      'Vegetable deals',
      name: 'vegetableDealsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Microphone permission is required.`
  String get microphoneAccessRequired {
    return Intl.message(
      'Microphone permission is required.',
      name: 'microphoneAccessRequired',
      desc: '',
      args: [],
    );
  }

  /// `{months} months`
  String monthsCount(String months) {
    return Intl.message(
      '$months months',
      name: 'monthsCount',
      desc: '',
      args: [months],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `You must accept terms and conditions`
  String get mustAcceptTerms {
    return Intl.message(
      'You must accept terms and conditions',
      name: 'mustAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Name must contain letters only`
  String get nameLettersOnly {
    return Intl.message(
      'Name must contain letters only',
      name: 'nameLettersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short`
  String get nameTooShort {
    return Intl.message(
      'Name is too short',
      name: 'nameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccount {
    return Intl.message('New Account', name: 'newAccount', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `No products in cart`
  String get noProductsInCart {
    return Intl.message(
      'No products in cart',
      name: 'noProductsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with Salla Market.`
  String get onboardingSubtitle1 {
    return Intl.message(
      'Discover a unique shopping experience with Salla Market.',
      name: 'onboardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `We provide carefully selected premium fruits.`
  String get onboardingSubtitle2 {
    return Intl.message(
      'We provide carefully selected premium fruits.',
      name: 'onboardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Online payment`
  String get onlinePayment {
    return Intl.message(
      'Online payment',
      name: 'onlinePayment',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Orange`
  String get orangeFruit {
    return Intl.message('Orange', name: 'orangeFruit', desc: '', args: []);
  }

  /// `Order date: {date}`
  String orderDateLabel(String date) {
    return Intl.message(
      'Order date: $date',
      name: 'orderDateLabel',
      desc: '',
      args: [date],
    );
  }

  /// `Order Invoice`
  String get orderInvoice {
    return Intl.message(
      'Order Invoice',
      name: 'orderInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Order No. {orderNumber}`
  String orderNumberLabel(String orderNumber) {
    return Intl.message(
      'Order No. $orderNumber',
      name: 'orderNumberLabel',
      desc: '',
      args: [orderNumber],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Total {total} | Items: {quantity}`
  String orderSummaryLabel(String total, String quantity) {
    return Intl.message(
      'Total $total | Items: $quantity',
      name: 'orderSummaryLabel',
      desc: '',
      args: [total, quantity],
    );
  }

  /// `Organic`
  String get organic {
    return Intl.message('Organic', name: 'organic', desc: '', args: []);
  }

  /// `Our Mission`
  String get ourMission {
    return Intl.message('Our Mission', name: 'ourMission', desc: '', args: []);
  }

  /// `Our Products`
  String get ourProducts {
    return Intl.message(
      'Our Products',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `Our terms and conditions`
  String get ourTermsAndConditions {
    return Intl.message(
      'Our terms and conditions',
      name: 'ourTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password must be at least 6 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `A reset link will be sent to your email.`
  String get passwordResetInstruction {
    return Intl.message(
      'A reset link will be sent to your email.',
      name: 'passwordResetInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent`
  String get passwordResetLinkSent {
    return Intl.message(
      'Password reset link sent',
      name: 'passwordResetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Complete Order`
  String get checkoutTitle {
    return Intl.message(
      'Complete Order',
      name: 'checkoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pay {amount} ILS`
  String paymentAmount(String amount) {
    return Intl.message(
      'Pay $amount ILS',
      name: 'paymentAmount',
      desc: '',
      args: [amount],
    );
  }

  /// `Payment successful`
  String get paymentSuccessTitle {
    return Intl.message(
      'Payment successful',
      name: 'paymentSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your payment has been confirmed`
  String get paymentSuccessSubtitle {
    return Intl.message(
      'Your payment has been confirmed',
      name: 'paymentSuccessSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment details`
  String get paymentDetailsTitle {
    return Intl.message(
      'Payment details',
      name: 'paymentDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get orderIdLabel {
    return Intl.message('Order ID', name: 'orderIdLabel', desc: '', args: []);
  }

  /// `Amount`
  String get amountLabel {
    return Intl.message('Amount', name: 'amountLabel', desc: '', args: []);
  }

  /// `Payment method`
  String get paymentMethodLabelShort {
    return Intl.message(
      'Payment method',
      name: 'paymentMethodLabelShort',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get statusLabel {
    return Intl.message('Status', name: 'statusLabel', desc: '', args: []);
  }

  /// `Pending confirmation`
  String get paymentPendingStatus {
    return Intl.message(
      'Pending confirmation',
      name: 'paymentPendingStatus',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get paymentReceivedStatus {
    return Intl.message(
      'Received',
      name: 'paymentReceivedStatus',
      desc: '',
      args: [],
    );
  }

  /// `View orders`
  String get viewOrders {
    return Intl.message('View orders', name: 'viewOrders', desc: '', args: []);
  }

  /// `Back to shopping`
  String get backToShopping {
    return Intl.message(
      'Back to shopping',
      name: 'backToShopping',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Stripe`
  String get stripe {
    return Intl.message('Stripe', name: 'stripe', desc: '', args: []);
  }

  /// `Payment method: {method}`
  String paymentMethodLabel(String method) {
    return Intl.message(
      'Payment method: $method',
      name: 'paymentMethodLabel',
      desc: '',
      args: [method],
    );
  }

  /// `Pay with Stripe`
  String get payWithStripe {
    return Intl.message(
      'Pay with Stripe',
      name: 'payWithStripe',
      desc: '',
      args: [],
    );
  }

  /// `Confirm order`
  String get confirmOrder {
    return Intl.message(
      'Confirm order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is incomplete`
  String get phoneIncomplete {
    return Intl.message(
      'Phone number is incomplete',
      name: 'phoneIncomplete',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `05x xxx xxxx`
  String get phoneExample {
    return Intl.message(
      '05x xxx xxxx',
      name: 'phoneExample',
      desc: '',
      args: [],
    );
  }

  /// `Pineapple`
  String get pineapple {
    return Intl.message('Pineapple', name: 'pineapple', desc: '', args: []);
  }

  /// `Please select payment method`
  String get pleaseSelectPaymentMethod {
    return Intl.message(
      'Please select payment method',
      name: 'pleaseSelectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Product ID is unavailable`
  String get productIdUnavailable {
    return Intl.message(
      'Product ID is unavailable',
      name: 'productIdUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Products loaded successfully`
  String get productsLoadedSuccessfully {
    return Intl.message(
      'Products loaded successfully',
      name: 'productsLoadedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Account Information`
  String get profileInfo {
    return Intl.message(
      'Account Information',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `Profile saved successfully`
  String get profileSavedSuccessfully {
    return Intl.message(
      'Profile saved successfully',
      name: 'profileSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Recent Searches`
  String get recentSearches {
    return Intl.message(
      'Recent Searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Red Apple`
  String get redApple {
    return Intl.message('Red Apple', name: 'redApple', desc: '', args: []);
  }

  /// `{count} results`
  String resultsCount(String count) {
    return Intl.message(
      '$count results',
      name: 'resultsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get saving {
    return Intl.message('Saving...', name: 'saving', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search and Shop`
  String get searchAndShop {
    return Intl.message(
      'Search and Shop',
      name: 'searchAndShop',
      desc: '',
      args: [],
    );
  }

  /// `Search by voice or typing...`
  String get searchByVoiceOrTyping {
    return Intl.message(
      'Search by voice or typing...',
      name: 'searchByVoiceOrTyping',
      desc: '',
      args: [],
    );
  }

  /// `Secure Payment`
  String get securePayment {
    return Intl.message(
      'Secure Payment',
      name: 'securePayment',
      desc: '',
      args: [],
    );
  }

  /// `Sending...`
  String get sending {
    return Intl.message('Sending...', name: 'sending', desc: '', args: []);
  }

  /// `{price} ₪ / kg`
  String shekelPerKilo(String price) {
    return Intl.message(
      '$price ₪ / kg',
      name: 'shekelPerKilo',
      desc: '',
      args: [price],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Shop now`
  String get shopNow {
    return Intl.message('Shop now', name: 'shopNow', desc: '', args: []);
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Signed in with Google`
  String get signedInWithGoogle {
    return Intl.message(
      'Signed in with Google',
      name: 'signedInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign-in canceled`
  String get signInCancelled {
    return Intl.message(
      'Sign-in canceled',
      name: 'signInCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Signing in...`
  String get signingIn {
    return Intl.message('Signing in...', name: 'signingIn', desc: '', args: []);
  }

  /// `Signed in successfully`
  String get signInSuccessful {
    return Intl.message(
      'Signed in successfully',
      name: 'signInSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Something went wrong. Please try again.`
  String get somethingWentWrongTryAgain {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'somethingWentWrongTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, this information is currently unavailable.`
  String get sorryDataUnavailableNow {
    return Intl.message(
      'Sorry, this information is currently unavailable.',
      name: 'sorryDataUnavailableNow',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get startNow {
    return Intl.message('Start now', name: 'startNow', desc: '', args: []);
  }

  /// `Strawberry`
  String get strawberry {
    return Intl.message('Strawberry', name: 'strawberry', desc: '', args: []);
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Subtotal:`
  String get subtotalLabel {
    return Intl.message('Subtotal:', name: 'subtotalLabel', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `From 9:00 AM to 10:00 PM`
  String get supportHours {
    return Intl.message(
      'From 9:00 AM to 10:00 PM',
      name: 'supportHours',
      desc: '',
      args: [],
    );
  }

  /// `Tap the heart icon on a product card to add it to favorites.`
  String get tapHeartIconInProductCard {
    return Intl.message(
      'Tap the heart icon on a product card to add it to favorites.',
      name: 'tapHeartIconInProductCard',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to `
  String get termsAcceptancePrefix {
    return Intl.message(
      'By creating an account, you agree to ',
      name: 'termsAcceptancePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our app!\n\nPlease read the following terms and conditions carefully before using the app:\n\n1. Using the app means you agree to these terms.\n2. The app must not be used for illegal purposes.\n3. We are not responsible for any losses resulting from app use.\n4. Content in the app is protected by copyright.\n5. We may modify terms at any time.\n6. If you do not agree, please do not use the app.\n\nThank you for using our app!`
  String get termsAndConditionsContent {
    return Intl.message(
      'Welcome to our app!\n\nPlease read the following terms and conditions carefully before using the app:\n\n1. Using the app means you agree to these terms.\n2. The app must not be used for illegal purposes.\n3. We are not responsible for any losses resulting from app use.\n4. Content in the app is protected by copyright.\n5. We may modify terms at any time.\n6. If you do not agree, please do not use the app.\n\nThank you for using our app!',
      name: 'termsAndConditionsContent',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for choosing Salla Market`
  String get thanksForTrustingFruitHub {
    return Intl.message(
      'Thank you for choosing Salla Market',
      name: 'thanksForTrustingFruitHub',
      desc: '',
      args: [],
    );
  }

  /// `This email is not registered.`
  String get thisEmailIsNotRegistered {
    return Intl.message(
      'This email is not registered.',
      name: 'thisEmailIsNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalLabel {
    return Intl.message('Total', name: 'totalLabel', desc: '', args: []);
  }

  /// `Unexpected error. Please try again.`
  String get unexpectedErrorTryAgain {
    return Intl.message(
      'Unexpected error. Please try again.',
      name: 'unexpectedErrorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error. Please try later.`
  String get unexpectedErrorTryLater {
    return Intl.message(
      'Unexpected error. Please try later.',
      name: 'unexpectedErrorTryLater',
      desc: '',
      args: [],
    );
  }

  /// `Update your data and it will be saved locally.`
  String get updateDataHint {
    return Intl.message(
      'Update your data and it will be saved locally.',
      name: 'updateDataHint',
      desc: '',
      args: [],
    );
  }

  /// `We believe access to everyday essentials should be simple and fast for every home.`
  String get weBelieveFreshProductsShouldBeSimpleAndFast {
    return Intl.message(
      'We believe access to everyday essentials should be simple and fast for every home.',
      name: 'weBelieveFreshProductsShouldBeSimpleAndFast',
      desc: '',
      args: [],
    );
  }

  /// `We continuously improve the app based on your feedback.`
  String get weContinuouslyImproveApp {
    return Intl.message(
      'We continuously improve the app based on your feedback.',
      name: 'weContinuouslyImproveApp',
      desc: '',
      args: [],
    );
  }

  /// `We focus on transparent pricing, easy payment, and smooth tracking.`
  String get weFocusOnTransparentPricing {
    return Intl.message(
      'We focus on transparent pricing, easy payment, and smooth tracking.',
      name: 'weFocusOnTransparentPricing',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!..`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!..',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message('Welcome to', name: 'welcomeTo', desc: '', args: []);
  }

  /// `We work with trusted suppliers and review order quality before shipping.`
  String get weWorkWithTrustedSuppliers {
    return Intl.message(
      'We work with trusted suppliers and review order quality before shipping.',
      name: 'weWorkWithTrustedSuppliers',
      desc: '',
      args: [],
    );
  }

  /// `What if I have a payment issue?`
  String get whatIfPaymentIssue {
    return Intl.message(
      'What if I have a payment issue?',
      name: 'whatIfPaymentIssue',
      desc: '',
      args: [],
    );
  }

  /// `What We Commit To`
  String get whatWeCommitTo {
    return Intl.message(
      'What We Commit To',
      name: 'whatWeCommitTo',
      desc: '',
      args: [],
    );
  }

  /// `Why Salla Market?`
  String get whyFruitHub {
    return Intl.message(
      'Why Salla Market?',
      name: 'whyFruitHub',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No orders yet`
  String get ordersEmptyTitle {
    return Intl.message(
      'No orders yet',
      name: 'ordersEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Once you place an order, it will show up here.`
  String get ordersEmptySubtitle {
    return Intl.message(
      'Once you place an order, it will show up here.',
      name: 'ordersEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't load orders`
  String get ordersLoadFailedTitle {
    return Intl.message(
      'Couldn\'t load orders',
      name: 'ordersLoadFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get reload {
    return Intl.message('Retry', name: 'reload', desc: '', args: []);
  }

  /// `You have {count} items in your cart`
  String youHaveItemsInCart(String count) {
    return Intl.message(
      'You have $count items in your cart',
      name: 'youHaveItemsInCart',
      desc: '',
      args: [count],
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
