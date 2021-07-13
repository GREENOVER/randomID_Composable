import SwiftUI
import Combine
import ComposableArchitecture

class ContentViewModel: ObservableObject {
  let didChange = PassthroughSubject<Void, Never>()
  private var cancellables: [AnyCancellable] = []

  enum Input {
    case viewDidAppear
    case buttonTap
  }
  
  func fetchRandomDate() {
    FetchRandomInfo.shared.fetchData(completion: {_ in
      // 데이터 변경
    })
  }
}
