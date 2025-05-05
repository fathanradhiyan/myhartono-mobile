part of 'pages.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final List<Widget?> _screens = List.filled(5, null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens[0] = HomePage();
    _screens[1] = CategoryPage();
    _screens[2] = CartPage();
    _screens[3] = AccountPage();
  }

  void _onTabTapped(int index) {
    ref.read(currentTabProvider.notifier).state = index;

    if (_screens[index] == null) {
      switch (index) {
        case 4 :
          _screens[4] = const ProfilePage();
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentTabProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: currentIndex,
        children: List.generate(_screens.length, (index) => _screens[index] ?? const SizedBox()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: mainColor,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: SharedString.appName),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: SharedString.category),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: SharedString.transaction),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp), label: SharedString.profile),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SizedBox(
            width: 75,
            height: 45,
            child: FloatingActionButton(
              onPressed: () {
                ref.read(currentTabProvider.notifier).state = 2;
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              backgroundColor: mainColor,
              child: Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}



