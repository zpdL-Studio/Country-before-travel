import 'package:country_before_travel/res/values.dart' as R;
import 'package:flutter/material.dart';

/// PANTONE COLOR OF THE YEAR 2021 / PALETTE EXPLORATION
/// AVIARY
/// Aviary is a lively and joyful grouping of color emblematic of vibrant and eye-catching rich bird plumage. PANTONE 17-5104 Ultimate Gray brings a natural element to this upbeat palette of cheery brights that includes PANTONE 13-0647 Illuminating, while the contrast of a lofty white PANTONE 11-4201 Cloud Dancer injects drama.
ThemeData get themeAviary {
  return ThemeData(
    primaryColor: R.color.ultimate_gray,
    backgroundColor: R.color.cloud_dance,
    accentColor: R.color.illuminating,
  );
}