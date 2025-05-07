part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final items = [
    _MenuItem(Icons.receipt_long, 'Daftar Transaksi'),
    _MenuItem(Icons.favorite_border, 'Wishlist Saya'),
    _MenuItem(Icons.account_balance, 'Faktur Pajak'),
    _MenuItem(Icons.location_on_outlined, 'Daftar Alamat'),
    _MenuItem(Icons.store_mall_directory_outlined, 'Lokasi Toko Kami'),
    _MenuItem(Icons.build_outlined, 'Official Service Center'),
    _MenuItem(Icons.privacy_tip_outlined, 'Kebijakan Privasi'),
    _MenuItem(Icons.description_outlined, 'Syarat dan Ketentuan'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgSecondary,
      appBar: AppBar(
        title: Text(SharedString.myProfile),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: size.height * 0.3,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 45, // atur sesuai kebutuhan
                              backgroundColor: Colors.transparent, // opsional, kalau mau transparan
                              child: ClipOval(
                                child: Image.asset(
                                  SharedImage.profilePic,
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(SharedString.username),
                                Text('123.456 Poin Member',),
                                Text('Atur akun saya', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: mainColor, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(flex: 4, child: Image(image: AssetImage(SharedImage.memberCard))),
                    Expanded(
                      child: SizedBox(
                        width: size.width,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.qr_code_2,
                            size: 18,
                            color: mainColor,
                          ),
                          label: Text(
                            'Tunjukkan kode saya',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: blueLight25,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: SizedBox(
                height: size.height * 0.4,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      leading: Icon(item.icon, color: Colors.black54,),
                      title: Text(item.title, style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {

                      },
                    );
                  },
                ),
              ),
            ),
            Align(alignment: Alignment.center, child: Text("${SharedString.appName} version 1.0.0", style: Theme.of(context).textTheme.bodySmall,)),
            Align(alignment: Alignment.center, child: Text("Copyright @ 2025 Hartono Elektronika", style: Theme.of(context).textTheme.bodySmall,)),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  const _MenuItem(this.icon, this.title);
}
