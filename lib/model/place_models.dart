class PlaceInfo {
  final String location, image, name, desc, contract1, id, map, qr1, qr2;
  final int days, hour;
  PlaceInfo({
    required this.desc,
    required this.name,
    required this.image,
    required this.location,
    required this.days,
    required this.hour,
    required this.id,
    required this.contract1,
    required this.map,
    required this.qr1,
    required this.qr2,
  });
}

List places = [
  PlaceInfo(
    image: 'assets/image/baekryung_thumb.png',
    location: '인천',
    name: '백령도',
    days: 3,
    hour: 4,
    desc:
        '백령도는 서해 최북단 섬이자 대한민국에서 여덟 번째로 큰 섬이다. 맑은 날이면 황해도 장산곶이 보일 만큼 북녘과 가깝다. 인천에서 서북쪽으로 191km가량 떨어진 섬은 인천항 연안여객터미널에서 배를 타고 4시간가량 들어가야 할 만큼 멀지만, 여느 곳에서 볼 수 없는 천혜의 자연과 지질학적 절경을 품고 있다.2019년에는 백령도 가는 길목에 있는 섬인 대청도, 소청도와 함께 ‘백령·대청 국가지질공원’으로 지정되기도 했다. 지질공원은 지구과학적으로 중요하고 경관이 우수한 지역으로 환경부장관이 인증한 공원을 뜻한다. 섬 전체가 보호해야 할 지질 유산인 셈인데, 그중 두무진, 사곶 사빈, 콩돌해안, 진촌리 맨틀포획암 분포지, 용트림바위와 남포리 습곡구조는 지질명소로 지정된 더욱 귀한 몸이다.면적 46.3㎢의 섬은 해안선 둘레를 따라 주요 관광지가 모여 있다. 섬 최고의 비경인 두무진은 4km의 해안을 따라 병풍처럼 늘어선 약 50m 높이의 기암절벽이다. 깎아지른 듯한 기암괴석은 10억 년 전에 쌓인 모래가 굳어져 규암이 된 후 오늘에 이른 것이다. 아주 고운 모래 입자가 쌓여 있는 사곶 사빈은 6·25전쟁 당시 비상 활주로로 이용했을 만큼 백사장이 단단하고, 콩돌해안은 동글동글한 오색의 콩돌을 매만지는 재미가 있다. 진촌리 맨틀포획암 분포지에서 지구 맨틀을 구성하는 연녹색 감람암 덩어리를 관찰하거나, 심청각에서 심청이가 몸을 던졌다는 인당수를 바라보아도 좋겠다. 심청각 인근의 물범바위는 멸종 위기에 처한 점박이물범의 서식지다.',
    id: '1',
    contract1: 'assets/image/baekryung.final.png',
    map: 'assets/image/baekryung_map.png',
    qr1: 'assets/image/baekryung_pic1.png',
    qr2: 'assets/image/baekryung_pic2.png',
  ),
  PlaceInfo(
    image: 'assets/image/daejak_thumb.png',
    location: '인천',
    name: '대이작도',
    days: 2,
    hour: 4,
    desc:
        '대청도는 인천에서 북서쪽으로 202㎞, 옹진반도에서 남서쪽으로 약 40㎞ 거리에 있다. 주민의 대부분은 어업에 종사하며, 일부 주민은 논농사와 밭농사를 겸업으로 하고 있는 전형적인 어촌지역으로 한 때 80년대말까지는 홍어잡이가 크게 성황을 이루었던 곳이다.현재에도 다양한 어종 수산물이 풍부한 지역으로 섬 전체가 낚시터로도 유명하다. 황해도 장산곶과는 불과 19km 거리에 위치한 국가 안보상 전략적 요충지라는 특수한 요건을 제외하고 나면, 국내의 어느 섬과도 비길 바 없는 청정해역과 천혜의 관광자원을 보유한 섬이기도 하다.본래는 ‘암도(岩島)’라고 불렀는데, 조선시대 명종때 국모 윤씨의 신병 명약인 상기향을 채취, 진상하여 병이 완쾌된 후 돌만 있는 암도가 아니고, 수목이 무성한 큰 섬이라하여 ‘대청도(大靑島)’로 붙여졌다.',
    id: '2',
    contract1: 'assets/image/daejak_final.png',
    map: 'assets/image/daejak_map.png',
    qr1: 'assets/image/daejak_pic1.png',
    qr2: 'assets/image/daejak_pic2.png',
  ),
  PlaceInfo(
    image: 'assets/image/soe_thumb.png',
    location: '인천',
    name: '소이작도',
    days: 1,
    hour: 3,
    desc: '',
    id: '3',
    contract1: 'assets/image/soejak_final.png',
    map: 'assets/image/seojak_map.png',
    qr1: 'assets/image/soejak_pic1.png',
    qr2: 'assets/image/soejak_pic2.png',
  ),
  PlaceInfo(
    image: 'assets/image/mooeu_thumb.png',
    location: '인천',
    name: '무의도',
    days: 1,
    hour: 3,
    desc:
        '인천광역시 중구에 있는 섬이다. 과거에는 배를 타야 했지만, 2019년 영종도와 무의도를 잇는 무의대교가 개통하며 차를 타고 섬에 갈 수 있게 되었다. 무의도 남단의 소무의인도교를 통해 해안선 길이가 2.5km인 아담한 섬, 소무의도에 들어갈 수도 있다. 무의도는 섬의 형상이 소맷자락을 길게 늘어뜨린 무희와 같다고 하여 붙은 이름이다. 2000년대 초에 드라마 <천국의 계단> 촬영지로 유명했다가 지금은 고즈넉한 섬의 모습을 되찾았다.무의도는 ‘서해의 알프스’라고 불릴 만큼 자연 풍광이 아름답다. 가벼운 산행에 제격인 두 개의 봉우리, 호룡곡산과 국사봉이 있어 등산객이 즐겨 찾는 섬이기도 하다. 호룡곡산(245.6m)은 몇 군데 급경사 구간을 빼면 길이 완만하여 나무 사이에 실려 오는 바닷바람을 맡으며 호젓한 산행을 할 수 있다. 정상에 오르면 섬의 관광명소인 하나개해수욕장이 가까이에, 짙푸른 서해가 드넓게 펼쳐진다. 호룡곡산과 국사봉을 잇는 구름다리를 건너면 국사봉(236m)으로 산행을 이어갈 수 있다. 국사봉 정상에서 마주하는 일몰은 마음을 붉게 물들이고, 어둠이 내리면 불빛이 반짝이는 인천국제공항이 내다보인다.밀가루처럼 모래가 고운 하나개 해수욕장에서 바다를 감상하거나 실미도 유원지에서 오토캠핑을 즐겨도 좋다. 썰물 때면 실미해수욕장 앞의 바닷길이 열려 실미도까지 걸어갈 수 있다.',
    id: '4',
    contract1: 'assets/image/mooeu_final.png',
    map: 'assets/image/mooeu_map.png',
    qr1: 'assets/image/mooedo_pic1.png',
    qr2: 'assets/image/mooedo_pic2.png',
  ),
  PlaceInfo(
    image: 'assets/image/modo_thumb.png',
    location: '인천',
    name: '모도',
    days: 1,
    hour: 3,
    desc:
        '신도, 시도, 모도는 연도교로 이어져 신∙시∙모도 삼형제 섬이라고도 불리며, 세 개의 섬을 한번에 둘러볼 수 있는 색다른 묘미가 있다. 특히, 섬과 섬 사이를 달리는 자전거 여행이 인기를 끌고 있으며, 구봉산, 해당화둘레길, 수기해변, 배미꾸미조각공원 등 각양각색의 매력을 지닌 관광지에서 가족, 연인과 다양한 추억을 만들 수 있다. *신도: 신도는 섬 주민들의 착하고 신의가 있다는 뜻에서 유래된 섬으로 구봉산이 유명하다. 임도를 따라 등산로가 완만하게 잘 정비되어 있으며 진달래와 벚꽃이 즐비하다. 또한, 구봉정에서는 서해의 풍광이 한눈에 들어오며, 인천공항과 인천 도시의 야경은 특히 아름답다. *시도: 시도는 산과 바다가 조화롭게 빚어내는 아름다운 경치 때문에 풀하우스, 슬픈연가 등 인기 드라마의 배경이 되었다. 수기해변은 완만하고 넓은 백사장으로 마니산이 지척으로 보이며, 방죽길을 따라 펼쳐진 해당화가 일품이다. 시도는 마니산에서 활을 쏠 때, 그 목표지점이어서 "살섬" 이라 불렀다는 설이 있다. 시∙모도 연도교를 지나 해당화 길을 따라가면 모도의 배미꾸미해변이 나온다. 조각가 이일호의 조각 작품과 바다가 만들어내는 신비로운 분위기 때문에 연인들이 많이 찾는다. *모도: 모도는 그물에 고기는 올라오지 않고 띠(茅)만 걸린다고 해서 한글로 "띠염"이라 부르던 이름이 한자로 바뀌었다고 한다.',
    id: '5',
    contract1: 'assets/image/modo_final.png',
    map: 'assets/image/modo_map.png',
    qr1: 'assets/image/modo_pic1.png',
    qr2: 'assets/image/modo_pic2.png',
  ),
];
