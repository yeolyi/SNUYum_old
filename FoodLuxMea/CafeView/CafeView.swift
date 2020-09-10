//
//  FullCafeInfpView.swift
//  FoodLuxMea
//
//  Created by Seong Yeol Yi on 2020/08/21.
//

import SwiftUI
import GoogleMobileAds

struct CafeView: View {
    @State var cafeInfo: Cafe
    @State var isMapView = false
    @State var showActionSheet = false

    @EnvironmentObject var cafeList: ListManager
    @EnvironmentObject var settingManager: SettingManager
    
    let themeColor = ThemeColor()
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("식단 자세히 보기")
                        .font(.system(size: CGFloat(18), weight: .bold))
                        .foregroundColor(.secondary)
                    Text(cafeInfo.name)
                        .font(.system(size: CGFloat(25), weight: .bold))
                }
                .padding([.leading, .top])
                Spacer()
                Button(action: {
                        let _ = self.cafeList.toggleFixed(cafeName: self.cafeInfo.name)
                        self.cafeList.save()
                }) {
                    Image(systemName: cafeList.isFixed(cafeName: self.cafeInfo.name) ? "pin" : "pin.slash")
                        .font(.system(size: 25, weight: .light))
                        .foregroundColor(themeColor.colorIcon(colorScheme))
                        .offset(y: 10)
                }
                Button(action: { self.presentationMode.wrappedValue.dismiss()}) {
                    Text("닫기")
                        .font(.system(size: CGFloat(20), weight: .light))
                        .foregroundColor(themeColor.colorIcon(colorScheme))
                        .padding()
                        .offset(y: 10)
                }
            }
            
            Divider()
        
            ScrollView {
                
                
                Text("안내")
                    .modifier(SectionTextModifier())
                
                HStack {
                    Spacer()
                    TimerText(cafeName: cafeInfo.name)
                    Spacer()
                }
                    .modifier(ListRow())
                
                mealSection(mealType: .breakfast, mealMenus: cafeInfo.bkfMenuList)
                mealSection(mealType: .lunch, mealMenus: cafeInfo.lunchMenuList)
                mealSection(mealType: .dinner, mealMenus: cafeInfo.dinnerMenuList)
                
                
                Text("식당목록")
                .modifier(SectionTextModifier())
                
                VStack {
                
                    Text(cafeDescription[cafeInfo.name] ?? "정보 없음")
                        .font(.system(size: 16))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    
                    HStack {
                        
                        HStack {
                            Spacer()
                            Image(systemName: "phone")
                                .font(.system(size: 20))
                                .foregroundColor(themeColor.colorTitle(colorScheme))
                            Text("전화 걸기")
                                .font(.system(size: 16))
                                .foregroundColor(themeColor.colorTitle(colorScheme))
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            let telephone = "tel://02-"
                            let formattedString = telephone + self.cafeInfo.phoneNum
                            guard let url = URL(string: formattedString) else { return }
                            UIApplication.shared.open(url)
                        }
                    
                        Divider()
                        
                        HStack {
                            Spacer()
                            Image(systemName: "map")
                                .font(.system(size: 20, weight: .light))
                                .foregroundColor(themeColor.colorTitle(colorScheme))
                            Text("위치 보기")
                                .font(.system(size: 16))
                                .foregroundColor(themeColor.colorTitle(colorScheme))
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.isMapView = true
                        }
                    }
                }
                .modifier(ListRow())
                
            }
            
            Divider()
            
            /*
            GADBannerViewController()
            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
 */
        }
        .sheet(isPresented: $isMapView) {
            MapView(cafeInfo: self.cafeInfo)
                .environmentObject(self.themeColor)
        }
    }
    
    func mealSection(mealType: MealType, mealMenus: [Menu]) -> AnyView {
        
        //&& cafeOperatingHour[cafeInfo.name]?.dayOfTheWeek(date: settingManager.date)?.meal(mealType) != nil
        //이 조건은 왜?????
        
        if (mealMenus.isEmpty == false ) {
            return AnyView(
                VStack {
                    Text(mealType.rawValue + " (" + (cafeOperatingHour[cafeInfo.name]?.dayOfTheWeek(date: settingManager.date)?.meal(mealType) ?? "시간 정보 없음")  + ")")
                            .modifier(SectionTextModifier())
                ForEach(mealMenus) { menu in
                    HStack{
                        Text(menu.name)
                            .modifier(TitleText())
                            .foregroundColor(self.themeColor.colorTitle(self.colorScheme))
                            .fixedSize(horizontal: false, vertical: true)
                            .onTapGesture {
                                print(menu.name)
                        }
                        Spacer()
                        Text(self.costInterpret(menu.cost) ?? "")
                            .foregroundColor(Color(.gray))
                    }
                .modifier(ListRow())
                }
            }
            )
        }
    else {
        return AnyView(EmptyView())
    }

        
    }
    
    func costInterpret(_ cost: Int) -> String?{
        if (cost == -1) {
            return nil
        }
        else if ((cost - 10) % 100 == 0) {
            return String(cost - 10) + "원 부터"
        }
        else {
            return String(cost) + "원"
        }
    }
}

struct CafeView_Previews: PreviewProvider {
    static var dataManager = DataManager()
    static var listManager = ListManager()
    static var settingManager = SettingManager()
    
    
    static var previews: some View {
        
        CafeView_Previews.settingManager.update(date: Date())
        CafeView_Previews.listManager.update(newCafeList: CafeView_Previews.dataManager.getData(at: Date()))
        
        return CafeView(cafeInfo: previewCafe)
            .environmentObject(self.dataManager)
            .environmentObject(self.listManager)
            .environmentObject(self.settingManager)
    }
}
