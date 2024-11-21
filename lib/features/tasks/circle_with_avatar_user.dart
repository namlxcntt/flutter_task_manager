part of 'task_page.dart';

class CircleWithAvatarUser extends ConsumerWidget {
  const CircleWithAvatarUser({super.key, this.size});
  final Size? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: size?.width ?? AppSize.size56,
      height: size?.height ?? AppSize.size56,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Assets.png.profile.image(),
      ),
    );
  }
}
