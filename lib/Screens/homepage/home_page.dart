import 'package:ecommerce/Screens/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/Screens/homepage/shop_by_cetegory.dart';
import 'package:ecommerce/Screens/product_screens/checkout_screen.dart';
import 'package:ecommerce/Screens/product_screens/empty_cart_screen.dart';
import 'package:ecommerce/Screens/profile/my_favorite.dart';
import 'package:ecommerce/Screens/bloc/ShoppingItemsBloc/shopping_iitems_bloc.dart';
import 'package:ecommerce/Screens/bloc/UserDetailsBloc/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../common_widgets/item_card.dart';
import '../../common_widgets/two_text_widget.dart';
import '../product_screens/prodcut_details.dart';
import 'orders_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Itemcard> clothitems = [];
  List<Itemcard> accessoriesitems = [];
  List<Itemcard> beautyitems = [];
  List<Itemcard> shoesitems = [];
  @override
  void initState() {
    // TODO: implement initState
    initialize();
    super.initState();
  }

  initialize() {
    context.read<UserDetailsBloc>().add(finduserdetails());
    context.read<ShoppingItemsBloc>().add(ClothShoppingItems());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 29,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<UserDetailsBloc, UserDetailsState>(
                    builder: (context, state) {
                      String name = "";
                      if (state is UserDetailsLoadingDone) {
                        String firstname = state.userdetails.firstname[0];
                        String lastname = state.userdetails.lastname[0];
                        name = "$firstname$lastname ";
                      }
                      return Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffE5D8F6)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 11),
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GT-Bold',
                                fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 170,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      autofocus: false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xff050505),
                        ),
                        hintText: 'Search',
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(100)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 11),
                      child: BlocListener<AddToCartBloc, AddToCartState>(
                        listener: (context, state) {
                          if (state is AddToCartIsEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EmptyScreen()));
                          } else if (state is AddToCartIsNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckOut()));
                          }
                        },
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckOut()));
                            },
                            child: SvgPicture.asset('images/shop.svg')),
                      )),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              TwoTextWidget(
                firsttext: 'Shop by Categories',
                secondtext: 'See All',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShopByCetegory()));
                },
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShoppingCetegory(
                    cetegory: 'Clothing',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myfavorite(
                                    cetegeorytype: 'Cloothing',
                                    id: '1',
                                  ))).then((value) {});
                    },
                  ),
                  ShoppingCetegory(
                    cetegory: 'Accessories',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myfavorite(
                                    cetegeorytype: 'Accessories',
                                    id: '2',
                                  ))).then((value) {});
                    },
                  ),
                  ShoppingCetegory(
                    cetegory: 'Beauty',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myfavorite(
                                    cetegeorytype: 'Beauty',
                                    id: '3',
                                  ))).then((value) {});
                    },
                  ),
                  ShoppingCetegory(
                    cetegory: 'Shoes',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myfavorite(
                                    cetegeorytype: 'Shoes',
                                    id: '4',
                                  ))).then((value) {});
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TwoTextWidget(
                secondtext: 'See All',
                firsttext: 'Clothing',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Myfavorite(id: "1", cetegeorytype: "Clothing")));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ShoppingItemsBloc, ShoppingIitemsState>(
                builder: (context, state) {
                  if (state is Loadingdata) {
                    return const CetegoryWiseItemShimmer();
                  }
                  if (state is Loadingdone) {
                    clothitems = state.products
                        .map((e) => Itemcard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            uid: e.uid,
                                          )));
                            },
                            imagepath: e.producturl,
                            productname: e.itemname,
                            productprice: e.price))
                        .toList();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(clothitems.length, (index) {
                        return clothitems[index];
                      }),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TwoTextWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myfavorite(
                                id: "2", cetegeorytype: "Accessories")));
                  },
                  secondtext: 'See All',
                  firsttext: 'Accesories'),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<ShoppingItemsBloc, ShoppingIitemsState>(
                builder: (context, state) {
                  if (state is Loadingdata) {
                    return const CetegoryWiseItemShimmer();
                  }
                  if (state is Loadingdone) {
                    accessoriesitems = state.accessories
                        .map((e) => Itemcard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            uid: e.uid,
                                          )));
                            },
                            imagepath: e.producturl,
                            productname: e.itemname,
                            productprice: e.price))
                        .toList();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(accessoriesitems.length, (index) {
                        return accessoriesitems[index];
                      }),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TwoTextWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Myfavorite(id: "3", cetegeorytype: "Beauty")));
                  },
                  secondtext: 'See All',
                  firsttext: 'Beauty'),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<ShoppingItemsBloc, ShoppingIitemsState>(
                builder: (context, state) {
                  if (state is Loadingdata) {
                    return const CetegoryWiseItemShimmer();
                  }
                  if (state is Loadingdone) {
                    beautyitems = state.beauty
                        .map((e) => Itemcard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            uid: e.uid,
                                          )));
                            },
                            imagepath: e.producturl,
                            productname: e.itemname,
                            productprice: e.price))
                        .toList();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(beautyitems.length, (index) {
                        return beautyitems[index];
                      }),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TwoTextWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Myfavorite(id: "4", cetegeorytype: "shoes")));
                  },
                  secondtext: 'See All',
                  firsttext: 'Shoes'),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<ShoppingItemsBloc, ShoppingIitemsState>(
                builder: (context, state) {
                  if (state is Loadingdata) {
                    return const CetegoryWiseItemShimmer();
                  }
                  if (state is Loadingdone) {
                    shoesitems = state.shoes
                        .map((e) => Itemcard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            uid: e.uid,
                                          )));
                            },
                            imagepath: e.producturl,
                            productname: e.itemname,
                            productprice: e.price))
                        .toList();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(shoesitems.length, (index) {
                        return shoesitems[index];
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ShoppingCetegory extends StatelessWidget {
  const ShoppingCetegory({
    super.key,
    required this.cetegory,
    this.onTap,
  });
  final String cetegory;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Image(
            image: AssetImage('images/Ellipse 1.png'),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            cetegory,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'GT-Regular',
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class CetegoryWiseItemShimmer extends StatelessWidget {
  const CetegoryWiseItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 159,
                height: 207,
                color: Colors.white,
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                width: 159,
                height: 207,
                color: Colors.white,
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                width: 159,
                height: 207,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
