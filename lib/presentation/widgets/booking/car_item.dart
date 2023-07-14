import 'package:rentmotors/utils/alerts_shower.dart';

import '../../../res/global.dart';
import 'package:flutter/material.dart';
import '../../../utils/price_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/responses/car/presentation_car.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    super.key,
    required this.car,
  });
  final PresentationCar car;

  @override
  Widget build(BuildContext context) {
    String facilities = car.at ? LocaleKeys.type_at.tr() : LocaleKeys.type_mt.tr();
    if (car.ac) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      facilities,
                      style: Global.facilitiesText,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/car_door.svg',
                          width: 15,
                          height: 15,
                          color: Global.getIconColor(context),
                        ),
                        Text(
                          car.doors.toString(),
                          style: Global.facilitiesText,
                        ),
                        SvgPicture.asset(
                          'assets/icons/person.svg',
                          width: 15,
                          height: 15,
                          color: Global.getIconColor(context),
                        ),
                        Text(
                          car.seats.toString(),
                          style: Global.facilitiesText,
                        ),
                        SvgPicture.asset(
                          'assets/icons/luggage.svg',
                          width: 15,
                          height: 15,
                          color: Global.getIconColor(context),
                        ),
                        Text(
                          car.luggage.toString(),
                          style: Global.facilitiesText,
                        ),
                        SvgPicture.asset(
                          'assets/icons/bag.svg',
                          width: 15,
                          height: 15,
                          color: Global.getIconColor(context),
                        ),
                        Text(
                          car.bag.toString(),
                          style: Global.facilitiesText,
                        ),
                        (car.ev != 0) ? SvgPicture.asset(
                          'assets/icons/lightning.svg',
                          width: 15,
                          height: 15,
                          color: Global.getIconColor(context),
                        ) : Container(),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (car.onRequest)
                      InkWell(
                        child: const Icon(
                          Icons.info,
                          size: 25,
                          color: Global.darkRed,
                        ),
                        onTap: () {
                          AlertsShower.showMessage(
                            context,
                            LocaleKeys.on_request.tr(),
                            LocaleKeys.car_on_request.tr(),
                          );
                        },
                      ),
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/pictures/placeholder_car.png',
                      image: car.urlImg,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${PriceFormatter.format(car.perDayPrice)} ${car.currency}"
                        " ${LocaleKeys.per_day.tr()}",
                    style: Global.facilitiesText,
                  ),
                  Text(
                    "${PriceFormatter.format(car.price)} ${car.currency}",
                    style: Global.priceStyleText,
                  ),
                  Text(
                    "${PriceFormatter.format(car.deposit)} ${car.currency}"
                        " ${LocaleKeys.deposit.tr()}",
                    style: Global.facilitiesText,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      car.code,
                      style: Global.facilitiesText,
                    ),
                    Text(
                      car.model,
                      maxLines: 2,
                      style: Global.nameCarText,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                    (car.ev != 0) ? Text(
                      LocaleKeys.electric.tr(),
                      style: Global.electricText,
                    ) : Text(
                      LocaleKeys.or_similar.tr(),
                      style: Global.facilitiesText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}