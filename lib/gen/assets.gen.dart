/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesRastersGen get rasters => const $AssetsImagesRastersGen();
  $AssetsImagesVectorsGen get vectors => const $AssetsImagesVectorsGen();
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/image-loading.json
  LottieGenImage get imageLoading =>
      const LottieGenImage('assets/lotties/image-loading.json');

  /// File path: assets/lotties/lovely-cat.json
  LottieGenImage get lovelyCat =>
      const LottieGenImage('assets/lotties/lovely-cat.json');

  /// File path: assets/lotties/no-internet-connection.json
  LottieGenImage get noInternetConnection =>
      const LottieGenImage('assets/lotties/no-internet-connection.json');

  /// File path: assets/lotties/server-error.json
  LottieGenImage get serverError =>
      const LottieGenImage('assets/lotties/server-error.json');

  /// File path: assets/lotties/sleeping-cat.json
  LottieGenImage get sleepingCat =>
      const LottieGenImage('assets/lotties/sleeping-cat.json');

  /// File path: assets/lotties/wrong.json
  LottieGenImage get wrong => const LottieGenImage('assets/lotties/wrong.json');

  /// List of all assets
  List<LottieGenImage> get values => [
        imageLoading,
        lovelyCat,
        noInternetConnection,
        serverError,
        sleepingCat,
        wrong
      ];
}

class $AssetsImagesRastersGen {
  const $AssetsImagesRastersGen();

  /// File path: assets/images/rasters/image-error.png
  AssetGenImage get imageError =>
      const AssetGenImage('assets/images/rasters/image-error.png');

  /// List of all assets
  List<AssetGenImage> get values => [imageError];
}

class $AssetsImagesVectorsGen {
  const $AssetsImagesVectorsGen();

  /// File path: assets/images/vectors/arrow-ios-back.svg
  SvgGenImage get arrowIosBack =>
      const SvgGenImage('assets/images/vectors/arrow-ios-back.svg');

  /// File path: assets/images/vectors/bag.svg
  SvgGenImage get bag => const SvgGenImage('assets/images/vectors/bag.svg');

  /// File path: assets/images/vectors/check.png
  AssetGenImage get check =>
      const AssetGenImage('assets/images/vectors/check.png');

  /// File path: assets/images/vectors/connection-lost.svg
  SvgGenImage get connectionLost =>
      const SvgGenImage('assets/images/vectors/connection-lost.svg');

  /// File path: assets/images/vectors/forward-arrow.svg
  SvgGenImage get forwardArrow =>
      const SvgGenImage('assets/images/vectors/forward-arrow.svg');

  /// File path: assets/images/vectors/internal-server-error.svg
  SvgGenImage get internalServerError =>
      const SvgGenImage('assets/images/vectors/internal-server-error.svg');

  /// File path: assets/images/vectors/server-error.svg
  SvgGenImage get serverError =>
      const SvgGenImage('assets/images/vectors/server-error.svg');

  /// File path: assets/images/vectors/something-went-wrong.svg
  SvgGenImage get somethingWentWrong =>
      const SvgGenImage('assets/images/vectors/something-went-wrong.svg');

  /// List of all assets
  List<dynamic> get values => [
        arrowIosBack,
        bag,
        check,
        connectionLost,
        forwardArrow,
        internalServerError,
        serverError,
        somethingWentWrong
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
