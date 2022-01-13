import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int gottenStars = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 330,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.place.img!),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 70,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.bar_chart_sharp),
                        color: Colors.white,
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.workspaces_filled),
                      //   color: Colors.white,
                      // )
                    ],
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 30.0),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ApplargeText(
                                text: detail.place.name!,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ApplargeText(
                              text: "\$" + detail.place.price!.toString(),
                              color: AppColors.mainColor,
                              size: 25.0,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(height: 5.0),
                            AppText(
                                text: detail.place.location!,
                                color: AppColors.textColor1),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                detail.place.stars!,
                                (index) => Icon(Icons.star,
                                    color: index < detail.place.stars!
                                        ? AppColors.starColor
                                        : AppColors.textColor2),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            AppText(
                              text: "(5.0)",
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ApplargeText(
                                text: "People",
                                color: Colors.black.withOpacity(0.8),
                                size: 20.0,
                              ),
                              SizedBox(height: 5.0),
                              AppText(
                                text: "Number of people in your group",
                                color: AppColors.mainTextColor,
                              ),
                              const SizedBox(height: 10.0),
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: AppButton(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        size: 40.0,
                                        backgroundColor: selectedIndex == index
                                            ? Colors.black
                                            : AppColors.buttonBackground,
                                        borderColor: selectedIndex == index
                                            ? Colors.black
                                            : AppColors.buttonBackground,
                                        text: (index + 1).toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              ApplargeText(
                                text: "Description",
                                color: Colors.black.withOpacity(0.8),
                                size: 20.0,
                              ),
                              const SizedBox(height: 10.0),
                              AppText(
                                text: detail.place.description!,
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                          color: AppColors.textColor1,
                          size: 60,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(width: 20.0),
                        const ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
