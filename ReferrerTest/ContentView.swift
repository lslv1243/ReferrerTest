//
//  ContentView.swift
//  ReferrerTest
//
//  Created by Leonardo da Silva on 16/08/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onOpenURL(perform: { url in
            print("url=\(url)")
        })
        .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: { userActivity in
            print("type=\(userActivity.activityType)")
        })
    }
}

#Preview {
    ContentView()
}
