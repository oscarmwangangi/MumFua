import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

// Colors
const Color kPrimaryColor = Color(0xFF7B2CBF);
const Color kBackgroundColor = Colors.white;
const Color kTextColor = Colors.black;
const Color kSecondaryTextColor = Colors.black87;
const Color kGreyTextColor = Colors.grey;
const Color kRatingStarColor = Colors.amber;
const Color kUserLocationMarkerColor = Colors.blue;
final Color kAvatarBackgroundColor = kPrimaryColor.withValues(alpha: 0.1);

// Text Styles
const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 27,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const TextStyle kHeaderHighlightStyle = TextStyle(
  fontSize: 27,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

const TextStyle kSubTitleTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.black54,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 16,
);

const TextStyle kLocationTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const TextStyle kLocationSubTitleTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
);

const TextStyle kActionTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

const TextStyle kCardTitleTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const TextStyle kPricePrefixTextStyle = TextStyle(
  fontSize: 13,
  color: kGreyTextColor,
  fontWeight: FontWeight.w600,
);

const TextStyle kPriceTextStyle = TextStyle(
  fontSize: 13,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const TextStyle kRatingTextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w600,
);

const TextStyle kDistanceTextStyle = TextStyle(
  fontSize: 13,
  color: kGreyTextColor,
);

// Map Constants
const String kMapTileUrlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
const String kMapUserAgentPackageName = 'com.example.mam_fua';
const LatLng kDefaultUserPosition = LatLng(-1.2921, 36.8219);
const double kDefaultMapZoom = 15.0;
const double kMarkerDimension = 40.0;
const double kUserLocationIconSize = 30.0;
const double kMamFuaMarkerIconSize = 36.0;

// Border Radius
final BorderRadius kDefaultBorderRadius = BorderRadius.circular(12.0);
final BorderRadius kCardBorderRadius = BorderRadius.circular(16.0);

// Spacings & Insets
const double kAppBarHeight = 90.0;
const EdgeInsets kCardListPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
const SizedBox kCardSeparator = SizedBox(height: 12);
const SizedBox kSizedBoxHeight6 = SizedBox(height: 6);
const SizedBox kSizedBoxHeight8 = SizedBox(height: 8);
const SizedBox kSizedBoxWidth2 = SizedBox(width: 2);
const SizedBox kSizedBoxWidth4 = SizedBox(width: 4);
const SizedBox kSizedBoxWidth6 = SizedBox(width: 6);
const SizedBox kSizedBoxWidth8 = SizedBox(width: 8);
const SizedBox kSizedBoxWidth12 = SizedBox(width: 12);
const SizedBox kSizedBoxWidth14 = SizedBox(width: 14);

// Dimensions & Durations
const double kAvatarRadius = 28.0;
const double kAvatarIconSize = 32.0;
const Duration kSnackBarDuration = Duration(seconds: 2);

// Button Styles
final ButtonStyle kPrimaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: kDefaultBorderRadius,
  ),
);

final ButtonStyle kSecondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: kPrimaryColor,
  elevation: 0,
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  shape: RoundedRectangleBorder(
    borderRadius: kDefaultBorderRadius,
  ),
);

// Reusable Custom Button Widgets
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kPrimaryButtonStyle,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: kButtonTextStyle),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 20),
          ],
        ],
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kSecondaryButtonStyle,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: kButtonTextStyle),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 20),
          ],
        ],
      ),
    );
  }
}
