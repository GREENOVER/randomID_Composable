import SwiftUI
import Combine
import ComposableArchitecture

struct AppState: Equatable {
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
  case stopRandomText
}

struct AppEnvironment {
  var fetch: FetchRandomInfo
  var mainQueue: AnySchedulerOf<DispatchQueue>
}

struct TimerId: Hashable { }

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
  switch action {
  case .clickButton:
    return .concatenate([
      Effect.cancel(id: TimerId()),
      environment.fetch.fetch().map(AppAction.fetchResult).eraseToAnyPublisher()
      .eraseToEffect()
    ])
    
  case .viewDidAppear:
    return Effect.timer(id: TimerId(), every: .seconds(3), on: DispatchQueue.main.eraseToAnyScheduler())
      .flatMap({ _ in environment.fetch.fetch() })
      .map(AppAction.fetchResult)
      .eraseToEffect()
    
  case let .fetchResult(result):
    state.fetchResult = result
    return.none
    
  case .stopRandomText:
    return Effect.cancel(id: TimerId())
  }
}
