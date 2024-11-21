part of 'task_page.dart';

class TasksPending extends StatelessWidget {
  const TasksPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size94,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.size20)),
        gradient: Palette.violetGradient,
      ),
      padding: AppSize.size12.paddingAll(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Information Technology',
                style: context.headlineSmall()?.copyWith(color: Colors.white),
              ),
              Text(
                'Pending Tasks',
                style: context
                    .bodyMedium()
                    ?.copyWith(color: Colors.white, fontSize: AppSize.size12),
              ),
              const Spacer(),
              const Row(
                children: [
                  CircleWithAvatarUser(
                    size: Size(AppSize.size20, AppSize.size20),
                  ),
                  CircleWithAvatarUser(
                    size: Size(AppSize.size20, AppSize.size20),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          Text('Now', style: context.bodyLarge()?.copyWith(
            color: Colors.white,
            fontSize: AppSize.size14
          )),

        ],
      ),
    );
  }
}
