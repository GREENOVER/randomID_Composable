import SwiftUI
import ComposableArchitecture
import Combine

struct AppView: View {
  var store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        Text(viewStore.displayIDText ?? "ID")
        Text(viewStore.displayTitleText ?? "TITLE")
        Button("통신", action: { viewStore.send(.clickButton)
        })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: Store<AppState, AppAction>.init(initialState: AppState.init(), reducer: appReducer, environment: AppEnvironment(fetch: FetchRandomInfo())))
  }
}
