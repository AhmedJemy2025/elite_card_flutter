import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/empty_list_view.dart';

void showCustomBottomSheet<T>(BuildContext context, List<String> data, Function onSelectItem, {String? emptyText} ) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (context) {
        if (data.isEmpty){
          return EmptyListView(smallView: true ,title: emptyText);
        }else {
          return ListView.separated(
              shrinkWrap: true ,
              itemBuilder: (context, index) => TextButton(
                  onPressed: () {
                    onSelectItem(index);
                  },
                  child: AppText(
                    text: data[index],
                  )),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data.length);
        }
      });
}
