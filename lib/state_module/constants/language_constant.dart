List<Language> languageList = [
  Language(),
  Khmer(),
  Chinese(),
];

class Language{
  String get mainPage => "Main Page";
  String get detailPage => "Detail Page";
  String get home => "Home Page";
  String get changeToDark => "Change To Dark Mode";
  String get language => "Language";
  String get changeToEnglish => "Change to English";
  String get changeToKhmer => "ប្តូរភាសាខ្មែរ";
}

class Khmer implements Language{
  String get mainPage => "ទំព័រគោល";
  String get detailPage => "ទំព័រលំអិត";
  String get home => "ទំព័រដើម";
  String get changeToDark => "ប្តូរទៅងងឹត";
  String get language => "ភាសា";
  String get changeToEnglish => "Change to English";
  String get changeToKhmer => "ប្តូរភាសាខ្មែរ";
}

class Chinese implements Language{
  String get mainPage => "主页";
  String get detailPage => "详情页";
  String get home => "主页";
  String get changeToDark => "更改为深色模式";
  String get language => "语";
  String get changeToEnglish => "Change to English";
  String get changeToKhmer => "ប្តូរភាសាខ្មែរ";
}