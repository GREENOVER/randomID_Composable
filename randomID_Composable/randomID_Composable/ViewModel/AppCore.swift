import SwiftUI
import Combine
import ComposableArchitecture

struct AppState: Equatable {
  static func == (lhs: AppState, rhs: AppState) -> Bool {
    return lhs.displayIDText == rhs.displayIDText
  }
  
  var fetchResult: Result<RandomInfo, NSError>?
  
  var displayIDText: String? {
    return fetchResult.flatMap({ fetchResult in
      switch fetchResult {
      case let .success(randomInfo):
        return "\(randomInfo.id)"
      default:
        return nil
      }
    })
  }
  
  var displayTitleText: String? {
    return fetchResult.flatMap({ fetchResult in
      switch fetchResult {
      case let .success(randomInfo):
        return "\(randomInfo.title)"
      default:
        return nil
      }
    })
  }
}

enum AppAction {
  case clickButton
  case viewDidAppear
  case fetchResult(Result<RandomInfo, NSError>)
}

struct AppEnvironment {
  var fetch: FetchRandomInfo
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
  switch action {
  case .clickButton:
    return environment.fetch.fetch().map(AppAction.fetchResult).eraseToAnyPublisher()
      .eraseToEffect()
    
  case .viewDidAppear:
    return environment.fetch.fetch().map(AppAction.fetchResult).eraseToAnyPublisher()
      .eraseToEffect()
    
  case let .fetchResult(result):
    state.fetchResult = result
    return .none
  }
}
