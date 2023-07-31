export './appwrite_constants.dart';
export './assets_constants.dart';
export './ui_constants.dart';

//By exporting above files path we can decrease the imports lines
//for example in main.dart file we want to use appwrite_constants and assets_constants 
//for this we need import both paths which can take 2 lines
//So, by exporting these paths here 
//we can just import one path i.e import"constants.dart"
//Finally, we are able to decrease 2 lines to 1 line