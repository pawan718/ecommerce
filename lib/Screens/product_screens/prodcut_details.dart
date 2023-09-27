import 'package:ecommerce/Screens/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/Screens/bloc/wish_list_bloc.dart';
import 'package:ecommerce/Screens/product_screens/checkout_screen.dart';
import 'package:ecommerce/color_selctor.dart';
import 'package:ecommerce/Screens/bloc/ItemDetailsBloc/item_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/app_selector.dart';
import '../../common_widgets/product_details_shimmer.dart';
import '../../common_widgets/product_size_selector.dart';
import '../../common_widgets/star_rating_companent.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.uid});
  final String uid;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<dynamic> sizes = [];
  bool checkheart = false;

  final List<ColorSelctor> colors = [
    ColorSelctor(Colors.orange, 'Orange'),
    ColorSelctor(Colors.black, 'black'),
    ColorSelctor(Colors.red, 'red'),
    ColorSelctor(Colors.blue, 'blue'),
    ColorSelctor(Colors.yellow, 'yellow'),
  ];
  String selectedcolor = 'Orange';
  Color selectedcolorcode = Colors.orange;
  String selectedsize = "S";
  int productcount = 1;
  @override
  void initState() {
    // TODO: implement initState
    context.read<ItemDetailsBloc>().add(ItemContent(widget.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
          builder: (context, state) {
            String url = "";
            String itemname = "";
            String price = "";
            String description = "";
            String shipping = "";
            if (state is ItemsLoadingstate) {
              return LoadingShimmer();
            } else if (state is ItemsLoadingDone) {
              url = state.data.imageurl;
              itemname = state.data.itemname;
              price = state.data.itemprice;
              description = state.data.description;
              shipping = state.data.shippingpolicy;
              sizes = state.data.sizes;
            }
            return Stack(children: [
              SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    SizedBox(
                      width: double.infinity,
                      height: 372,
                      child: Image.network(
                        url,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 24,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('images/back_button.svg')),
                    ),
                    BlocListener<WishListBloc, WishListState>(
                      listener: (context, state) {
                        if (state is ProductSuccessfullyAddedToWishlist) {
                          Fluttertoast.showToast(
                              msg: "product Succesfully added to wishlist");
                        } else if (state is ProductIsAlreeadyddedToWishlist) {
                          Fluttertoast.showToast(
                              msg: "product is already in  wishlist");
                        }
                      },
                      child: Positioned(
                        top: 30,
                        right: 24,
                        child: GestureDetector(
                          onTap: () {
                            context.read<WishListBloc>().add(
                                AddProductToWishLIst(
                                    picurl: url,
                                    productname: itemname,
                                    docid: widget.uid));
                          },
                          child: SvgPicture.asset(
                            'images/heart.svg',
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 22),
                    child: AppBoldText(text: itemname, fontsize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 15),
                    child: Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF9747FF),
                        fontSize: 16,
                        fontFamily: 'GT-Bold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  AppSelector(
                    onTap: () {
                      {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => StatefulBuilder(
                                  builder: (BuildContext context, setState) =>
                                      Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 14),
                                            child: AppBoldText(
                                                text: 'Size', fontsize: 24),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(Icons.close)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: sizes.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                Expanded(
                                                  child: ProductSizeSelector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedsize =
                                                              sizes[index];
                                                        });
                                                      },
                                                      textcolor: sizes[index] ==
                                                              selectedsize
                                                          ? Colors.white
                                                          : Colors.black,
                                                      color: sizes[index] ==
                                                              selectedsize
                                                          ? Colors.blue
                                                          : Colors.white,
                                                      size: sizes[index],
                                                      child: sizes[index] ==
                                                              selectedsize
                                                          ? SvgPicture.asset(
                                                              'images/tick.svg')
                                                          : null),
                                                )),
                                      )
                                    ],
                                  ),
                                )).then((value) {
                          setState(() {});
                        });
                      }
                    },
                    text: 'Size',
                    child: Row(
                      children: [
                        AppBoldText(text: selectedsize, fontsize: 16),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 29, right: 22, top: 16, bottom: 16),
                          child: SvgPicture.asset('images/arrowdown2.svg'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppSelector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => StatefulBuilder(
                                builder: (BuildContext context, setState) =>
                                    Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 14),
                                          child: AppBoldText(
                                              text: 'Color', fontsize: 24),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(Icons.close)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: colors.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              Expanded(
                                                  child: ProductSizeSelector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedcolor =
                                                        colors[index].colorname;
                                                    selectedcolorcode =
                                                        colors[index].color;
                                                  });
                                                },
                                                size: colors[index].colorname,
                                                color: selectedcolor ==
                                                        colors[index].colorname
                                                    ? Colors.blue
                                                    : Colors.white,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            colors[index].color,
                                                        shape: const OvalBorder(
                                                          side: BorderSide(
                                                            width: 3,
                                                            strokeAlign: BorderSide
                                                                .strokeAlignOutside,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 22,
                                                    ),
                                                    SvgPicture.asset(
                                                        'images/tick.svg')
                                                  ],
                                                ),
                                              ))),
                                    )
                                  ],
                                ),
                              )).then((value) {
                        setState(() {});
                      });
                    },
                    text: 'Color',
                    child: Row(
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: CircleAvatar(
                            backgroundColor: selectedcolorcode,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 29, right: 22, top: 16, bottom: 16),
                          child: SvgPicture.asset('images/arrowdown2.svg'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppSelector(
                    text: 'Quality',
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              productcount++;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 23),
                            child: SvgPicture.asset('images/plusbutton.svg'),
                          ),
                        ),
                        Text(
                          "$productcount",
                          style: const TextStyle(
                            color: Color(0xFF050505),
                            fontSize: 16,
                            fontFamily: 'GT Walsheim Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (productcount > 1) {
                                productcount--;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 25, left: 22),
                            child: SvgPicture.asset('images/minusbutton.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Color(0x7F050505),
                        fontSize: 12,
                        fontFamily: 'GT-Regular',
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child:
                        AppBoldText(text: 'Shipping & Returns', fontsize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      shipping,
                      style: const TextStyle(
                        color: Color(0x7F050505),
                        fontSize: 12,
                        fontFamily: 'GT-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: AppBoldText(text: 'Reviews', fontsize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: AppBoldText(text: '4.5 Ratings', fontsize: 24),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      '213 Reviews',
                      style: TextStyle(
                        color: Color(0x7F050505),
                        fontSize: 12,
                        fontFamily: 'GT-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const RatingComponent(
                      personname: 'Alex Morgan',
                      profilepicurl: 'images/perosn.png',
                      description:
                          'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
                      time: '12 days ago'),
                  const RatingComponent(
                      personname: 'Alex Morgan',
                      profilepicurl: 'images/person2.png',
                      description:
                          'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
                      time: '12 days ago'),
                  const SizedBox(
                    height: 80,
                  )
                ],
              )),
              BottomAppButton(
                onPressed: () {
                  context.read<AddToCartBloc>().add(AddToCartItemEvent(
                      price: price,
                      productname: itemname,
                      picurl: url,
                      itemcount: productcount,
                      productsize: selectedsize));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckOut()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'GT Walsheim Pro',
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Text(
                          'Add to Bag',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'GT Walsheim Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}

class BottomAppButton extends StatelessWidget {
  const BottomAppButton({
    super.key,
    this.child,
    this.onPressed,
  });
  final Widget? child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        height: 80,
        width: double.infinity,
        child: Center(
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9747FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: onPressed,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
