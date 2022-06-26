//to save all the data app that needs to be accessed accross all the pages
import 'package:cat_management/data/repositories/cat_holder_repository.dart';
import 'package:flamingo/flamingo.dart';

import '../entities/cat_holder.dart';

class Application {
  static final Application _application = Application._internal();

  static DocumentAccessor? documentAccessor;

  //connected catholder in the app
  static CatHolder? catHolder;

  factory Application() {
    return _application;
  }

  Application._internal();

  static void init() {
    documentAccessor = DocumentAccessor();
  }

  static Future loadCatHolder() async {
    // let's randomly load a catHolder
    return await CatHolderRepository.getARandomCatHolder();
  }
}
