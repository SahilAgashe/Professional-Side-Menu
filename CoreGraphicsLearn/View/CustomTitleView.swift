//
//  CustomTitleView.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 30/12/23.
//

import SwiftUI

struct CustomTitleView: View {
    var body: some View {
        HStack {
            Image("menu")
                .resizable()
                .renderingMode(.template)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)

            Spacer()
            
            Text("Side Menu")
                .foregroundStyle(.white)
            
            Spacer()
        }
        .background(Color(UIColor.darkGray))
    }
}


#Preview {
    CustomTitleView()
}
