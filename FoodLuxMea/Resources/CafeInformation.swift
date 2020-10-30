//
//  CafeDatas.swift
//  FoodLuxMea
//
//  Created by Seong Yeol Yi on 2020/08/29.
//

import Foundation

/// Array of string which means there is no menu.
var closedKeywords = ["방학중휴점", "폐    점", "코로나19", "방학중 휴무", "당분간 폐점", "폐  점", "폐   점"]

/// Cafe struct for debug/preview/canvas
var previewCafe = Cafe(
    name: "3식당",
    phoneNum: "1234-5678",
    bkfMenuList: [
        Menu(name: "쇠고기미역국", cost: 3000),
    ],
    lunchMenuList: [
        Menu(name: "목살김치찌개", cost: 3000),
        Menu(name: "치킨가츠동", cost: 3500),
        Menu(name: "돌솥순두부찌개", cost: 3010),
    ],
    dinnerMenuList: [
        Menu(name: "왕갈비탕", cost: 11000),
        Menu(name: "규동", cost: 3500),
    ]
)

/// Cafeteria position coordinate for Naver map
var coordList: [String : (lat: Double, lng: Double)] = [
    "학생회관식당": (37.459225, 126.950646),
    "자하연식당": (37.460897, 126.952533),
    "예술계식당": (37.461870, 126.953100),
    "두레미담": (37.456387, 126.948524),
    "동원관식당": (37.464997, 126.951686),
    "기숙사식당": (37.463120, 126.958669),
    "공대간이식당": (37.457240, 126.950824),
    "3식당": (37.456387, 126.948524),
    "302동식당": (37.448743, 126.952539),
    "301동식당": (37.449987, 126.952483),
    "220동식당": (37.464518, 126.954264),
    "소담마루": (37.465035, 126.951673),
    "라운지오": (37.465035, 126.951673),
    "샤반": (37.459212, 126.948113),
    "아워홈": (37.462050, 126.957779),
]

/// Cafeteria phone number
var phoneNumList: [String: String] = [
    "학생회관식당": "880-5543",
    "자하연식당": "880-7888",
    "예술계식당": "876-1006",
    "두레미담": "880-9358",
    "동원관식당": "880-8697",
    "기숙사식당": "881-9072",
    "공대간이식당": "889-8956",
    "3식당": "880-5545",
    "302동식당": "880-1939",
    "301동식당": "889-8955",
    "220동식당": "875-0240",
    "소담마루": "880-8698",
    "라운지오": "882-7005",
    "샤반": "871-6933",
    "아워홈": ""
]

/// Weekly cafeteria operating hour
var cafeOperatingHour: [String: WeeklyOperatingHour] = [
    
    "학생회관식당": .init(
        weekday: .init("08:00-09:30", "11:00-15:00", "17:00-19:00"),
        saturday: .init(nil, "11:30-14:00", "17:00-19:00"),
        sunday: .init(nil, "11:30-14:00", "17:00-19:00")
    ),
    
    "자하연식당": .init(
        weekday: .init(nil, "11:30-14:00", "17:00-18:30"),
        saturday: nil,
        sunday: nil
    ),
    
    "예술계식당": .init(
        weekday: .init(nil, "11:30-13:30", "17:00-18:30"),
        saturday: nil,
        sunday: nil
    ),
    
    "두레미담": .init(
        weekday: .init(nil, "11:00-14:00", "17:00-19:00"),
        saturday: .init(nil, "11:00-14:00", "17:00-19:00"),
        sunday: nil
    ),
    
    "동원관식당": .init(
        weekday: .init(nil, "11:00-14:00", nil),
        saturday: nil,
        sunday: nil
    ),
    
    "기숙사식당": .init(
        weekday: .init("07:30-09:30", "11:30-13:30", "17:30-19:00"),
        saturday: .init("08:00-09:30", "11:30-13:30", "17:30-19:00"),
        sunday: .init("08:00-09:30", "11:30-13:30", "17:30-19:00")
    ),
    
    "공대간이식당": .init(
        weekday: .init(nil, "11:00-14:30", "15:30-18:30"),
        saturday: nil,
        sunday: nil
    ),
    
    "3식당": .init(
        weekday: .init(nil, "11:00-14:00", "17:00-19:00"),
        saturday: nil,
        sunday: nil
    ), //일단은 4층 기준
    
    "302동식당": .init(
        weekday: .init(nil, "11:30-13:30", "17:00-18:30"),
        saturday: nil,
        sunday: nil
    ),
    
    "301동식당": .init(
        weekday: .init(nil, "11:30-13:10", "17:00-19:00"),
        saturday: nil,
        sunday: nil
    ),
    
    "220동식당": .init(
        weekday: .init(nil, "11:30-13:30", "17:00-19:00"),
        saturday: nil,
        sunday: nil
    ),
    
    "소담마루": .init(
        weekday: .init(nil, "11:00-15:00", "17:00-19:40"),
        saturday: .init(nil, "11:00-15:00", "17:00-19:40"),
        sunday: nil
    ),
    
    "라운지오": .init(
        weekday: .init("11:00-19:00", "11:00-19:00", "11:00-19:00"),
        saturday: .init(nil, "11:00-19:00", "11:00-19:00"),
        sunday: .init(nil, "11:00-19:00", "11:00-19:00")
    ),
    
    "샤반": .init(
        weekday: .init(nil, "11:00-14:30", "16:30-20:00"),
        saturday: .init(nil, "11:30-14:00", nil),
        sunday: nil
    ),
    
    "아워홈": .init(
        weekday: .init("07:30-09:30", "11:30-13:30", "17:30-19:30"),
        saturday: .init("08:00-09:30", "11:30-13:30", "17:30-19:30"),
        sunday: .init("08:00-09:30", "11:30-13:30", "17:30-19:30")
    ),
    
]

