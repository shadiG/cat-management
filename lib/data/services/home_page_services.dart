import 'package:cat_management/data/factories/cat_factory.dart';
import 'package:cat_management/data/factories/cat_holder_factory.dart';
import 'package:cat_management/data/factories/featured_cat_factory.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/app_config.dart';
import '../others/application.dart';
import '../repositories/cat_holder_repository.dart';

class HomePageServices {
  static Future appInitialization() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Flamingo
        .initializeApp(); // flamingo initialize Firebase at the same time
    Application.init();

    await appDefaultDataCreation();

    // let's randomly load a catHolder
    CatHolderRepository.getARandomCatHolder().then((value) {
      Application.catHolder = value;
    });
  }

  static Future appDefaultDataCreation() async {
    if (AppConfig.createDefaultUsers) {
      await CatHolderFactory.createCatHolders();
    }
    if (AppConfig.createDefaultCat) {
      await CatFactory.createCats();
    }
    if (AppConfig.createDefaultFeaturedCat) {
      await FeaturedCatFactory.createFeaturedCats();
    }
  }
}
