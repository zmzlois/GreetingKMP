import UIKit
import SwiftUI
import ComposeApp
import Shared


struct ComposeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        MainViewControllerKt.MainViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel

      var body: some View {
          ListView(phrases: viewModel.greetings)
              .onAppear { self.viewModel.startObserving() }
      }
}



extension ContentView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var greetings: Array<String> = []

        func startObserving() {
            // ...
        }
    }
}

struct ListView: View {
    let phrases: Array<String>

    var body: some View {
        List(phrases, id: \.self) {
            Text($0)
        }
    }
}
