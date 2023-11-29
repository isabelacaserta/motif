//
//  Acervo.swift
//  Motif
//
//  Created by Isabela Caserta on 06/10/23.
//

import SwiftUI

struct AcervoView: View {
    @EnvironmentObject var motivoRepository: MotivoRepository

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    HStack(alignment: .firstTextBaseline) {
                        Text("Collect")
                            .font(.system(size: 60))
                            .fontWidth(.condensed)
                            .bold()
                        
                        Text("MOTIF")
                            .fontWidth(.condensed)
                    }
                    Spacer()
                    NavigationLink {
                        MotivoView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                }
                .padding([.top], 16)
                
                VStack(spacing: 16) {
                    ForEach(motivoRepository.motivos) { m in
                        NavigationLink {
                            DetailView(motivo: m)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(uiColor: .systemGray6))
                                HStack {
                                    HStack(spacing: 16) {
                                        Image("image2")
                                            .resizable()
                                            .font(.system(size: 60))
                                            .frame(width: 56, height: 56)
                                            .cornerRadius(8)
                                        
                                        Text(m.name)
                                            .font(.system(size: 20))
                                            .fontWidth(.condensed)
    //                                        .bold()
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .padding()
                            }
                        }
                    }
                }
                .foregroundColor(.white)
            }
//            .padding()
            .preferredColorScheme(.dark)
        }
    }
}


struct AcervoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
