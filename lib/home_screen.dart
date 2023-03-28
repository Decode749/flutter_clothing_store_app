import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'size_config.dart';
import 'app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "All Items",
    "Dress",
    "Hat",
    "Watch",
  ];

  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon',
  ];

  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    'image-05',
    'image-06',
    'image-07',
    'image-08',
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello , Welcome 🖐️',
                    style: kEncodeSansRegular.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    'Albert Stevano',
                    style: kEncodeSansSemibold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: kGrey,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7GoLl5TulaocWLQ8pi__zObTN8Sj5PmFvec-6NEPb&s'),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                style: kEncodeSansRegular.copyWith(
                  color: kDarkGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
                controller: TextEditingController(),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    prefixIcon: const IconTheme(
                        data: IconThemeData(
                          color: kDarkGrey,
                        ),
                        child: Icon(
                          Icons.search,
                        )),
                    hintText: 'Search clothes...',
                    border: kInputBorder,
                    errorBorder: kInputBorder,
                    disabledBorder: kInputBorder,
                    focusedBorder: kInputBorder,
                    focusedErrorBorder: kInputBorder,
                    enabledBorder: kInputBorder,
                    hintStyle: kEncodeSansRegular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    )),
              )),
              const SizedBox(
                width: 16,
              ),
              Container(
                height: 49,
                width: 49,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: SvgPicture.asset(
                  'assets/filter_icon.svg',
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: double.infinity,
          height: 36,
          child: ListView.builder(
            itemCount: categories.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    current = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? kPaddingHorizontal : 15,
                    right:
                        index == categories.length - 1 ? kPaddingHorizontal : 0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 36,
                  decoration: BoxDecoration(
                      color: current == index ? kBrown : kWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(color: kLightGrey, width: 1)),
                  child: Row(
                    children: [
                      SvgPicture.asset(current == index
                          ? 'assets/${icons[index]}_selected.svg'
                          : 'assets/${icons[index]}_unselected.svg'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        categories[index],
                        style: kEncodeSansMedium.copyWith(
                            color: current == index ? kWhite : kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        MasonryGridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 23,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: images.length,
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.asset(
                        'assets/images/${images[index]}.png',
                        fit: BoxFit.cover,
                      ),
                    )),
                    Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/favorite_cloth_icon_unselected.svg'),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('Modern light clothes',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansSemibold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    )),
                Text('Dress modern',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('\$223.99',
                        style: kEncodeSansSemibold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        )),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: kYellow,
                          size: 16,
                        ),
                        const SizedBox(width: 8,),
                        Text('5.0',
                            style: kEncodeSansRegular.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            )
                          ),
                      ],
                    )
                  ],
                )
              ],
            );
          },
        )
      ],
    ));
  }
}
