import SwiftUI
import CombineExt
import ComposableArchitecture

@main
struct randomID_ComposableApp: App {
  static let fetchRandomInfo = FetchRandomInfo()
  
  var body: some Scene {
    WindowGroup {
      AppView(store: Store<AppState, AppAction>.init(initialState: AppState.init(), reducer: appReducer, environment: AppEnvironment(fetch: Self.fetchRandomInfo)))
    }
  }
}
