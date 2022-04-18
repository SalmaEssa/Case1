import 'package:rxdart/rxdart.dart';

class AppStrings {
  static PublishSubject<String> langChangedSubject = PublishSubject();
  static String currentCode = CodeStrings.englishCode;

  static final Map<String, Map<String, String>> _translationsMap = {
    CodeStrings.englishCode: {
      'updateApp': 'Update app',
      'saveChanges': 'Save Changes',
      'or': 'Or',
      'logIn': 'log in',
      'email': 'email',
      'password': 'password',
      'signUp': 'Sign Up',
      'requeired': ' is requeired',
      'fullName': 'Full Name',
      'name': 'Name',
      'passNotMatched': "Passwords do not match",
      'confirmPassword': "Confirm Password",
      'somethingWentWrong': 'Something went wrong',
    },
    CodeStrings.arabicCode: {
      'somethingWentWrong': 'حدث خطأ',
      'confirmPassword': "تأكيد الرمز السري",
      'fullName': 'الاسم بالكامل',
      'name': 'الاسم',
      'passNotMatched': "الرمز السري لا يتطابق",
      'requeired': 'مطلوب',
      'password': 'الرمز سري',
      'email': 'ايميل',
      'logIn': 'تسجيل الدخول',
      'or': 'او',
      'saveChanges': 'حفظ التغيرات',
      'selectDateLable': "إضغظ لتحديد التاريخ",
    },
  };
  static String get somethingWentWrong =>
      _translationsMap[currentCode]?["somethingWentWrong"] ?? '';
  static String get confirmPassword =>
      _translationsMap[currentCode]?["confirmPassword"] ?? "";
  static String get fullName =>
      _translationsMap[currentCode]?["fullName"] ?? "";
  static String get name => _translationsMap[currentCode]?["name"] ?? "";

  static String get passNotMatched =>
      _translationsMap[currentCode]?["passNotMatched"] ?? "";

  static String get requeired =>
      _translationsMap[currentCode]?["requeired"] ?? "";

  static String get signUp => _translationsMap[currentCode]?["signUp"] ?? "";
  static String get password =>
      _translationsMap[currentCode]?["password"] ?? "";

  static String get email => _translationsMap[currentCode]?["email"] ?? "";

  static String get logIn => _translationsMap[currentCode]?["logIn"] ?? "";
  static String get or => _translationsMap[currentCode]?["or"] ?? "";
  static String get saveChanges =>
      _translationsMap[currentCode]?["saveChanges"] ?? "";
  static String get selectDateLable =>
      _translationsMap[currentCode]?["selectDateLable"] ?? "";
}

class CodeStrings {
  /* Language Params */
  static const String englishCode = "en";
  static const String arabicCode = "ar";
  static const String english = "English";
}

class AssetStrings {
  static const String logo = "assets/images/logo.png";
  static const String google = "assets/images/google.png";
  static const String background = "assets/images/th.jpg";
}
