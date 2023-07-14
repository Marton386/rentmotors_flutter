import '../../../res/global.dart';
import 'package:flutter/material.dart';
import '../../../utils/price_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/responses/car/presentation_car.dart';

class CarInfoWidget extends StatefulWidget {
  const CarInfoWidget({
    super.key,
    required this.car,
    required this.countDays,
  });
  final int countDays;
  final PresentationCar car;

  @override
  State<CarInfoWidget> createState() => _CarInfoWidgetState();
}

class _CarInfoWidgetState extends State<CarInfoWidget> {
  bool isExpanded = true;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    String facilities = widget.car.at ? LocaleKeys.type_at.tr() : LocaleKeys.type_mt.tr();
    if (widget.car.ac) {
      facilities += ", ${LocaleKeys.conditioner.tr()}";
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Global.getBorderColor(context),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/pictures/placeholder_car.png',
                  image: widget.car.urlImg,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.car.model,
                      maxLines: 2,
                      style: Global.nameCarText,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                    (widget.car.ev != 0) ? Text(
                      LocaleKeys.electric.tr(),
                      style: Global.electricText,
                    ) : Text(
                      LocaleKeys.or_similar.tr(),
                      style: Global.facilitiesText,
                    ),
                    const Text(
                      'for_days',
                      style: Global.facilitiesText,
                    ).tr(gender: formatForDays(widget.countDays), namedArgs: {
                      'currentDays': widget.countDays.toString()}),
                    Text(
                      "${PriceFormatter.format(widget.car.price)} ${widget.car.currency}",
                      style: Global.priceStyleText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(""),
              InkWell(
                onTap: toggleExpanded,
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Global.getIconColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: isExpanded ? null : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.car.code,
                    style: Global.facilitiesText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${PriceFormatter.format(widget.car.perDayPrice)} ${widget.car.currency}"
                            " ${LocaleKeys.per_day.tr()}",
                        style: Global.facilitiesText,
                      ),
                      Text(
                        facilities,
                        style: Global.facilitiesText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (widget.car.mileage > 0) ?
                      Text(
                        "${LocaleKeys.limited_mileage.tr()} ${
                            LocaleKeys.km.tr(namedArgs: {'currentKm': widget.car
                                .mileage.toString(),})
                        }",
                        style: Global.facilitiesText,
                      ) :
                      Text(
                        LocaleKeys.unlimited_mileage.tr(),
                        style: Global.facilitiesText,
                      ),
                      Container(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${PriceFormatter.format(widget.car.deposit)} ${widget.car.currency}",
                        style: Global.facilitiesText,
                      ),
                      const SizedBox(width: 5),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/car_door.svg',
                            width: 15,
                            height: 15,
                            color: Global.getIconColor(context),
                          ),
                          Text(
                            widget.car.doors.toString(),
                            style: Global.facilitiesText,
                          ),
                          SvgPicture.asset(
                            'assets/icons/person.svg',
                            width: 15,
                            height: 15,
                            color: Global.getIconColor(context),
                          ),
                          Text(
                            widget.car.seats.toString(),
                            style: Global.facilitiesText,
                          ),
                          SvgPicture.asset(
                            'assets/icons/luggage.svg',
                            width: 15,
                            height: 15,
                            color: Global.getIconColor(context),
                          ),
                          Text(
                            widget.car.luggage.toString(),
                            style: Global.facilitiesText,
                          ),
                          SvgPicture.asset(
                            'assets/icons/bag.svg',
                            width: 15,
                            height: 15,
                            color: Global.getIconColor(context),
                          ),
                          Text(
                            widget.car.bag.toString(),
                            style: Global.facilitiesText,
                          ),
                          (widget.car.ev != 0) ? SvgPicture.asset(
                            'assets/icons/lightning.svg',
                            width: 15,
                            height: 15,
                            color: Global.getIconColor(context),
                          ) : Container(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatForDays(int currentDays) {
    String currentDay = "";
    switch(currentDays) {
      case 0:
        currentDay = "zero";
        break;
      case 1:
        currentDay = "one";
        break;
      case 2:
        currentDay = "two";
        break;
      case 3:
        currentDay = "few";
        break;
      case 4:
        currentDay = "few";
        break;
      default:
        currentDay = "other";
        break;
    }
    return currentDay;
  }
}