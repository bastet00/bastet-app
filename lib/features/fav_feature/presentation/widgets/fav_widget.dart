import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../translation_feature/data/model/translation.dart';
import '../presentation_logic_holder/fav_cubit/fav_cubit.dart';

class FavWidget extends StatefulWidget {
  final Translation translation;

  const FavWidget({
    required this.translation,
    super.key,
  });

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool _isFav = false;

  @override
  void initState() {
    super.initState();
    _isFav = FavCubit.get().isFavorite(widget.translation);
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        FavCubit.get().toggleFav(
          isFav: _isFav,
          translation: widget.translation,
        );
        setState(() {
          _isFav = !_isFav;
        });
      },
      icon: ImageWidget(
        imageUrl: _isFav? AppAssets.favSolid : AppAssets.fav,
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
