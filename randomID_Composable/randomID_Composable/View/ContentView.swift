import SwiftUI

struct ContentView: View {
  @State var idText: String = "ID"
  @State var titleText: String = "TITLE"
  
  var body: some View {
    VStack {
      Text(idText)
      Text(titleText)
      Button("통신", action: {
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
