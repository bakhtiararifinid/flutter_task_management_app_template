import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const _ProfileImage(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const _NotificationButton(),
          PopupMenuButton(
            onSelected: (_) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Title(),
          _Tab(),
          _Content(),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage(
        'assets/images/nicolas-horn-MTZTGvDsHFY-unsplash.jpg',
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.notifications_outlined),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 12,
                child: Text(
                  '5',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
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
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Text(
        'My Tasks',
        style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.black87,
            ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                  width: 2,
                  color: Colors.grey.shade300,
                ))),
            child: const TabBar(
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: [
                Tab(text: 'Todo'),
                Tab(text: 'Due Soon'),
                Tab(text: 'In Review'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 16),
        children: [
          const _TaskCard(
            title: 'Week 1 College Tasks',
            date: 'Friday, 5 November 2021',
            progress: 0.25,
          ),
          _TaskCard(
            title: 'Corporate Web Design',
            date: 'Monday, 8 November 2021',
            progress: 0.75,
            members: [
              _Member(nameLetter: 'A', color: Colors.blue.shade300),
              _Member(nameLetter: 'B', color: Colors.purple.shade300),
              _Member(nameLetter: 'C', color: Colors.pink.shade300),
            ],
          ),
          _TaskCard(
            title: 'Finance Dashboard Design',
            date: 'Monday, 8 November 2021',
            progress: 0.5,
            members: [
              _Member(nameLetter: 'D', color: Colors.red.shade300),
              _Member(nameLetter: 'E', color: Colors.green.shade300),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    Key? key,
    required this.title,
    required this.date,
    required this.progress,
    this.members = const [],
  }) : super(key: key);

  final String title;
  final String date;
  final double progress;
  final List<_Member> members;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(date),
              trailing: const Icon(Icons.more_horiz),
            ),
            if (members.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Stack(children: _getMembers),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade300,
                        color: _getProgressColor(),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${(progress * 100).round()}%',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _getMembers => members
      .asMap()
      .map(
        (i, element) => MapEntry(
          i,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: (i * 16)),
              child: element,
            ),
          ),
        ),
      )
      .values
      .toList();

  Color _getProgressColor() {
    if (progress <= 0.25) {
      return Colors.purple.shade300;
    } else if (progress <= 0.5) {
      return Colors.pink.shade300;
    } else if (progress <= 0.75) {
      return Colors.orange.shade300;
    } else if (progress < 1) {
      return Colors.blue.shade300;
    }

    return Colors.green.shade300;
  }
}

class _Member extends StatelessWidget {
  const _Member({
    Key? key,
    required this.nameLetter,
    required this.color,
  }) : super(key: key);

  final String nameLetter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 12,
      child: Text(
        nameLetter,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
