//
//  KlikIDMStepperButton.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 21/11/24.
//


import SwiftUI

struct KlikIDMStepperButton: View {
    var actionIncreased: () -> Void
    var actionDecreased: () -> Void
    var style: Style? = .White
    
    var body: some View {
        HStack {
            decreasedButton()
            itemCount()
            increasedButton()
        }
            .if (style == .White) { view in
                view.padding(3)
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.whiteIDM))
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.grey30, lineWidth: 1))
            }
            .if (style == .Blue) { view in
                view.padding(4)
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.blue50))
            }
    }
    
    func decreasedButton() -> some View {
        Button(action: actionIncreased) {
            Image("minus")
                .resizable()
                .renderingMode(.template)
        }
        .if (style == .White) { view in
            view.foregroundColor(Color.blue50)
        }
        .if (style == .Blue) { view in
            view.foregroundColor(Color.whiteIDM)
        }
        .frame(width: 20, height: 20)
        .padding(4)
    }
    
    func increasedButton() -> some View {
        Button(action: actionIncreased) {
            Image("plus")
                .resizable()
                .renderingMode(.template)
        }
        .frame(width: 20, height: 20).if (style == .White) { view in
            view.foregroundColor(Color.whiteIDM)
                .padding(4)
                .background(Circle().fill(Color.blue50))
        }
        .if (style == .Blue) { view in
            view.foregroundColor(Color.blue50)
                .padding(3)
                .background(Circle().fill(Color.whiteIDM))
                .overlay((Circle().stroke(Color.blue50, lineWidth: 1)))
        }
    }
    
    func itemCount() -> some View {
        Text("1")
            .font(.headline)
            .if (style == .White) { view in
                view.foregroundColor(Color.blue50)
            }
            .if (style == .Blue) { view in
                view.foregroundColor(Color.whiteIDM)
            }
            .padding(.horizontal, 8)
    }
    
    
    enum Style {
        case White
        case Blue
    }
}
