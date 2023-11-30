//
//  ContentView.swift
//  Motif
//
//  Created by Isabela Caserta on 03/10/23.
//

import SwiftUI

struct MotivoView: View {
    @State private var isSheetPresented = false
    @State var motivo: Motivo = Motivo(name: "", tonalidade: .random, compasso: .random, andamento: .random, dinamica: .random, carater: .random)
    @State private var tonalidadeSelecionada = false
    @State private var formaDeCompassoSelecionada = false
    @State private var andamentoSelecionado = false
    @State private var dinamicaSelecionada = false
    @State private var caraterSelecionado = false
    @State private var resultado: [String] = []
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var motivoRepository: MotivoRepository
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    
                    HStack {
                        HStack(alignment: .firstTextBaseline) {
                            Text("Musical")
                                .font(.system(size: 60))
                                .fontWidth(.condensed)
                                .bold()
                            Text("MOTIF")
                                .fontWidth(.condensed)
                                .bold()
                                .foregroundStyle(.blue)
        
                            
                        }
                        Spacer()
                        
//                        NavigationLink {
//                            AcervoView()
//                        } label: {
//                            Image(systemName: "bookmark.fill")
//                                .font(.title)
//                                .foregroundColor(.blue)
//                                .frame(width: 48, height: 48)
//                        }
                    }
                    
                    VStack(spacing: 16) {
                        Group {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(tonalidadeSelecionada == false ? Color(uiColor: .systemGray6) : Color(uiColor: .white))
                                VStack(alignment:. leading) {
                                    HStack {
                                        HStack(spacing: 16) {
                                            Image(systemName: "circle.fill")
                                                .foregroundColor(tonalidadeSelecionada == false ? Color(uiColor: .white) : .blue)
                                            Text("Musical Key")
                                                .fontWidth(.condensed)
                                                .font(.title3)
                                                .bold()
                                        }
                                        Spacer()
                                        Button(action: {
                                            tonalidadeSelecionada.toggle()
                                        }, label: {
                                            Image(systemName: tonalidadeSelecionada == false ? "plus" : "minus")
                                                .frame(width: 48, height: 48)
                                        })
                                    }
                                    if tonalidadeSelecionada {
                                        HStack {
                                            Text("Type")
                                            Picker(selection: $motivo.tonalidade, label: Text("Escolha uma opção:")) {
                                                ForEach(Motivo.Tonalidade.allCases) { t in
                                                    Text(t.rawValue).tag(t)
                                                }
                                            }.pickerStyle(MenuPickerStyle())
                                            
                                        }
                                    }
                                }
                                .padding([.leading], 32)
                                .padding([.trailing], 20)
                                .padding([.vertical], 12)
                                .foregroundColor(tonalidadeSelecionada == false ? Color(uiColor: .white) : Color(uiColor: .systemGray6))
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(formaDeCompassoSelecionada == false ? Color(uiColor: .systemGray6) : Color(uiColor: .white))
                                VStack(alignment:. leading) {
                                    HStack {
                                        HStack(spacing: 16) {
                                            Image(systemName: "triangle.fill")
                                                .foregroundColor(formaDeCompassoSelecionada == false ? Color(uiColor: .white) : .blue)
                                            Text("Time Signature")
                                                .fontWidth(.condensed)
                                                .font(.title3)
                                                .bold()
                                        }
                                        Spacer()
                                        Button(action: {
                                            formaDeCompassoSelecionada.toggle()
                                        }, label: {
                                            Image(systemName: formaDeCompassoSelecionada == false ? "plus" : "minus")
                                                .frame(width: 48, height: 48)
                                        })
                                    }
                                    if formaDeCompassoSelecionada {
                                        HStack {
                                            Text("Type")
                                            Picker(selection: $motivo.compasso, label: Text("Escolha uma opção:")) {
                                                ForEach(Motivo.Compasso.allCases) { t in
                                                    Text(t.rawValue).tag(t)
                                                }
                                            }.pickerStyle(MenuPickerStyle())
                                        }
                                    }
                                }
                                .padding([.leading], 32)
                                .padding([.trailing], 20)
                                .padding([.vertical], 12)
                                .foregroundColor(formaDeCompassoSelecionada == false ? Color(uiColor: .white) : Color(uiColor: .systemGray6))
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(andamentoSelecionado == false ? Color(uiColor: .systemGray6) : Color(uiColor: .white))
                                VStack(alignment:. leading) {
                                    HStack {
                                        HStack(spacing: 16) {
                                            Image(systemName: "square.fill")
                                                .foregroundColor(andamentoSelecionado == false ? Color(uiColor: .white) : .blue)
                                            Text("Tempo")
                                                .fontWidth(.condensed)
                                                .font(.title3)
                                                .bold()
                                        }
                                        Spacer()
                                        Button(action: {
                                            andamentoSelecionado.toggle()
                                        }, label: {
                                            Image(systemName: andamentoSelecionado == false ? "plus" : "minus")
                                                .frame(width: 48, height: 48)
                                        })
                                        
                                    }
                                    if andamentoSelecionado {
                                        HStack {
                                            Text("Type")
                                            Picker(selection: $motivo.andamento, label: Text("Escolha uma opção:")) {
                                                ForEach(Motivo.Andamento.allCases) { t in
                                                    Text(t.rawValue).tag(t)
                                                }
                                            }.pickerStyle(MenuPickerStyle())
                                        }
                                    }
                                }
                                .padding([.leading], 32)
                                .padding([.trailing], 20)
                                .padding([.vertical], 12)
                                .foregroundColor(andamentoSelecionado == false ? Color(uiColor: .white) : Color(uiColor: .systemGray6))
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(caraterSelecionado == false ? Color(uiColor: .systemGray6) : Color(uiColor: .white))
                                VStack(alignment:. leading) {
                                    HStack {
                                        HStack(spacing: 16) {
                                            Image(systemName: "hexagon.fill")
                                                .foregroundColor(caraterSelecionado == false ? Color(uiColor: .white) : .blue)
                                            
                                            Text("Musical Character")
                                                .fontWidth(.condensed)
                                                .font(.title3)
                                                .bold()
                                        }
                                        Spacer()
                                        Button(action: {
                                            caraterSelecionado.toggle()
                                        }, label: {
                                            Image(systemName: caraterSelecionado == false ? "plus" : "minus")
                                                .frame(width: 48, height: 48)
                                        })
                                    }
                                    if caraterSelecionado {
                                        HStack {
                                            Text("Type")
                                            Picker(selection: $motivo.carater, label: Text("Escolha uma opção:")) {
                                                ForEach(Motivo.Carater.allCases) { t in
                                                    Text(t.rawValue).tag(t)
                                                }
                                            }.pickerStyle(MenuPickerStyle())
                                        }
                                    }
                                }
                                .padding([.leading], 32)
                                .padding([.trailing], 20)
                                .padding([.vertical], 12)
                                .foregroundColor(caraterSelecionado == false ? Color(uiColor: .white) : Color(uiColor: .black))
                            }
                        }
                    }
                    
                }
