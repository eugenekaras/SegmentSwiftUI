//
//  ContentView.swift
//  SegmentSwiftUI
//
//  Created by Евгений Карась on 10.12.22.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    @State var offSetX = 0
    
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["w1","w4","w3"]
    
    var body: some View {
        VStack{
            ZStack{
                Text("Кросовки-\(company[segmentIndex])")
                    .font(Font.system(.title))
                Spacer()
                RoundedRectangle(cornerRadius: 10).fill(Color.gray)
                    .offset(x: CGFloat(offSetX))
                
                Image(sneakers[segmentIndex])
                    .resizable()
                    .frame(width: 300,height: 300)
                    .offset(x: CGFloat(offSetX))
            }
            Picker(selection: Binding(get: {
                segmentIndex
            }, set: { newValue in
                print(newValue)
            })) {
                ForEach(0..<company.count) {
                    Text(self.company[$0]).tag($0)
                }
            }
        label: {
            Text("")
        }.pickerStyle(.segmented)
                .padding()
            Spacer().frame(height: 150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
