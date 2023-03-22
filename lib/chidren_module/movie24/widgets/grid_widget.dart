import 'package:flutter/material.dart';

import '../../constants/movie_list_constant.dart';
import '../../models/movie_model.dart';
import '../../pages/detail_page.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {

  final double _ratio = 4 / 6;

  @override
  Widget build(BuildContext context) {
    return _buildGridViewBuilder();
  }

  Widget _buildGridViewBuilder() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: _ratio,
      ),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildGridItem(movieList[index]);
      },
    );
  }

  Widget _buildGridItem(MovieModel item) {
    return InkWell(
      child: Image.network(item.image, fit: BoxFit.cover),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(item),
          ),
        );
      },
    );
  }
}
