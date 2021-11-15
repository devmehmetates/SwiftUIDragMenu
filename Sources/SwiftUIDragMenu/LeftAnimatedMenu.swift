//
//  SwiftUIView.swift
//  
//
//  Created by Mehmet Ateş on 15.11.2021.
//

import SwiftUI

@available(iOS 13.0, *)
public struct LeftAnimatedMenu<Content : View , SecondContent : View>: View {
    @State private var dragOffSet = -UIScreen.main.bounds.width * 0.75 as CGFloat
    @State private var shadowOpa = 0.0
    @State private var buttonOffSet = 0.0 as CGFloat
    @State private var crossOrFlat = 0.0 as CGFloat
    @State private var upOrDown = Int(UIScreen.main.bounds.width * 0.09 / 3)
    @State var isCross = false
    @Environment (\.colorScheme) private var colorScheme
    private let content: Content
    private let secondContent: SecondContent
    init(@ViewBuilder content: () -> Content,@ViewBuilder seconContent: () -> SecondContent) {
        self.content = content()
        self.secondContent = seconContent()
    }
    @available(iOS 13.0, *)
    public var body: some View {
        ZStack{
            if #available(iOS 14.0, *) {
                VStack{
                    self.content
                }.overlay(Rectangle().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).opacity(self.shadowOpa).ignoresSafeArea().onTapGesture(perform: {
                    withAnimation(.easeInOut(duration: 1)){
                        self.dragOffSet = -UIScreen.main.bounds.width * 0.75
                        self.buttonOffSet = 0
                        self.shadowOpa = 0.0
                        self.isCross = false
                        self.crossOrFlat = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut) {
                                self.upOrDown = Int(UIScreen.main.bounds.width * 0.09 / 3)
                            }
                        }
                    }
                }))
            } else {
                // Fallback on earlier versions
            }
            HStack{
                ZStack{
                    if #available(iOS 14.0, *) {
                        Rectangle()
                            .shadow(color: .primary.opacity(self.shadowOpa), radius: 3)
                            .foregroundColor(self.colorScheme == ColorScheme.dark ? .black : .white)
                            .frame(width: UIScreen.main.bounds.width * 0.80 ,height: UIScreen.main.bounds.height)
                            .ignoresSafeArea()
                            .offset(x:self.dragOffSet)
                    } else {
                    }
                    VStack{
                        self.secondContent
                    }.offset(x:self.dragOffSet)
                }
                Spacer()
            }
            VStack{
                HStack{
                    ButtonAnimation(isSmooth: false, scale: UIScreen.main.bounds.width * 0.09, isCross: self.$isCross, upOrDown: self.$upOrDown, crossOrFlat: self.$crossOrFlat, barColor: .primary){
                        withAnimation(.easeInOut(duration: 1)){
                            self.dragOffSet = -UIScreen.main.bounds.width * 0.75
                            self.shadowOpa = 0.0
                            self.buttonOffSet = 0
                            self.crossOrFlat = 0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation(.easeInOut) {
                                    self.upOrDown = Int(UIScreen.main.bounds.width * 0.09 / 3)
                                }
                            }
                        }
                    } menuFunc: {
                        withAnimation(.easeInOut(duration: 1)) {
                            self.dragOffSet = -10
                            self.shadowOpa = 0.3
                            self.buttonOffSet = UIScreen.main.bounds.width * 0.55
                            self.upOrDown = 0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation(.easeInOut) {
                                    self.crossOrFlat = 45
                                }
                                
                            }
                        }
                    }
                    Spacer()
                }.padding()
                
                Spacer()
            }.padding()
                .padding(.top)
                .offset(x:self.buttonOffSet)
        }
    }
}
