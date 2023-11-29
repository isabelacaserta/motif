//
//  EducativaView.swift
//  Motif
//
//  Created by Isabela Caserta on 06/10/23.
//

import SwiftUI

struct EducativaView: View {
    let items = ["Tonalidade", "Compasso", "Andamento", "Dinâmica", "Caráter"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: Text("\(item)")) {
                    Text(item)
                }
            }
//            .navigationBarTitle("Composição")
        }
    }
}

struct EducativaView_Previews: PreviewProvider {
    static var previews: some View {
        EducativaView()
    }
}

