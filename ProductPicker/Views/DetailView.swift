//
//  DetailView.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 16/05/2024.
//

import SwiftUI

struct DetailView: View {
    var viewModel: ViewModel

    var body: some View {
        VStack (spacing: 8) {
            Text(viewModel.title)
                .font(.title)
                .bold()
                .opacity(Constants.UI.regularFontOpacity)
            Text(viewModel.subtitle)
                .font(.title2)
                .opacity(Constants.UI.lightFontOpacity)
        }
        .padding(.bottom)
        
        Spacer()
        
        VStack {
            Spacer()
            AsyncImage(url: viewModel.imageURL) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Spacer()
        }
    }
}


