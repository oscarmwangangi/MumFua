import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mam_fua/core/constants.dart';
import 'package:mam_fua/pages/customer/App/workerProfile.dart';
import 'package:mam_fua/pages/customer/data/mamFua.dart';

class CustomerHomeScreen extends StatefulWidget {
  static const String id = 'customer_home_screen';

  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  LatLng _userPosition = kDefaultUserPosition;
  bool _isLoading = true;

  final List<MamFua> _mamfuaList = kMamFuaList;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  String _distanceText(MamFua mamFua) {
    final meters = Geolocator.distanceBetween(
      _userPosition.latitude,
      _userPosition.longitude,
      mamFua.position.latitude,
      mamFua.position.longitude,
    );

    if (meters < 1000) {
      return "${meters.round()} m away";
    }
    return "${(meters / 1000).toStringAsFixed(1)} km away";
  }

  Future<void> _getUserLocation() async {
    try {
      final serviceEnable = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnable) {
        if (mounted) setState(() => _isLoading = false);
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) setState(() => _isLoading = false);
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      if (mounted) {
        setState(() {
          _userPosition = LatLng(position.latitude, position.longitude);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(child: CircularProgressIndicator(color: kPrimaryColor)),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: kAppBarHeight,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Column(
          children: [
            const Text("Location", style: kLocationTitleTextStyle),
            kSizedBoxHeight8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: kPrimaryColor),
                    kSizedBoxWidth6,
                    Text(
                      "Kasarani, Nairobi",
                      style: kLocationSubTitleTextStyle,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text("Change", style: kActionTextStyle),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Map section takes 1/4 of remaining screen
          Expanded(
            flex: 1,
            child: ClipRRect(
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: _userPosition,
                  initialZoom: kDefaultMapZoom,
                ),
                children: [
                  TileLayer(
                    urlTemplate: kMapTileUrlTemplate,
                    userAgentPackageName: kMapUserAgentPackageName,
                  ),
                  MarkerLayer(
                    markers: [
                      // User location marker
                      Marker(
                        point: _userPosition,
                        width: kMarkerDimension,
                        height: kMarkerDimension,
                        child: const Icon(
                          Icons.my_location,
                          color: kUserLocationMarkerColor,
                          size: kUserLocationIconSize,
                        ),
                      ),
                      // MamFua markers
                      ..._mamfuaList.map(
                        (mfua) => Marker(
                          point: mfua.position,
                          width: kMarkerDimension,
                          height: kMarkerDimension,
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(mfua.name),
                                  duration: kSnackBarDuration,
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                              size: kMamFuaMarkerIconSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Cards list section takes 3/4 of remaining screen
          Expanded(
            flex: 3,
            child: ListView.separated(
              padding: kCardListPadding,
              itemCount: _mamfuaList.length,
              separatorBuilder: (context, index) => kCardSeparator,
              itemBuilder: (context, index) {
                final mfua = _mamfuaList[index];
                return MamFuaCard(mamFua: mfua, distance: _distanceText(mfua));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MamFuaCard extends StatelessWidget {
  final MamFua mamFua;
  final String distance;

  const MamFuaCard({super.key, required this.mamFua, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBackgroundColor,
      borderRadius: kCardBorderRadius,
      child: InkWell(
        borderRadius: kCardBorderRadius,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkerprofileScreen()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: kAvatarRadius,
                backgroundColor: kAvatarBackgroundColor,
                child: const Icon(
                  Icons.person,
                  color: kPrimaryColor,
                  size: kAvatarIconSize,
                ),
              ),
              kSizedBoxWidth14,

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(mamFua.name, style: kCardTitleTextStyle),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "From KSh ",
                                style: kPricePrefixTextStyle,
                              ),
                              TextSpan(
                                text: mamFua.price,
                                style: kPriceTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    kSizedBoxHeight6,
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: kRatingStarColor,
                          size: 18,
                        ),
                        kSizedBoxWidth4,
                        Text(mamFua.rating.toString(), style: kRatingTextStyle),
                        kSizedBoxWidth12,
                        const Icon(
                          Icons.location_on_outlined,
                          color: kGreyTextColor,
                          size: 16,
                        ),
                        kSizedBoxWidth2,
                        Text(distance, style: kDistanceTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