/// Cafeteria position string for user
var cafePosition: [String: String] = [
    "학생회관식당": "63동[학생회관] 지상1층/지하1층(점심)",
    "자하연식당": "109동[자하연식당] 지상2층/지상3층(교직원)",
    "예술계식당": "74동[예술복합연구동] 지상1층",
    "두레미담": "75-1동[제3학생식당] 지상5층",
    "동원관식당": "113동[동원생활관] 지상2층",
    "기숙사식당": "919동[학생생활관] 지상1층",
    "공대간이식당": "30-2동[공대간이식당] 지상1층",
    "3식당": "75-1동[제3학생식당] 지상3층/4층",
    "302동식당": "302동[신공학관2] 지상1층",
    "301동식당": "301동[신공학관1] 지상1층(교직원)/지하1층 ",
    "220동식당": " 220동[종합교육연구동] 지하1층",
    "소담마루": "113동[동원생활관] 지상3층",
    "라운지오": "113동[동원생활관] 지상1층",
    "샤반": "500동[대학원연구동(2단계)] 지상1층",
    "아워홈": "901동[학생생활관] 지상1층",
]

/// Cafeteria description
var cafeDescription: [String: String] = [
    "학생회관식당": "A,B,C 코너에서 각각 양식, 뚝배기 등 2~3가지의 메뉴를 판매합니다. 지하는 평일 점심을 11:00-13:30, 분식을 14:00-18:00에 운영합니다.",
    "자하연식당": "1~2가지 메뉴의 식사를 판매합니다. 3층은 교직원 전용으로 11:30-19:00 운영합니다.",
    "예술계식당": "한식, 양식, 저칼로리의 2가지 메뉴를 판매합니다.",
    "두레미담": "한정식 위주의 식단을 판매하며 서빙제, 셀프제, 회의실 등을 운영합니다. (단체 예약 시 저녁 식사 가능).",
    "동원관식당": "1~2 가지 식사를 판매합니다.",
    "기숙사식당": "연중무휴로 운영하며 다양한 메뉴의 식단을 판매하고 있습니다.",
    "공대간이식당": "30자장면, 30사천자장면, 30삼선짬뽕, 40짬짜면, 그 외에도 볶음밥이나 탕수육도 판매합니다.",
    "3식당": "2가지 메뉴의 식사와 매주 수요일 1개의 특식 메뉴를 판매하고 있습니다. 3층은 점심에만 운영.",
    "302동식당": "1~2 종류의 Set-Menu의 식사를 판매하며 Take out이 가능한 커피류와 스넥등을 판매합니다.",
    "301동식당": """
1~2 종류의 Set-Menu와 일품요리 및 직화메뉴, 한식,양식 등 다양한 메뉴와 별도에 라면 및 김밥코너를 운영하고 있습니다. 1층은 11:30~12:30에 교직원만 이용할 수 있습니다.
""",
    "220동식당": "주로 다양한 퓨전 한식의 식단을 판매합니다.",
    "소담마루": "한식, 일식 위주의 식단을 판매합니다. 주로 교직원을 대상으로 운영합니다.",
    "라운지오": "피자, 파스타등의 이태리 메뉴를 판매하고 있습니다.",
    "샤반": "한식 뷔폐 올반의 좋은 메뉴를 선별하여 판매합니다.",
    "아워홈": "날마다 한식 위주의 식단을 판매합니다.",
]
