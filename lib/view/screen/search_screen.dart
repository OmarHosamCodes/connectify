import 'package:connectify/library.dart';

List<String> dummydata = [
  'apple',
  'orange',
  'juice',
  'paper',
  'board',
  'python',
];

final searchTextProvider = StateProvider<String?>((ref) => null);
final existProvider = StateProvider<List<String>>((ref) => []);
final widgetsProvider = StateProvider<Map<String, Widget>>((ref) => {});

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          controller: controller,
          onChanged: (value) {
            print(value);
            ref.read(searchTextProvider.notifier).update((state) => value);
            print('notifier value is : ${ref.read(searchTextProvider)}');
            print('notifier value is : ${ref.read(widgetsProvider)}');
            for (String element in dummydata) {
              if (element.contains(ref.read(searchTextProvider)!) &&
                  value != '') {
                print(element + 'added element');
                ref.read(existProvider.notifier).update((existState) {
                  if (existState.contains(element)) {
                    return existState;
                  } else {
                    existState.add(element);
                    ref.read(widgetsProvider.notifier).update((state) => {});
                    for (var element in existState) {
                      ref.read(widgetsProvider.notifier).update((state) {
                        state.addAll({
                          element: Container(
                            margin: const EdgeInsets.fromLTRB(
                                0,
                                SimpleConstants.vertiacalSpace,
                                0,
                                SimpleConstants.vertiacalSpace),
                            child: morphingGlasslistTile(
                                // height: context.height / 6,
                                // width: context.width,
                                roundedValue: SimpleConstants.radius,
                                opacity: 0.4,
                                borderColor: Colors.white.withOpacity(0.4),
                                text: CustomText(text: element),
                                subtitle: CustomText(text: element),
                                leading: const CircleAvatar(
                                  radius: SimpleConstants.radius * 1.25,
                                ),
                                gradientColors: [
                                  Colors.pink.withOpacity(0.4),
                                  Colors.white.withOpacity(0.1)
                                ]),
                          )
                        });
                        return state;
                      });
                    }
                  }
                  return existState;
                });
                print(ref.read(existProvider));
              } else {
                ref.read(existProvider.notifier).update((existState) {
                  if (existState.contains(element)) {
                    existState.remove(element);
                    ref.read(widgetsProvider.notifier).update((state) {
                      state.remove(element);
                      print('notifier value is : ${ref.read(widgetsProvider)}');

                      return state;
                    });
                  }
                  return existState;
                });
              }
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SimpleConstants.horizontalSpace),
          child: ListView(
            children: List.from(ref.watch(widgetsProvider).values),
          ),
        ),
      ),
    );
  }
}