//                .padding()
                
                Spacer()
                
                Button(action: {
                    self.gerarMotivo()
                    self.isSheetPresented = true
                    
                }) {
                    ZStack {
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 60)
                        HStack(spacing: 12) {
                            Image(systemName: "music.note")
                                .foregroundColor(.black)
                            
                            Text("Geneate motif")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .fontWidth(.condensed)
                                .font(.title2)
                        }
                        .padding([.top], 8)
                    }
                    .disabled(tonalidadeSelecionada == false && formaDeCompassoSelecionada == false && andamentoSelecionado == false && dinamicaSelecionada == false && caraterSelecionado == false)
                    .frame(maxWidth: .infinity)
                    
                }
                .background(.blue)
            }
            
            .preferredColorScheme(.dark)
            
            
        }
        .sheet(isPresented: $isSheetPresented) {
            ResultadoView(parentDismiss: dismiss, motivo: $motivo, tonalidadeSelecionada: $tonalidadeSelecionada, formaDeCompassoSelecionada: $formaDeCompassoSelecionada, andamentoSelecionado: $andamentoSelecionado, dinamicaSelecionada: $dinamicaSelecionada, caraterSelecionado: $caraterSelecionado)
                
        }
    }
    
    func gerarMotivo() {
        motivo.showing = true
        
        if tonalidadeSelecionada {
            while motivo.tonalidade == .random {
                motivo.tonalidade = Motivo.Tonalidade.allCases.randomElement()!
            }
        }
        
        if formaDeCompassoSelecionada {
            while motivo.compasso == .random {
                motivo.compasso = Motivo.Compasso.allCases.randomElement()!
            }
        }
        
        if andamentoSelecionado {
            while motivo.andamento == .random {
                motivo.andamento = Motivo.Andamento.allCases.randomElement()!
            }
        }
        
        if caraterSelecionado {
            while motivo.carater == .random {
                motivo.carater = Motivo.Carater.allCases.randomElement()!
            }
        }
    }
}

struct ResultadoView: View {
    var parentDismiss: DismissAction
    
    @EnvironmentObject var motivoRepository: MotivoRepository
    @Environment(\.dismiss) var dismiss
//    @StateObject private var motivoRepository = MotivoRepository()

    @Binding var motivo: Motivo
    @Binding var tonalidadeSelecionada: Bool
    @Binding var formaDeCompassoSelecionada: Bool
    @Binding var andamentoSelecionado: Bool
    @Binding var dinamicaSelecionada: Bool
    @Binding var caraterSelecionado: Bool
    
    @State private var savedResults: [String] = []
    
    var body: some View {
        VStack(spacing: 40) {
            HStack(alignment: .firstTextBaseline) {
                Text("Musical")
                    .font(.system(size: 60))
                    .fontWidth(.condensed)
                    .bold()
                Text("MOTIF")
                    .fontWidth(.condensed)
                    .bold()
                    .foregroundStyle(.blue)
            }
            .padding(.top)
            
            TextField("Write your musical motif name", text: $motivo.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top], 40)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        if motivo.tonalidade != .random {
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
                        
                        if motivo.compasso != .random {
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
                        
                        if motivo.andamento != .random {
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
                        
                        if motivo.carater != .random {
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
            
            HStack {
                Button(action: {
                    motivo = Motivo(name: motivo.name, tonalidade: .random, compasso: .random, andamento: .random, dinamica: .random, carater: .random)
                    dismiss()
                    tonalidadeSelecionada = false
                    formaDeCompassoSelecionada = false
                    andamentoSelecionado = false
                    dinamicaSelecionada = false
                    caraterSelecionado = false
                    
                }) {
                    Text("New motif")
                        .padding()
                        .foregroundColor(.white)
                        .fontWidth(.condensed)
                        .font(.title3)
                }
                Spacer()
                
                Button(action: {
                    saveResult()
                    dismiss()
                    parentDismiss()
                }) {
                    Text("Save motif")
                        .padding()
                        .padding([.horizontal], 16)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .fontWidth(.condensed)
                        .font(.title3)
                }
            }
        }
        .padding()
//        .environmentObject(motivoRepository)

    }
    
    func saveResult() {
        motivoRepository.save(motivo: motivo)
        
    }
    
}



struct MotivoView_Previews: PreviewProvider {
    static var previews: some View {
        MotivoView()
    }
}
