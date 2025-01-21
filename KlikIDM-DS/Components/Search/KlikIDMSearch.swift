//
//  Search.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 21/11/24.
//

import SwiftUI

struct KlikIDMSearch: View {
    var animation: KlikIDMSearch.Animation
    var action: () -> Void
    
    @State var text: String = ""
    @FocusState var isFocused: Bool
    @State private var placeholderText: String = ""
    @State private var placeholderIndex: Int = 0
    @State private var isAnimating: Bool = true
    @State private var offset: CGFloat = 0
    @State private var opacity: Double = 1
    
    let fullPlaceholder = "Cari di Klik Indomaret"
    let arrayPlaceholder = ["Makanan", "Minuman", "Sabun", "Frozen Food"]
    
    var body: some View {
        switch animation {
        case KlikIDMSearch.Animation.append: Search().onAppear(perform: animateAppend)
        case KlikIDMSearch.Animation.append_prefix: Search().onAppear(perform: animateAppendPrefix)
        case KlikIDMSearch.Animation.slide: Search().onAppear(perform: animateSlide)
        default: Search().onAppear(perform: animateNon)
        }
    }
    
    func Search() -> some View {
        HStack(spacing: 8) {
            Image("search")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.grey50)
                .frame(width: 24, height: 24)
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
            
            TextField("", text: $text)
                .font(KlikIDMFont.Body.B3.Small)
                .foregroundColor(Color.grey70)
                .padding(.trailing, 8)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .focused($isFocused)
                .placeholder(when: text.isEmpty) {
                    Text(placeholderText)
                        .font(KlikIDMFont.Body.B3.Small)
                        .foregroundColor(Color.grey40)
                }
                .onSubmit {
                    action()
                }
            
            if(isFocused && text.count >= 1) {
                Button(action: {
                    text = ""
                }) {
                    Image("error")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.grey50)
                        .frame(width: 16, height: 16)
                        .padding(.trailing, 8)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 12)
            .stroke(isFocused ? Color.blue30 : Color.grey30, lineWidth: 1))
    }
    
    func animateNon() {
        placeholderText = fullPlaceholder
    }
    
    func animateAppend() {
        guard isAnimating else { return }
        
        placeholderText = "C"
        var charIndex = 1
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if charIndex < fullPlaceholder.count {
                placeholderText.append(fullPlaceholder[fullPlaceholder.index(fullPlaceholder.startIndex, offsetBy: charIndex)])
                charIndex += 1
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    placeholderText = "C"
                    charIndex = 1
                    animateAppend()
                }
            }
        }
    }
    
    func animateAppendPrefix() {
        guard isAnimating else { return }
        placeholderText = "Cari "
        
        var charIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            let placeholder = arrayPlaceholder[placeholderIndex]
            
            if charIndex < placeholder.count {
                placeholderText.append(placeholder[placeholder.index(placeholder.startIndex, offsetBy: charIndex)])
                charIndex += 1
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    placeholderText = "Cari "
                    charIndex = 0
                    if placeholderIndex < (arrayPlaceholder.count-1) { placeholderIndex = placeholderIndex+1 }
                    else { placeholderIndex = 0 }
                    
                    animateAppendPrefix()
                }
            }
        }
    }
    
    func animateSlide() {
        guard isAnimating else { return }
        
        placeholderText = "Cari "
        
        func animate() {
            withAnimation(.easeInOut(duration: 0.3)) {
                offset = -20
                opacity = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                offset = 20
                placeholderText = "Cari "+arrayPlaceholder[placeholderIndex]
                
                withAnimation(.easeInOut(duration: 0.3)) {
                    offset = 0
                    opacity = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if placeholderIndex < (arrayPlaceholder.count - 1) {
                        placeholderIndex += 1
                    } else {
                        placeholderIndex = 0
                    }
                    animate()
                }
            }
        }
        
        animate()
    }
    
    enum Animation {
        case non
        case append
        case append_prefix
        case slide
        case slide_prefix
    }
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
