//
//  InfoView.swift
//  FoodLuxMea
//
//  Created by Seong Yeol Yi on 2020/08/30.
//

import SwiftUI

// Show various app information.
struct InfoView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    let themeColor = ThemeColor()
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    let build = Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? ""
    
    var body: some View {
            VStack {
                // Custom navigation view.
                HStack {
                    TitleView(title: "스누냠 정보", subTitle: "설정")
                    Spacer()
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("닫기")
                            .font(.system(size: CGFloat(20), weight: .semibold))
                            .foregroundColor(themeColor.icon(colorScheme))
                            .padding()
                            .offset(y: 10)
                    }
                }
                Divider()
                // Snuyum app icon
                Image("Icon-1024")
                .resizable()
                .scaledToFit()
                .frame(width: 150.0,height:150)
            
                ScrollView{
                    //App version
                    Text("버전")
                        .sectionText()
                    HStack {
                        Spacer()
                        Text(appVersion)
                        Spacer()
                    }
                    .listRow()
                    // App build
                    Text("빌드")
                        .sectionText()
                    HStack {
                        Spacer()
                        Text(build)
                        Spacer()
                    }
                    .listRow()
                    // References
                    Text("자료 참조")
                        .sectionText()
                    HStack {
                        Spacer()
                        Text("서울대학교생활협동조합 홈페이지\n(snuco.snu.ac.kr)")
                        Spacer()
                    }
                    .listRow()
                    HStack {
                        Spacer()
                        Text("서울대학교 캠퍼스 맵\n(map.snu.ac.kr)")
                        Spacer()
                    }
                    .listRow()
                    // Developer
                    Text("개발자")
                        .sectionText()
                    HStack {
                        Spacer()
                        Text("이성열")
                        Spacer()
                    }
                    .listRow()
                }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(ThemeColor())
    }
}
