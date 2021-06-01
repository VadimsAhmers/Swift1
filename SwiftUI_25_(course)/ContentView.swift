//
//  ContentView.swift
//  SwiftUI_25_(course)
//
//  Created by Вадим Ахмеров on 01.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    @State var show = false
    
    var color1 = Color.init(red: 165/255, green: 38/255, blue: 10/255)
    var color2 = Color.init( red: 21/255, green: 96/255, blue: 189/255)
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image("avatar")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    
                    Text("Привет,")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("Вадим")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        self.index = 0
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25) {
                            Image("catalogue")
                                .resizable()
                                .foregroundColor(self.index == 0 ? color1 : Color.white)
                                .frame(width: 20, height: 20)
                            Text("Каталог")
                                .foregroundColor(self.index == 0 ? color1 : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? color1.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        //.padding(.top, 25)
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        self.index = 1
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25) {
                            Image("cart")
                                .resizable()
                                .foregroundColor(self.index == 1 ? color1 : Color.white)
                                .frame(width: 20, height: 20)
                            Text("Корзина")
                                .foregroundColor(self.index == 1 ? color1 : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? color1.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Button(action: {
                        self.index = 2
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25) {
                            Image("fav")
                                .resizable()
                                .foregroundColor(self.index == 2 ? color1 : Color.white)
                                .frame(width: 20, height: 20)
                            Text("Избранное")
                                .foregroundColor(self.index == 2 ? color1 : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? color1.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Button(action: {
                        self.index = 3
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25) {
                            Image("orders")
                                .resizable()
                                .foregroundColor(self.index == 3 ? color1 : Color.white)
                                .frame(width: 20, height: 20)
                            Text("Мои заказы")
                                .foregroundColor(self.index == 3 ? color1 : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? color1.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Image("out")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            Text("Выйти")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    })
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    })
                    
                    Text(self.index == 0 ? "Каталог" :
                            (self.index == 1 ? "Корзина" :
                                (self.index == 2 ? "Избранное" : "Мои Заказы" )) )
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader {_ in
                    VStack {
                        if self.index == 0 {
                            Catalogue()
                        }
                        else if self.index == 1 {
                            Cart()
                        }
                        else if self.index == 2 {
                            Fav()
                        }
                        else {
                            Orders()
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
        }
        .background(color2.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct Catalogue: View {
    var body: some View {
        VStack {
            Text("Каталог")
        }
    }
}

struct Cart: View {
    var body: some View {
        VStack {
            Text("Корзина")
        }
    }
}

struct Fav: View {
    var body: some View {
        VStack {
            Text("Избранное")
        }
    }
}

struct Orders: View {
    var body: some View {
        VStack {
            Text("Мои заказы")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
