import SwiftUI
import Combine
import ComposableArchitecture

struct AppState: Equatable {
  static func == (lhs: AppState, rhs: AppState) -> Bool {
    return (rhs.fetchResult != nil)
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

enum AppAction: Equatable {
  case clickButton
  case viewDidAppear
}

struct AppEnvironment {
  var fetch: FetchRandomInfo
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
  switch action {
  case .clickButton:
    let a = environment.fetch.fetch().map { randomInfo in
      state.fetchResult = randomInfo
    }
    
    
    
    
  case .viewDidAppear:
    break
  }
}
