part of 'task_page.dart';
class CircleWithSearchIcon extends StatelessWidget {
  const CircleWithSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppSize.size56,
        height: AppSize.size56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: const Center(
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}