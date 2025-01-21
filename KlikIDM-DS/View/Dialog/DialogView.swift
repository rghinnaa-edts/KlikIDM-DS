//
//  Dialog.swift
//  KlikIDM-DS
//
//  Created by Rizka Ghinna Auliya on 03/12/24.
//

import SwiftUI

struct DialogView: View {
    @State private var showDialog = false
    @State private var showDialog2 = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                if(showDialog2 == false) {
                    Button(action: {
                        showDialog = true
                    }) {
                        Text("Show Dialog 1 Button")
                    }
                    .Dialog(isPresented: $showDialog,
                            title: "Basic dialog title",
                            description: "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                            primaryButtonText: "Button",
                            primaryAction: {})
                }
                
                if(showDialog == false) {
                    Button(action: {
                        showDialog2 = true
                    }) {
                        Text("Show Dialog 2 Button")
                    }
                    .Dialog(isPresented: $showDialog2,
                            title: "Basic dialog title",
                            description: "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                            primaryButtonText: "Button",
                            primaryAction: {},
                            secondaryButtonText: "Button",
                            secondaryAction: {})
                }
            }.navigationTitle("Dialog/Popup")
        }
    }
}

#Preview {
    DialogView()
}
