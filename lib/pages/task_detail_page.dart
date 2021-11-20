import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  static const routeName = '/task_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black87,
        elevation: 0,
        title: const Text('Task Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          SizedBox(height: 32),
          _Title(),
          SizedBox(height: 32),
          _DueDate(),
          SizedBox(height: 32),
          _Description(),
          SizedBox(height: 32),
          _Subtasks(),
          SizedBox(height: 32),
          _Assingnees(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(
          'Finance Dashboard Design',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _DueDate extends StatelessWidget {
  const _DueDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Due Date'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Monday, 8 November 2021',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.calendar_today)
          ],
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Description'),
        const SizedBox(height: 8),
        Text(
          'Design a simple dashboard with clean layout and colors based on the client\'s brand guidelines',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _Subtasks extends StatelessWidget {
  const _Subtasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Subtasks'),
        const SizedBox(height: 8),
        const _Subtask(title: 'Wireframe', isCompleted: true),
        const _Subtask(title: 'Define Style Guide', isCompleted: true),
        const _Subtask(title: 'High Fidelity Design'),
        const _Subtask(title: 'Prototyping'),
        const SizedBox(height: 8),
        _AddDetail(title: 'Add Subtask', onTap: () {}),
      ],
    );
  }
}

class _Subtask extends StatelessWidget {
  const _Subtask({
    Key? key,
    required this.title,
    this.isCompleted = false,
  }) : super(key: key);

  final String title;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.view_headline,
              color: isCompleted ? Colors.grey.shade300 : Colors.grey,
            ),
            const SizedBox(width: 8),
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.grey.shade300 : Colors.grey,
              ),
              alignment: Alignment.center,
              child: isCompleted
                  ? Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: isCompleted ? Colors.grey : Colors.black87,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class _Assingnees extends StatelessWidget {
  const _Assingnees({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Assignee'),
        const SizedBox(height: 8),
        _Assignee(
          name: 'Adam Warlock',
          initial: 'A',
          color: Colors.green.shade300,
        ),
        _Assignee(
          name: 'Natasha Carter',
          initial: 'N',
          color: Colors.orange.shade300,
        ),
        _AddDetail(
          title: 'Add Assignee',
          onTap: () {},
        ),
      ],
    );
  }
}

class _Assignee extends StatelessWidget {
  const _Assignee({
    Key? key,
    required this.name,
    required this.initial,
    required this.color,
  }) : super(key: key);

  final String name;
  final String initial;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.view_headline,
              color: Colors.grey,
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: color,
              child: Text(
                initial,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class _AddDetail extends StatelessWidget {
  const _AddDetail({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.grey),
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey),
    );
  }
}
