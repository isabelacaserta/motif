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
                            .font(.system(size: 56))
                            .fontWidth(.condensed)
                            .bold()
                            
                        Text("MOTIF")
                            .fontWidth(.condensed)
                            .foregroundStyle(.blue)
                            .bold()
                    }
                    Spacer()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(uiColor: .systemGray6))
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 48) {
                            
                            if motivo.tonalidade != nil && motivo.tonalidade != .random {
                                HStack(alignment: .lastTextBaseline, spacing: 12){
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.blue)
                                        .font(.title)
                                    VStack(spacing: 4) {
                                        Text("MUSICAL KEY")
                                            .foregroundColor(.white)
                                            .fontWidth(.condensed)
                                            .font(.system(size: 16))
                                            .fontWeight(.light)
                                        Text(motivo.tonalidade.rawValue)
                                            .foregroundColor(.white)
                                            .fontWidth(.condensed)
                                            .bold()
                                            .font(.system(size: 28))
                                    }
                                }
                            }
                            
                            if motivo.compasso != nil && motivo.compasso != .random {
                                HStack(alignment: .lastTextBaseline, spacing: 12){
                                    Image(systemName: "triangle.fill")
                                        .foregroundColor(.blue)
                                        .font(.title)
                                    VStack(alignment: .leading, spacing: 4){
                                        Text("TIME SIGNATURE")
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
                                    }
                                }
                            }
                            
                            if motivo.andamento != nil && motivo.andamento != .random{
                                HStack(alignment: .lastTextBaseline, spacing: 12){
                                    Image(systemName: "square.fill")
                                        .foregroundColor(.blue)
                                        .font(.title)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("TEMPO")
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
                                    }
                                }
                            }
                            
                            if motivo.carater != nil && motivo.carater != .random{
                                HStack(alignment: .lastTextBaseline, spacing: 12){
                                    Image(systemName: "hexagon.fill")
                                        .foregroundColor(.blue)
                                        .font(.title)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("MUSICAL CHARACTER")
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
                                    }
                                }
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(32)


                }
                
//                TextField("Name", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding([.top], 40)
//                TextField("Descrição", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding([.top], 40)
                

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

