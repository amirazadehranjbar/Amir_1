/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/edite_profile.png
  AssetGenImage get editeProfile =>
      const AssetGenImage('assets/icons/edite_profile.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/pencil.png
  AssetGenImage get pencil => const AssetGenImage('assets/icons/pencil.png');

  /// File path: assets/icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/profile.png');

  /// File path: assets/icons/user.gif
  AssetGenImage get user => const AssetGenImage('assets/icons/user.gif');

  /// File path: assets/icons/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/icons/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [editeProfile, home, pencil, profile, user, welcome];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesCategoryGen get category => const $AssetsImagesCategoryGen();

  /// File path: assets/images/conf.jpg
  AssetGenImage get conf => const AssetGenImage('assets/images/conf.jpg');

  /// File path: assets/images/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/images/hashtag.png');

  /// File path: assets/images/logo.jpg
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.jpg');

  /// File path: assets/images/youtube.png
  AssetGenImage get youtube => const AssetGenImage('assets/images/youtube.png');

  /// List of all assets
  List<AssetGenImage> get values => [conf, hashtag, logo, youtube];
}

class $AssetsImagesCategoryGen {
  const $AssetsImagesCategoryGen();

  /// File path: assets/images/category/hearingLoss_1.png
  AssetGenImage get hearingLoss1 =>
      const AssetGenImage('assets/images/category/hearingLoss_1.png');

  /// File path: assets/images/category/hearingLoss_2.png
  AssetGenImage get hearingLoss2 =>
      const AssetGenImage('assets/images/category/hearingLoss_2.png');

  /// File path: assets/images/category/hearingLoss_3.png
  AssetGenImage get hearingLoss3 =>
      const AssetGenImage('assets/images/category/hearingLoss_3.png');

  /// File path: assets/images/category/hearingLoss_4.png
  AssetGenImage get hearingLoss4 =>
      const AssetGenImage('assets/images/category/hearingLoss_4.png');

  /// File path: assets/images/category/hearingLoss_5.png
  AssetGenImage get hearingLoss5 =>
      const AssetGenImage('assets/images/category/hearingLoss_5.png');

  /// File path: assets/images/category/hearingLoss_6.png
  AssetGenImage get hearingLoss6 =>
      const AssetGenImage('assets/images/category/hearingLoss_6.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        hearingLoss1,
        hearingLoss2,
        hearingLoss3,
        hearingLoss4,
        hearingLoss5,
        hearingLoss6
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
