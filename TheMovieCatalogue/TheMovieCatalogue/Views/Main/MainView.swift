//
//  MainView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 20/06/23.
//

import SwiftUI


struct MainView: View {
  var body: some View {
    NavigationStack {
      ZStack(alignment: .top) {
        Color("BackgroundColor")
          .ignoresSafeArea()
        ScrollView {
          RecomendedMovie()
          CarrouselView()
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing)
          {
            NavigationLink {
              EmptyView()
            } label: {
              Image(systemName: "person.fill")
            }
            .navigationTitle("Movie")
          }
          ToolbarItem(placement: .navigationBarLeading){}
        }
      }
    }
  }
}

struct PosterButton: View {
  var text: String
  @State private var showingSheet: Bool = false
  var body: some View {
    Button(action: {
      showingSheet.toggle()
    }, label: {
      Image("Batman")
        .resizable()
        .frame(width: 350, height: 460)
        .background(Color(.blue))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    })
    .sheet(isPresented: $showingSheet) {
      MovieDetailsView()
    }
  }
}

struct RecomendedMovie: View {
  var body: some View {
    VStack {
      HStack {
        Text("Recomended Movie")
          .padding(.horizontal)
          .font(.system(.title3, design: .rounded))
        Spacer()
      }
      PosterButton(text: "Poster")
        .padding(.bottom)
    }
    .frame(maxWidth: .infinity)
    .background(LinearGradient(colors:[Color("BackgroundColor"), Color("GradientColor")],startPoint: .top, endPoint: .bottom))
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
    MainView()
      .preferredColorScheme(.dark)
    MainView()
      .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
  }
}
