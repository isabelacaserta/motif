//
//  ContentView.swift
//  MotifSpark
//
//  Created by Isabela Caserta on 04/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var motivoRepository = MotivoRepository()
    
    var body: some View {
        AcervoView()
        .environmentObject(motivoRepository)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
