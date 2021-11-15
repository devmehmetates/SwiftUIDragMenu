//
//  SwiftUIView.swift
//  
//
//  Created by Mehmet Ateş on 15.11.2021.
//

import SwiftUI

@available(iOS 13.0, *)
struct ButtonAnimation: View {
    @Binding private var isCross : Bool
    @Binding private var upOrDown : Int
    @Binding private var crossOrFlat : CGFloat
    private var isSmooth = false
    private var scale : CGFloat
    private var barColor : Color
    private var crossFunc : () -> Void
    private var menuFunc : () -> Void
    init (isSmooth : Bool ,scale : CGFloat, isCross : Binding<Bool> , upOrDown : Binding<Int> , crossOrFlat : Binding<CGFloat> , barColor : Color , crossFunc : @escaping () -> Void , menuFunc : @escaping ()-> Void){
        self.isSmooth = isSmooth
        self.scale = scale
        self.barColor = barColor
        self.crossFunc = crossFunc
        self.menuFunc = menuFunc
        self._upOrDown = upOrDown
        self._crossOrFlat = crossOrFlat
        self._isCross = isCross
    }
    public var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: self.isSmooth ? 16 : 0)
                .frame(width: self.scale, height: self.scale / 20)
                .rotationEffect(Angle.init(degrees: self.crossOrFlat),anchor: .center)
            RoundedRectangle(cornerRadius: self.isSmooth ? 16 : 0)
                .frame(width: self.scale, height: self.scale / 20)
                .offset(y:CGFloat(self.upOrDown))
                .rotationEffect(Angle.init(degrees: self.crossOrFlat * -1),anchor: .center)
            RoundedRectangle(cornerRadius: self.isSmooth ? 16 : 0)
                .frame(width: self.scale, height: self.scale / 20)
                .offset(y:CGFloat(self.upOrDown * -1))
                .rotationEffect(Angle.init(degrees: self.crossOrFlat),anchor: .center)
        }.frame(width: self.scale, height: self.scale)
            .foregroundColor(self.barColor)
            .onTapGesture {
                if self.isCross{
                    self.crossFunc()
                }else{
                    self.menuFunc()
                }
                self.isCross.toggle()
            }
    }
}
