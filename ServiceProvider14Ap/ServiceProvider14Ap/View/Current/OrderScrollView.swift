

import SwiftUI

struct OrderScrollView: View {
  
  var orderinfo: OrderInfo
  var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
  @State private var showModel: Bool = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // CARD IMAGE
      Image("company_image")
        .resizable()
        .scaledToFit()
        .overlay(
          HStack {
            Spacer()
            VStack {
              Image(systemName: "bookmark.fill")
                .font(Font.title.weight(.light))
                .foregroundColor(Color.white)
                .imageScale(.small)
                .shadow(color: Color("ColorBlackTransparentLight"), radius: 20, x: 0, y: 0)
                .padding(.trailing, 20)
                .padding(.top, 22)
              Spacer()
            }
          }
        )
      
      VStack(alignment: .leading, spacing: 12) {

        
        Text(orderinfo.customer)
            .font(.system(.title2, design: .serif))
            .fontWeight(.bold)
            .italic()
            .foregroundColor(Color("Blue"))
            .lineLimit(1)
        
        HStack(alignment: .center, spacing: 2) {
          Image(systemName: "alarm")
          Text("Time: \(orderinfo.time)")
            .font(.system(.title, design: .serif))
        }
    
        
      }
      .padding()
      .padding(.bottom, 12)
    }
    .background(Color.white)
    .cornerRadius(12)
    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
    .onTapGesture {
      self.hapticImpact.impactOccurred()
      self.showModel = true
    }
    .sheet(isPresented: self.$showModel) {
      OrderDetails(orderinfo: self.orderinfo)
    }
  }
}

struct OrderScrollView_Previews: PreviewProvider {
  static var previews: some View {
    OrderScrollView(orderinfo: OrderInfoData[0])
      .previewLayout(.sizeThatFits)
  }
}
