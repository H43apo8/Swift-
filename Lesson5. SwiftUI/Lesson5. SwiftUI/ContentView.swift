//
//  ContentView.swift
//  Lesson5. SwiftUI
//
//  Created by Максим Бобков on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var goToFirst = false
    @State private var isTap = false
    @StateObject var counter = Counter()
    
    /* Другие обёртки
    
    @StateObject - тип оболочки, который позволяет создавать экземпляр наблюдаемого объекта, то есть экземпляр класса, который соответствует ObservableObject
    
    @EnvironmentObject - тип оболочки для наблюдаемого объекта, предоставляемого view. Позволяет внедрить в иерархию view экземпляр наблюдаемого объекта
    
    @Envitonment - оболочка свойства, которая считывает значение из среды представления. Благодаря @Environment можно получить доступ к общесистемным настройкам, например, локали
    */
    
    var body: some View {
        
        // Переход между представлениями после версии 16
        NavigationStack {
            NavigationLink("TestView", destination: {
                TestView()
            }).navigationTitle("Это ContentView")
        }
        
        // Переход между представлениями до версии 16
        NavigationView {
            
            NavigationLink(isActive: $goToFirst, destination: {
                NextView(goToFirst: $goToFirst)
            }, label: {
                Text("NextView")
            }).navigationTitle("Это ContentView")
            
//            NavigationLink("NextView", destination: {
//                NextView()
//            }).navigationTitle("Это ContentView")
        }
        
        // По нажатии на кнопке меняется состояние свитчей
        VStack {
            // Знак $ позволяет передать именно ссылку на объект, в противном случае значение будет просто скопировано
            NewView(isTap: $isTap)
            Button("Tap", action: {
                isTap.toggle()
            })
        }
        
        // Счетчик в тексте увеличивается от нажатия на кнопку
        VStack {
            Text("Текущий счет \(counter.count)")
                .font(.title)
                .fontWeight(.light)
            ButtonView(counter: counter)
        }
        
        // Смена текста по нажатию на кнопку
        VStack {
            if isTap {
                Text ("Goodbye!").font(.title)
            } else {
                Text ("Hello!")
                    .font(.title)
            }
            Button("Tap", action: {
                isTap.toggle()
            })
        }
        
        // Список из элементов - иконка и текст рядом
        List(0..<3) { item in
            HStack {
                Image(systemName: "person")
                
                VStack {
                    Text("Hello!")
                        .font(.title)
                    Text ("Goodbye!")
                        .font(.body)
                }
            }
        }
        
        // Слова в ряд
        HStack {
            Text("Hello!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .padding()
            Text("Goodbye!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .padding()
        }
    }
}



// По нажатии на кнопке меняется состояние свитчей ---------------
struct NewView: View {
    
    @Binding var isTap: Bool
    
    var body: some View {
    
        VStack {
            
            Toggle(isOn: $isTap) {
                Text ("Switch")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
        
            Toggle (isOn: $isTap) {
                Text("Switch")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            Toggle(isOn: $isTap) {
                Text ("Switch")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
        }
    }
}
// /По нажатии на кнопке меняется состояние свитчей --------------



// Счетчик в тексте увеличивается от нажатия на кнопку -----------
class Counter: ObservableObject {
    @Published var count = 0
}

struct ButtonView: View {
    @ObservedObject var counter: Counter
        var body: some View {
            Button ("Tap") {
            counter.count += 1
        }
    }
}
// /Счетчик в тексте увеличивается от нажатия на кнопку ----------



// Переход между представлениями после версии 16 -----------------
struct TestView: View {
    var body: some View {
        Text("TestView")
    }
}
// /Переход между представлениями после версии 16 ----------------



// Переход между представлениями до версии 16 --------------------
struct NextView: View {
    
    @Binding var goToFirst: Bool
    
    var body: some View {
        NavigationLink("NextNextView", destination: {
            NextNextView(goToFirst: $goToFirst)
        }).navigationTitle("Это NextView")
    }
}

struct NextNextView: View {
    
    @Binding var goToFirst: Bool
    
    var body: some View {
        
        VStack {
            NavigationLink("FinalView", destination: {
                FinalView(goToFirst: $goToFirst)
            })
            NavigationLink( "FinalView", destination: {
                FinalView(goToFirst: $goToFirst)
            })
            NavigationLink( "FinalView", destination: {
                FinalView(goToFirst: $goToFirst)
            })
        }.navigationTitle("Это NextNextView")
    }
}

struct FinalView: View {
    
    @Binding var goToFirst: Bool
    
    var body: some View {
  
        Text("FinalView")
        
        Button("Tap", action: {
            goToFirst = false
        }).navigationTitle("Это FinalView")
    }
}


// /Переход между представлениями до версии 16 ------------------

//#Preview {
//    ContentView()
//}
