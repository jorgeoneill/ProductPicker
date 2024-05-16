//
//  MainView.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 15/05/2024.
//

import SwiftUI

struct MainView: View {
    var viewModel: ViewModel

    var body: some View {
        if let emptyViewTitle = viewModel.emptyViewTitle {
            Text(emptyViewTitle)
        } else {
            NavigationStack {
                List(viewModel.cellViewModels) { cellViewModel in
                    NavigationLink {
                        DetailView(viewModel: cellViewModel.detailViewModel)
                    } label: {
                        CellView(viewModel: cellViewModel)
                    }
                }
                .navigationTitle(viewModel.navigationTitle)
                Text(viewModel.footerTitle)
                    .opacity(Constants.UI.lightFontOpacity)
                    .bold()
            }
        }
    }
}

 #Preview {
     MainView(viewModel: MainView.ViewModel())
 }
 
