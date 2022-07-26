//
//  SelectedMovieView.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 26/07/22.
//

import SwiftUI

struct SelectedMovieView: View {
    
    @ObservedObject var viewModel: MovieDetailsViewModel
    @State var buttonPressed = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            AsyncImage(url: URL(string: viewModel.selectedMovie.urlImage)){ headerImage in
               
                ((headerImage.image) ?? Image(uiImage: UIImage()))
                    .resizable()
                    .frame(width: viewModel.frame.width, height: viewModel.frame.height * 0.6)
                    .scaledToFill()
            }
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(viewModel.selectedMovie.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        buttonPressed.toggle()
                    }, label: {
                        Image(systemName: buttonPressed ? "heart.fill" : "heart")
                            .foregroundColor(Color(UIColor{
                                $0.userInterfaceStyle == .dark ? .white : .black
                            }))
                    })
                }
                    HStack(spacing: 15){
                        HStack(spacing: 5){
                            Image(systemName: "heart.fill")
                            Text("\(viewModel.selectedMovie.vote_count ?? 2000)K Likes")
                                .font(.callout)
                                .fontWeight(.medium)
                        }
                        HStack(spacing: 5){
                            Image(systemName: "play.tv")
                            Text("\(viewModel.selectedMovie.popularity ?? 0)")
                                .font(.callout)
                                .fontWeight(.medium)
                        }
                    }.opacity(0.8)
                
                
            }
            .padding(.top, 70)
            .background( LinearGradient(gradient: Color.gradient, startPoint: .top, endPoint: .bottom))
        }
    }
}

struct SelectedMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMovieView(viewModel: MovieDetailsViewModel())
    }
}
