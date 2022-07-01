import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourcamp/models/location_base.dart';
import 'package:tourcamp/utilities/content_type_id.dart';
import 'package:tourcamp/utilities/number_util.dart';
import 'package:tourcamp/view/detail_view.dart';
import 'package:tourcamp/view_model/main_view_model.dart';

class MainListTile extends StatelessWidget {
  const MainListTile({Key? key, required this.item}) : super(key: key);
  final LocationBaseItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: GestureDetector(
            onTap: () {
              context.read<MainViewModel>().setCurrentItem(item);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (materialContext) {
                  return ChangeNotifierProvider.value(
                      value: context.watch<MainViewModel>(),
                      child: DetailView(),
                  );
                }),
              );
            },
            child: createImageView(),
          ),
        ),
        Positioned(
          top: 5.0,
          left: 5.0,
          child: Text(
            item.title ?? "",
            style: const TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontSize: 18.0,
            ),
          ),
        ),
        Positioned(
          bottom: 5.0,
          left: 5.0,
          child: Text(
            ContentTypeId.convert(item.contenttypeid),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Positioned(
          bottom: 5.0,
          right: 5.0,
          child: Text(
            NumberUtil.distance(item.dist),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget createImageView() {
    if (item.firstimage != null && item.firstimage!.isNotEmpty) {
      return ExtendedImage.network(
        item.firstimage ?? "",
        width: double.infinity,
        height: 150.0,
        fit: BoxFit.cover,
        cache: true,
        color: Colors.black45,
        colorBlendMode: BlendMode.darken,
        loadStateChanged: (ExtendedImageState state) {
          if (state.extendedImageLoadState == LoadState.failed) {
            return Image.asset(
              "assets/not_found_image.png",
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
            );
          } else {
            return null;
          }
        },
      );
    } else {
      return Image.asset(
        "assets/not_found_image.png",
        width: double.infinity,
        height: 150.0,
        fit: BoxFit.cover,
        color: Colors.black45,
        colorBlendMode: BlendMode.darken,
      );
    }
  }
}
