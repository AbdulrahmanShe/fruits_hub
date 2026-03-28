// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(amount) => "${amount} شيكل";

  static String m1(months) => "${months} أشهر";

  static String m2(date) => "تاريخ الطلب: ${date}";

  static String m3(orderNumber) => "طلب رقم ${orderNumber}";

  static String m4(total, quantity) =>
      "الإجمالي ${total}  |  عدد المنتجات: ${quantity}";

  static String m5(amount) => "الدفع ${amount} جنيه";

  static String m6(method) => "طريقة الدفع: ${method}";

  static String m7(count) => "${count} نتائج";

  static String m8(price) => "${price} ₪ / الكيلو";

  static String m9(count) => "لديك ${count} منتجات في سله التسوق";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutUs": MessageLookupByLibrary.simpleMessage("من نحن"),
    "accountCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء الحساب بنجاح",
    ),
    "addToCart": MessageLookupByLibrary.simpleMessage("أضف إلى السلة"),
    "addedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تمت الاضافة بنجاح",
    ),
    "address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "alert": MessageLookupByLibrary.simpleMessage("تنبيه"),
    "alertExclamation": MessageLookupByLibrary.simpleMessage("تنبيه !"),
    "allCategory": MessageLookupByLibrary.simpleMessage("الكل"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "تمتلك حساب بالفعل ؟",
    ),
    "alreadyRegisteredPleaseSignIn": MessageLookupByLibrary.simpleMessage(
      "لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.",
    ),
    "amountLabel": MessageLookupByLibrary.simpleMessage("المبلغ"),
    "applyFilter": MessageLookupByLibrary.simpleMessage("تصفيه"),
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "backToShopping": MessageLookupByLibrary.simpleMessage("الرجوع للتسوق"),
    "banana": MessageLookupByLibrary.simpleMessage("موز"),
    "calories": MessageLookupByLibrary.simpleMessage("سعرات"),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cart": MessageLookupByLibrary.simpleMessage("السلة"),
    "cartIsEmpty": MessageLookupByLibrary.simpleMessage("السلة فارغة"),
    "cash": MessageLookupByLibrary.simpleMessage("نقدًا"),
    "cashOnDelivery": MessageLookupByLibrary.simpleMessage(
      "الدفع عند الاستلام",
    ),
    "category": MessageLookupByLibrary.simpleMessage("التصنيف"),
    "checkInternetAndCardThenRetry": MessageLookupByLibrary.simpleMessage(
      "تأكد من الاتصال بالإنترنت ومن صلاحية البطاقة، ثم أعد المحاولة أو تواصل مع الدعم.",
    ),
    "checkInternetConnection": MessageLookupByLibrary.simpleMessage(
      "تأكد من اتصالك بالإنترنت.",
    ),
    "checkInternetConnectionTypo": MessageLookupByLibrary.simpleMessage(
      "تاكد من اتصالك بالانترنت.",
    ),
    "checkoutTitle": MessageLookupByLibrary.simpleMessage("إتمام الطلب"),
    "city": MessageLookupByLibrary.simpleMessage("المدينه"),
    "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "confirmLogoutMessage": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد تسجيل الخروج؟",
    ),
    "confirmLogoutTitle": MessageLookupByLibrary.simpleMessage(
      "تأكيد تسجيل الخروج",
    ),
    "confirmOrder": MessageLookupByLibrary.simpleMessage("تأكيد الطلب"),
    "contactSupport": MessageLookupByLibrary.simpleMessage("التواصل مع الدعم"),
    "continuousUpdates": MessageLookupByLibrary.simpleMessage("تحديث مستمر"),
    "createAccount": MessageLookupByLibrary.simpleMessage("قم بإنشاء حساب "),
    "createNewAccount": MessageLookupByLibrary.simpleMessage("إنشاء حساب جديد"),
    "creatingAccount": MessageLookupByLibrary.simpleMessage(
      "جاري إنشاء الحساب...",
    ),
    "currencyShekel": MessageLookupByLibrary.simpleMessage("شيكل"),
    "date1March2026": MessageLookupByLibrary.simpleMessage("1 مارس 2026"),
    "date27Feb2026": MessageLookupByLibrary.simpleMessage("27 فبراير 2026"),
    "date2March2026": MessageLookupByLibrary.simpleMessage("2 مارس 2026"),
    "defaultUser": MessageLookupByLibrary.simpleMessage("مستخدم"),
    "deleteAll": MessageLookupByLibrary.simpleMessage("حذف الكل"),
    "deliveryFromLocation": MessageLookupByLibrary.simpleMessage(
      "التسليم من المكان",
    ),
    "deliveryLabel": MessageLookupByLibrary.simpleMessage("التوصيل  :"),
    "designMode": MessageLookupByLibrary.simpleMessage("الوضع"),
    "designedClearPurchaseExperience": MessageLookupByLibrary.simpleMessage(
      "لهذا صممنا تجربة شراء واضحة من اختيار المنتج حتى استلام الطلب.",
    ),
    "discount25": MessageLookupByLibrary.simpleMessage("خصم 25%"),
    "discount30": MessageLookupByLibrary.simpleMessage("خصم 30%"),
    "done": MessageLookupByLibrary.simpleMessage("تم"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage("لا تمتلك حساب؟ "),
    "easierFreshFruitShoppingExperience": MessageLookupByLibrary.simpleMessage(
      "تجربة أسهل لشراء الفواكه الطازجة",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "emailExample": MessageLookupByLibrary.simpleMessage("name@example.com"),
    "emailNotRegistered": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير مسجل مسبقًا.",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مطلوب",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterFullName": MessageLookupByLibrary.simpleMessage("أدخل الاسم الكامل"),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "expiry": MessageLookupByLibrary.simpleMessage("الصلاحية"),
    "failed": MessageLookupByLibrary.simpleMessage("فشل"),
    "failedToAddProductToFavorites": MessageLookupByLibrary.simpleMessage(
      "فشل إضافة المنتج للمفضلة",
    ),
    "failedToLoadFavorites": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل المفضلة",
    ),
    "failedToRemoveProductFromFavorites": MessageLookupByLibrary.simpleMessage(
      "فشل حذف المنتج من المفضلة",
    ),
    "failedToSendResetLink": MessageLookupByLibrary.simpleMessage(
      "فشل إرسال رابط إعادة التعيين.",
    ),
    "failedToUpdateData": MessageLookupByLibrary.simpleMessage(
      "تعذر تحديث البيانات",
    ),
    "fastDelivery": MessageLookupByLibrary.simpleMessage("توصيل سريع"),
    "favorites": MessageLookupByLibrary.simpleMessage("المفضلة"),
    "favoritesEmpty": MessageLookupByLibrary.simpleMessage("المفضلة فارغة"),
    "featuredProducts": MessageLookupByLibrary.simpleMessage(
      "المنتجات المميزة",
    ),
    "featuredProductsLoadedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحميل المنتجات المميزة بنجاح",
    ),
    "female": MessageLookupByLibrary.simpleMessage("أنثى"),
    "fieldRequired": MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
    "filtering": MessageLookupByLibrary.simpleMessage("الفلترة"),
    "finalTotal": MessageLookupByLibrary.simpleMessage("الإجمالي النهائي"),
    "floorAndApartmentNumber": MessageLookupByLibrary.simpleMessage(
      "رقم الطابق , رقم الشقه ..",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
    "forgotPasswordQuestion": MessageLookupByLibrary.simpleMessage(
      "نسيت كلمة المرور؟",
    ),
    "fromMyAccountThenLanguage": MessageLookupByLibrary.simpleMessage(
      "من \"حسابي\" ثم \"اللغة\"، اختر العربية أو الإنجليزية وسيتم تطبيقها فورًا.",
    ),
    "fromMyOrdersOpenOrder": MessageLookupByLibrary.simpleMessage(
      "من صفحة \"طلباتي\" افتح الطلب المطلوب وستجد تفاصيل الطلب والفاتورة.",
    ),
    "fruitDealsTitle": MessageLookupByLibrary.simpleMessage("خصم على الفواكه"),
    "fullName": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "fullNameRequired": MessageLookupByLibrary.simpleMessage(
      "الاسم الكامل مطلوب",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("الجنس"),
    "general": MessageLookupByLibrary.simpleMessage("عام"),
    "grapes": MessageLookupByLibrary.simpleMessage("عنب"),
    "guaranteedQuality": MessageLookupByLibrary.simpleMessage("جودة مضمونة"),
    "help": MessageLookupByLibrary.simpleMessage("المساعدة"),
    "helpSection": MessageLookupByLibrary.simpleMessage("الدعم"),
    "holidayOffers": MessageLookupByLibrary.simpleMessage("عروض العيد"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "howAddProductToFavorites": MessageLookupByLibrary.simpleMessage(
      "كيف أضيف منتج للمفضلة؟",
    ),
    "howCanWeHelpToday": MessageLookupByLibrary.simpleMessage(
      "كيف نقدر نساعدك اليوم؟",
    ),
    "howChangeLanguage": MessageLookupByLibrary.simpleMessage(
      "كيف أغير اللغة؟",
    ),
    "howTrackOrderStatus": MessageLookupByLibrary.simpleMessage(
      "كيف أتابع حالة طلبي؟",
    ),
    "ilsAmount": m0,
    "invalidCredentials": MessageLookupByLibrary.simpleMessage(
      "بيانات تسجيل الدخول غير صحيحة.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "صيغة البريد الإلكتروني غير صحيحة",
    ),
    "invoiceQr": MessageLookupByLibrary.simpleMessage("QR الفاتورة"),
    "kiwi": MessageLookupByLibrary.simpleMessage("كيوي"),
    "kmUnit": MessageLookupByLibrary.simpleMessage("كم"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "languageAppliedImmediatelyAfterSelection":
        MessageLookupByLibrary.simpleMessage(
          "سيتم تطبيق اللغة مباشرة بعد الاختيار.",
        ),
    "limitedTime": MessageLookupByLibrary.simpleMessage("لفترة محدودة"),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "male": MessageLookupByLibrary.simpleMessage("ذكر"),
    "microphoneAccessRequired": MessageLookupByLibrary.simpleMessage(
      "يجب السماح بالوصول إلى المايك",
    ),
    "monthsCount": m1,
    "more": MessageLookupByLibrary.simpleMessage("المزيد"),
    "mustAcceptTerms": MessageLookupByLibrary.simpleMessage(
      "يجب الموافقة على الشروط والأحكام",
    ),
    "myAccount": MessageLookupByLibrary.simpleMessage("حسابي"),
    "myOrders": MessageLookupByLibrary.simpleMessage("طلباتي"),
    "nameLettersOnly": MessageLookupByLibrary.simpleMessage(
      "الاسم يجب أن يحتوي على حروف فقط",
    ),
    "nameRequired": MessageLookupByLibrary.simpleMessage("الاسم مطلوب"),
    "nameTooShort": MessageLookupByLibrary.simpleMessage("الاسم قصير جدًا"),
    "newAccount": MessageLookupByLibrary.simpleMessage("حساب جديد"),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "noProductsInCart": MessageLookupByLibrary.simpleMessage(
      "لا يوجد منتجات في السلة",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "onboardingSubtitle1": MessageLookupByLibrary.simpleMessage(
      "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
    ),
    "onboardingSubtitle2": MessageLookupByLibrary.simpleMessage(
      "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
    ),
    "onlinePayment": MessageLookupByLibrary.simpleMessage("الدفع اونلاين"),
    "or": MessageLookupByLibrary.simpleMessage("أو"),
    "orangeFruit": MessageLookupByLibrary.simpleMessage("برتقال"),
    "orderDateLabel": m2,
    "orderIdLabel": MessageLookupByLibrary.simpleMessage("رقم الطلب"),
    "orderInvoice": MessageLookupByLibrary.simpleMessage("فاتورة الطلب"),
    "orderNumberLabel": m3,
    "orderSummary": MessageLookupByLibrary.simpleMessage("ملخص الطلب"),
    "orderSummaryLabel": m4,
    "ordersEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "عند تنفيذ أول طلب، سيظهر هنا.",
    ),
    "ordersEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات بعد",
    ),
    "ordersLoadFailedTitle": MessageLookupByLibrary.simpleMessage(
      "تعذر تحميل الطلبات",
    ),
    "organic": MessageLookupByLibrary.simpleMessage("اوجانيك"),
    "ourMission": MessageLookupByLibrary.simpleMessage("رسالتنا"),
    "ourProducts": MessageLookupByLibrary.simpleMessage("منتجاتنا"),
    "ourTermsAndConditions": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام الخاصة بنا",
    ),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "passwordMinLength": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور يجب أن تكون 6 أحرف على الأقل",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة",
    ),
    "passwordResetInstruction": MessageLookupByLibrary.simpleMessage(
      "سيتم ارسال رابط على بريدك الالكتروني لتتمكن من اعادة تعيين كلمة المرور",
    ),
    "passwordResetLinkSent": MessageLookupByLibrary.simpleMessage(
      "تم إرسال رابط إعادة تعيين كلمة المرور",
    ),
    "payWithStripe": MessageLookupByLibrary.simpleMessage("الدفع عبر Stripe"),
    "payment": MessageLookupByLibrary.simpleMessage("الدفع"),
    "paymentAmount": m5,
    "paymentDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "تفاصيل العملية",
    ),
    "paymentMethodLabel": m6,
    "paymentMethodLabelShort": MessageLookupByLibrary.simpleMessage(
      "طريقة الدفع",
    ),
    "paymentPendingStatus": MessageLookupByLibrary.simpleMessage(
      "بانتظار التأكيد",
    ),
    "paymentReceivedStatus": MessageLookupByLibrary.simpleMessage(
      "تم الاستلام",
    ),
    "paymentSuccessSubtitle": MessageLookupByLibrary.simpleMessage(
      "تم تأكيد عملية الدفع بنجاح",
    ),
    "paymentSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "تم الدفع بنجاح",
    ),
    "phoneExample": MessageLookupByLibrary.simpleMessage("05x xxx xxxx"),
    "phoneIncomplete": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف غير مكتمل",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "phoneRequired": MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
    "pineapple": MessageLookupByLibrary.simpleMessage("أناناس"),
    "pleaseSelectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "يرجي تحديد طريقه الدفع",
    ),
    "price": MessageLookupByLibrary.simpleMessage("السعر"),
    "productIdUnavailable": MessageLookupByLibrary.simpleMessage(
      "معرف المنتج غير متوفر",
    ),
    "products": MessageLookupByLibrary.simpleMessage("المنتجات"),
    "productsLoadedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحميل المنتجات بنجاح",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "profileInfo": MessageLookupByLibrary.simpleMessage("معلومات الحساب"),
    "profileSavedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم حفظ البيانات بنجاح",
    ),
    "rating": MessageLookupByLibrary.simpleMessage("التقييم"),
    "recentSearches": MessageLookupByLibrary.simpleMessage(
      "عمليات البحث الأخيرة",
    ),
    "redApple": MessageLookupByLibrary.simpleMessage("تفاح أحمر"),
    "reload": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "resultsCount": m7,
    "saveChanges": MessageLookupByLibrary.simpleMessage("حفظ التغييرات"),
    "saving": MessageLookupByLibrary.simpleMessage("جاري الحفظ..."),
    "search": MessageLookupByLibrary.simpleMessage("البحث"),
    "searchAndShop": MessageLookupByLibrary.simpleMessage("ابحث وتسوق"),
    "searchByVoiceOrTyping": MessageLookupByLibrary.simpleMessage(
      "ابحث صوتيًا أو كتابة...",
    ),
    "securePayment": MessageLookupByLibrary.simpleMessage("دفع آمن"),
    "sending": MessageLookupByLibrary.simpleMessage("جاري الإرسال..."),
    "shekelPerKilo": m8,
    "shipping": MessageLookupByLibrary.simpleMessage("الشحن"),
    "shippingAddress": MessageLookupByLibrary.simpleMessage("عنوان التوصيل"),
    "shopNow": MessageLookupByLibrary.simpleMessage("تسوق الان"),
    "shoppingCart": MessageLookupByLibrary.simpleMessage("سلة التسوق"),
    "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "signInCancelled": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء تسجيل الدخول",
    ),
    "signInSuccessful": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الدخول بنجاح",
    ),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "تسجيل بواسطة جوجل",
    ),
    "signedInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الدخول باستخدام Google",
    ),
    "signingIn": MessageLookupByLibrary.simpleMessage("جاري تسجيل الدخول..."),
    "skip": MessageLookupByLibrary.simpleMessage("تخط"),
    "somethingWentWrongTryAgain": MessageLookupByLibrary.simpleMessage(
      "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.",
    ),
    "sorryDataUnavailableNow": MessageLookupByLibrary.simpleMessage(
      "عفوًا... هذه المعلومات غير متوفرة للحظة",
    ),
    "startNow": MessageLookupByLibrary.simpleMessage("ابدأ الان"),
    "statusLabel": MessageLookupByLibrary.simpleMessage("الحالة"),
    "strawberry": MessageLookupByLibrary.simpleMessage("فراولة"),
    "stripe": MessageLookupByLibrary.simpleMessage("Stripe"),
    "subtotal": MessageLookupByLibrary.simpleMessage("المجموع"),
    "subtotalLabel": MessageLookupByLibrary.simpleMessage("المجموع الفرعي :"),
    "success": MessageLookupByLibrary.simpleMessage("نجاح"),
    "supportHours": MessageLookupByLibrary.simpleMessage(
      "من 9:00 صباحًا حتى 10:00 مساءً",
    ),
    "tapHeartIconInProductCard": MessageLookupByLibrary.simpleMessage(
      "اضغط على أيقونة القلب داخل بطاقة المنتج، وسيظهر المنتج مباشرة في صفحة المفضلة.",
    ),
    "termsAcceptancePrefix": MessageLookupByLibrary.simpleMessage(
      "من خلال إنشاء حساب ، فإنك توافق على ",
    ),
    "termsAndConditions": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام",
    ),
    "termsAndConditionsContent": MessageLookupByLibrary.simpleMessage(
      "مرحبا بك في تطبيقنا!\n\nيرجى قراءة الشروط والأحكام التالية بعناية قبل استخدام التطبيق:\n\n1. استخدام التطبيق يعني موافقتك على هذه الشروط.\n2. لا يجوز استخدام التطبيق لأي أغراض غير قانونية.\n3. نحن غير مسؤولين عن أي خسائر ناتجة عن استخدام التطبيق.\n4. المحتوى المعروض في التطبيق محمي بحقوق الطبع والنشر.\n5. يحق لنا تعديل الشروط في أي وقت، ويكون التعديل ساري المفعول فور نشره.\n6. إذا لم توافق على هذه الشروط، يُرجى عدم استخدام التطبيق.\n\nشكرًا لاستخدامك تطبيقنا!",
    ),
    "thanksForTrustingFruitHub": MessageLookupByLibrary.simpleMessage(
      "شكرًا لثقتك بـ FruitHub",
    ),
    "thisEmailIsNotRegistered": MessageLookupByLibrary.simpleMessage(
      "هذا البريد غير مسجل.",
    ),
    "totalLabel": MessageLookupByLibrary.simpleMessage("الكلي"),
    "unexpectedErrorTryAgain": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير متوقع، الرجاء المحاولة مرة أخرى.",
    ),
    "unexpectedErrorTryLater": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير متوقع، الرجاء المحاولة لاحقًا.",
    ),
    "updateDataHint": MessageLookupByLibrary.simpleMessage(
      "حدّث بياناتك وسيتم حفظها محليًا.",
    ),
    "vegetableDealsTitle": MessageLookupByLibrary.simpleMessage(
      "خصم على الخضروات",
    ),
    "viewOrders": MessageLookupByLibrary.simpleMessage("عرض الطلبات"),
    "weBelieveFreshProductsShouldBeSimpleAndFast":
        MessageLookupByLibrary.simpleMessage(
          "نؤمن أن الوصول إلى منتجات طازجة بجودة عالية يجب أن يكون بسيطًا وسريعًا لكل بيت.",
        ),
    "weContinuouslyImproveApp": MessageLookupByLibrary.simpleMessage(
      "نطوّر التطبيق باستمرار بناءً على ملاحظاتكم ونضيف مزايا جديدة لتحسين تجربة التسوق يومًا بعد يوم.",
    ),
    "weFocusOnTransparentPricing": MessageLookupByLibrary.simpleMessage(
      "نركز على وضوح الأسعار، سهولة الدفع، وسلاسة التتبع.",
    ),
    "weWorkWithTrustedSuppliers": MessageLookupByLibrary.simpleMessage(
      "نعمل مع موردين موثوقين ونراجع جودة الطلبات قبل الشحن.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("مرحبا بك !.."),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("مرحبًا بك في"),
    "whatIfPaymentIssue": MessageLookupByLibrary.simpleMessage(
      "ماذا أفعل إذا واجهت مشكلة في الدفع؟",
    ),
    "whatWeCommitTo": MessageLookupByLibrary.simpleMessage("ما نلتزم به"),
    "whyFruitHub": MessageLookupByLibrary.simpleMessage("لماذا FruitHub؟"),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
    "youHaveItemsInCart": m9,
  };
}
