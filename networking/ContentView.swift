//
//  ContentView.swift
//  networking
//
//  Created by Tom Rochat on 01/04/2020.
//  Copyright © 2020 Tom Rochat. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var task: AnyCancellable?

    var body: some View {
        Button(action: self.getUser) {
            Text("Get tomrcht")
        }
    }

    // MARK: - API methods
    private func getUser() -> Void {
        task = GithubApi.tomrcht()
            .sink(receiveCompletion: { finished in
                switch finished {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("call finished without errors")
                }
            }) { result in
                print(result)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
