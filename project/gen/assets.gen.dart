/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $ConfigGen {
  const $ConfigGen();

  /// Directory path: config/assets
  $ConfigAssetsGen get assets => const $ConfigAssetsGen();
}

class $ConfigAssetsGen {
  const $ConfigAssetsGen();

  /// Directory path: config/assets/env
  $ConfigAssetsEnvGen get env => const $ConfigAssetsEnvGen();

  /// Directory path: config/assets/lang
  $ConfigAssetsLangGen get lang => const $ConfigAssetsLangGen();

  /// File path: config/assets/launcher.png
  AssetGenImage get launcher =>
      const AssetGenImage('config/assets/launcher.png');

  /// List of all assets
  List<AssetGenImage> get values => [launcher];
}

class $ConfigAssetsEnvGen {
  const $ConfigAssetsEnvGen();

  /// File path: config/assets/env/.env.dev
  String get aEnvDev => 'config/assets/env/.env.dev';

  /// File path: config/assets/env/.env.prod
  String get aEnvProd => 'config/assets/env/.env.prod';

  /// File path: config/assets/env/.env.staging
  String get aEnvStaging => 'config/assets/env/.env.staging';

  /// List of all assets
  List<String> get values => [aEnvDev, aEnvProd, aEnvStaging];
}

class $ConfigAssetsLangGen {
  const $ConfigAssetsLangGen();

  /// File path: config/assets/lang/en.json
  String get en => 'config/assets/lang/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class Assets {
  Assets._();

  static const $ConfigGen config = $ConfigGen();
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
    bool gaplessPlayback = true,
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
