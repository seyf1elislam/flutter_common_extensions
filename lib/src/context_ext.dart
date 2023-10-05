import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
 this File clone from repo :https://github.com/seyf1elislam
*/
extension Blocsr on BuildContext {
  // NotesCubit get noteCubit => BlocProvider.of<NotesCubit>(this);
  T cubit<T extends Cubit>() => BlocProvider.of<T>(this);
  T bloc<T extends Bloc>() => BlocProvider.of<T>(this);
}

extension Navigation on BuildContext {
  push(page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  pop() {
    Navigator.of(this).pop();
  }

  popAll() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  double get bottomViewInset => MediaQuery.of(this).viewInsets.bottom;
  EdgeInsets get viewInset => MediaQuery.of(this).viewInsets;
}

extension BuildContextSizesExtension<T> on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 &&
      MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 &&
      MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;
}

//!=================================================================
//!==================Theme=========================================
//!=================================================================
extension BuildContextThemeExtension<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
      letterSpacing: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 13.0,
      height: 1.23);
}

//!=================================================================
//!=================================================================
//!=================================================================
//!=================================================================
//!=================================================================
//!=================================================================

extension BuildContextEntensionColor<T> on BuildContext {
  // colors
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.background;
}

//!+==============================
//!+==============================
//!+==============================
//!+==============================
extension BuildContextEntensionPopup<T> on BuildContext {
  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }

  Future<T?> showDialogWidget<T>({
    Widget? child,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      builder: (BuildContext context) {
        return Dialog(
          child: child,
        );
      },
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message,
      {SnackBarBehavior behavior = SnackBarBehavior.floating,
      bool removeCurrentSnackBar = false}) {
    if (removeCurrentSnackBar) {
      ScaffoldMessenger.of(this)
          .removeCurrentSnackBar(reason: SnackBarClosedReason.remove);
    }
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  // uncomment this if u want when u
  // showtoast(message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: primary,
  //       // textColor: Colors.white,
  //       fontSize: 16.0);
  // }
}
