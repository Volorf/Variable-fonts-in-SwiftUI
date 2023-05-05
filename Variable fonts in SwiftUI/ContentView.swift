//
//  ContentView.swift
//  Variable fonts in SwiftUI
//
//  Created by Oleg Frolov on 05/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fontWeight = 100.0
    @State private var fontSize = 32.0
    
    private var fontSizeStep = 20.0
    private var fontWeightStep = 200.0
    
    private var minFontSize = 32.0
    private var maxFontSize = 96.0
    private var minFontWeight = 100.0
    private var maxFontWeight = 800.0
    
    private var lightColor = "Light"
    private var darkColor = "Dark"
    private var whiteColor = "White"
    private var lightGrayColor = "Light Gray"
    
    var body: some View {
        ZStack
        {
            Color(lightColor).ignoresSafeArea()
            VStack {
                Text("Variable fonts in SwiftUI").foregroundColor(Color(lightGrayColor))
                Spacer()
                Text("hello").font(.robotoFlex(size: fontSize, weight: fontWeight)).foregroundColor(Color(darkColor))
                Spacer()
                HStack (spacing: 16.0) {
                    Button{
                        print("Decreased")
                        if (fontWeight > minFontWeight)
                        {
                            fontWeight -= fontWeightStep
                            fontSize -= fontSizeStep
                        }
                        
                    } label: {
                        Image(systemName: "minus")
                            .frame(width: 120.0, height: 64.0)
                            .imageScale(.large)
                            .foregroundColor(fontWeight > minFontWeight ? Color(darkColor) : Color(lightGrayColor))
                            .background(Color(whiteColor))
                            .cornerRadius(8.0)
                    }
                    Button{
                        print("Increased")
                        if (fontWeight < maxFontWeight)
                        {
                            fontWeight += fontWeightStep
                            fontSize += fontSizeStep
                        }
                        
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(fontWeight < maxFontWeight ? Color(darkColor) : Color(lightGrayColor))
                            .frame(width: 120.0, height: 64.0)
                            .background(Color(whiteColor))
                            .cornerRadius(8.0)
                    }
                    
                    
                }
                
            }
            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: fontSize)
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Font {
    static func robotoFlex(size: CGFloat, slant: CGFloat = 0, weight: CGFloat = 0) -> Font {
        let descriptor = UIFontDescriptor(fontAttributes: [
            .name: "Roboto Flex",
            kCTFontVariationAttribute as UIFontDescriptor.AttributeName: [
                /* 'wght' */ 0x77676874: weight,
                /* 'slnt' */ 0x736c6e74: slant
            ]
        ])
        
        return Font(UIFont(descriptor: descriptor, size: size))
    }
}

