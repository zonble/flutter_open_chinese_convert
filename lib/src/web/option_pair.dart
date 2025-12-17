enum OptionPair{
  s2t(from:'cn', to:'t'),
  t2s(from:'t', to:'cn'),
  s2hk(from:'cn',to:'hk'),
  hk2s(from:'hk', to:'cn'),
  s2tw(from:'cn', to:'tw'),
  tw2s(from:'tw', to:'cn'),
  s2twp(from:'cn', to:'twp');

  const OptionPair({
    required this.from,
    required this.to
  });

  final String from;
  final String to;

  static const Map<String, OptionPair> optionMap = {
    's2t': s2t,
    't2s': t2s,
    's2hk': s2hk,
    'hk2s': hk2s,
    's2tw': s2tw,
    'tw2s': tw2s,
    's2twp': s2twp
  };
}
