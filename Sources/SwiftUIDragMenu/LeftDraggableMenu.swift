import SwiftUI



@available(iOS 13.0, *)
public struct LeftDraggableMenu<Content : View , SecondContent : View> : View{
    @State private var dragOffSet = -UIScreen.main.bounds.width * 0.75 as CGFloat
    @State private var shadowOpa = 0.0
    @Environment (\.colorScheme) private var colorScheme
    private let content: Content
    private let secondContent: SecondContent
    init(@ViewBuilder content: () -> Content,@ViewBuilder seconContent: () -> SecondContent) {
        self.content = content()
        self.secondContent = seconContent()
    }
    public var body: some View{
        ZStack{
            if #available(iOS 14.0, *) {
                VStack{
                    self.content
                }.overlay(Rectangle().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).opacity(self.shadowOpa).ignoresSafeArea().onTapGesture(perform: {
                    withAnimation(.spring()){
                        self.dragOffSet = -UIScreen.main.bounds.width * 0.75
                        self.shadowOpa = 0.0
                    }
                }))
            } else {
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
                            .gesture(DragGesture().onEnded({ value in
                                withAnimation(.spring()){
                                    if value.translation.width > 150{
                                        self.dragOffSet = -10
                                        self.shadowOpa = 0.3
                                    }else{
                                        self.dragOffSet = -UIScreen.main.bounds.width * 0.75
                                        self.shadowOpa = 0.0
                                    }
                                }
                            }).onChanged({ value in
                                withAnimation(.spring()){
                                    if value .translation.width < 150{
                                        self.shadowOpa = value.translation.width / 500
                                    }
                                    if value.translation.width > 150{
                                        self.shadowOpa = 0.3
                                    }
                                    else{
                                        self.shadowOpa = 0
                                    }
                                    if value.translation.width < 250{
                                        self.dragOffSet = value.translation.width - UIScreen.main.bounds.width * 0.75
                                    }
                                    else{
                                        self.dragOffSet = -10
                                    }
                                }
                            }))
                    } else {
                    }
                    VStack{
                        self.secondContent
                    }.offset(x:self.dragOffSet)
                }
                Spacer()
            }
        }
    }
}
