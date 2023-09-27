import 'package:ecommerce/Screens/bloc/ItemDetailsBloc/item_details_bloc.dart';
import 'package:ecommerce/Screens/bloc/ShoppingItemsBloc/shopping_iitems_bloc.dart';
import 'package:ecommerce/Screens/bloc/UserDetailsBloc/user_details_bloc.dart';
import 'package:ecommerce/Screens/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/Screens/bloc/get_address_bloc.dart';
import 'package:ecommerce/Screens/bloc/order_details_bloc.dart';
import 'package:ecommerce/Screens/bloc/order_place_bloc.dart';
import 'package:ecommerce/Screens/bloc/orders_bloc.dart';
import 'package:ecommerce/Screens/bloc/save_address_bloc.dart';
import 'package:ecommerce/Screens/bloc/wish_list_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/bloc/Authentictionbloc/login_signup_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => ShoppingItemsBloc(),
        ),
        BlocProvider(
          create: (context) => ItemDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => UserDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => AddToCartBloc(),
        ),
        BlocProvider(
          create: (context) => SaveAddressBloc(),
        ),
        BlocProvider(
          create: (context) => GetAddressBloc(),
        ),
        BlocProvider(
          create: (context) => OrderPlaceBloc(),
        ),
        BlocProvider(
          create: (context) => OrdersBloc(),
        ),
        BlocProvider(
          create: (context) => OrderTrackingDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => WishListBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
