/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Black.ttf
  String get poppinsBlack => 'assets/fonts/Poppins-Black.ttf';

  /// File path: assets/fonts/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';

  /// File path: assets/fonts/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'assets/fonts/Poppins-ExtraBold.ttf';

  /// File path: assets/fonts/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'assets/fonts/Poppins-ExtraLight.ttf';

  /// File path: assets/fonts/Poppins-Italic.ttf
  String get poppinsItalic => 'assets/fonts/Poppins-Italic.ttf';

  /// File path: assets/fonts/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/Poppins-Light.ttf';

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// File path: assets/fonts/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/Poppins-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        poppinsBlack,
        poppinsBold,
        poppinsExtraBold,
        poppinsExtraLight,
        poppinsItalic,
        poppinsLight,
        poppinsMedium,
        poppinsRegular,
        poppinsSemiBold,
        poppinsThin
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/images/ic_launcher.png');

  /// File path: assets/images/ic_launcher_foreground.png
  AssetGenImage get icLauncherForeground =>
      const AssetGenImage('assets/images/ic_launcher_foreground.png');

  /// File path: assets/images/ic_launcher_foreground_stg.png
  AssetGenImage get icLauncherForegroundStg =>
      const AssetGenImage('assets/images/ic_launcher_foreground_stg.png');

  /// File path: assets/images/ic_launcher_stg.png
  AssetGenImage get icLauncherStg =>
      const AssetGenImage('assets/images/ic_launcher_stg.png');

  /// File path: assets/images/ic_logo.png
  AssetGenImage get icLogo => const AssetGenImage('assets/images/ic_logo.png');

  /// File path: assets/images/ic_splash.png
  AssetGenImage get icSplash =>
      const AssetGenImage('assets/images/ic_splash.png');

  /// File path: assets/images/logo-dark.svg
  String get logoDark => 'assets/images/logo-dark.svg';

  /// List of all assets
  List<dynamic> get values => [
        icLauncher,
        icLauncherForeground,
        icLauncherForegroundStg,
        icLauncherStg,
        icLogo,
        icSplash,
        logoDark
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
