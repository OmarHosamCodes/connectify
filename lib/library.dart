// ignore_for_file: directives_ordering

//* Screens
export 'firebase_options.dart';
export 'view/screen/home_screen.dart';
export 'view/screen/auth/login_screen.dart';
export 'view/screen/auth/register_screen.dart';
export 'view/screen/auth/auth_screen.dart';
export 'view/screen/routing_screen.dart';
export 'view/screen/profile_screen.dart';
export 'view/screen/setting_screen.dart';

//* Widgets
export 'view/widget/public/custom_button.dart';
export 'view/widget/public/custom_text.dart';
export 'view/widget/public/custom_textfield.dart';
export 'view/widget/public/custom_gap.dart';
export 'view/widget/public/custom_popups.dart';
export 'view/widget/public/custom_drawer.dart';
export 'view/widget/public/custom_image.dart.dart';

//* Models
export 'model/user_model.dart';

//* Extensions
export 'extension/position_converter.dart';
export 'extension/dimensions.dart';
export 'extension/logger.dart';

//* Constants
export 'constant/string/routes_constants.dart';
export 'constant/simple_constants.dart';

//* Controllers
export 'controller/routing_controller.dart';
export 'controller/map_controller.dart';
export 'controller/auth_controller.dart';

//* Providers
export 'controller/provider/user_type_provider.dart';
export 'controller/provider/map_provider.dart';
//* Packages
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:flutter/foundation.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:flutter/material.dart';
export 'package:go_router/go_router.dart';
// export 'package:eva_icons_flutter/eva_icons_flutter.dart';
// export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart'
    hide describeIdentity, shortHash;
// export 'dart:io';
// export 'package:image_picker/image_picker.dart';
// export 'package:permission_handler/permission_handler.dart';
// export 'package:uuid/uuid.dart';
// export 'package:chewie/chewie.dart';
// export 'package:video_player/video_player.dart';
// export 'package:lottie/lottie.dart';
// export 'package:curved_navigation_bar/curved_navigation_bar.dart';

export 'package:geolocator/geolocator.dart';
export 'package:google_maps_flutter/google_maps_flutter.dart';
export 'package:cached_network_image/cached_network_image.dart';
