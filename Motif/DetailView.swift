//
//  DetailView.swift
//  Motif
//
//  Created by Isabela Caserta on 09/10/23.
//

import SwiftUI

struct DetailView: View {
    
    let motivo: Motivo
    @State var name = ""


    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    HStack(alignment: .firstTextBaseline) {
                        Text(motivo.name)
                            .font(.system(size: 60))
                            .fontWidth(.condensed)
                            .bold()
                            
                        Text("MOTIF")
                    }
                    Spacer()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(uiColor: .systemGray6))
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            if motivo.tonalidade != nil {
                                HStack(alignment: .firstTextBaseline, spacing: 8) {
                                    Text("TONALIDADE")
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .font(.system(size: 16))
                                        .fontWeight(.light)
                                    Text(motivo.tonalidade.rawValue)
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .bold()
                                        .font(.system(size: 28))
                                        .padding(.bottom)
                                    Spacer()
                                }
                                
                            }
                            
                            if motivo.compasso != nil {
                                HStack(alignment: .firstTextBaseline, spacing: 8) {
                                    Text("COMPASSO")
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .font(.system(size: 16))
                                        .fontWeight(.light)
                                        .padding(.top)
                                    Text(motivo.compasso.rawValue)
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .bold()
                                        .font(.system(size: 28))
                                        .padding(.bottom)
                                    Spacer()
                                }
                            }
                            
                            if motivo.andamento != nil {
                                HStack(alignment: .firstTextBaseline, spacing: 8) {
                                    Text("ANDAMENTO")
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .font(.system(size: 16))
                                        .fontWeight(.light)
                                        .padding(.top)
                                    Text(motivo.andamento.rawValue)
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .bold()
                                        .font(.system(size: 28))
                                        .padding(.bottom)
                                    Spacer()
                                }
                            }
                            
                            if motivo.carater != nil {
                                HStack(alignment: .firstTextBaseline, spacing: 8) {
                                    Text("CARÁTER")
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .font(.system(size: 16))
                                        .fontWeight(.light)
                                        .padding(.top)
                                    Text(motivo.carater.rawValue)
                                        .foregroundColor(.white)
                                        .fontWidth(.condensed)
                                        .bold()
                                        .font(.system(size: 28))
                                        .padding(.bottom)
                                    Spacer()
                                }
                            }
                        }
                        .padding(32)
                    }

                }
                
                TextField("Nome", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.top], 40)
                TextField("Descrição", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.top], 40)
                

            }
        }
        .padding()
        .preferredColorScheme(.dark)



    }

}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(motivo: Motivo(name: "Farofa", tonalidade: .A, compasso: .dois4, andamento: .allegro, dinamica: .mezzo, carater: .alegre))
    }
}

