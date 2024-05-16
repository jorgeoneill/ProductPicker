//
//  CellView.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 16/05/2024.
//

import SwiftUI

struct CellView: View {
    var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Circle()
                .fill(Constants.UI.cellBackgroundColor)
                .frame(
                    width: Constants.UI.cellIconRadius,
                    height: Constants.UI.cellIconRadius
                )
                .overlay(
                    Text(viewModel.icon)
                        .font(.largeTitle)
                )

            VStack (alignment: .leading) {
                Text(viewModel.title)
                    .font(.body)
                    .bold()
                    .opacity(Constants.UI.regularFontOpacity)
                Text(viewModel.subtitle)
                    .font(.callout)
                    .opacity(Constants.UI.lightFontOpacity)
            }
        }
    }
}
