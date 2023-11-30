//
//  Acervo.swift
//  Motif
//
//  Created by Isabela Caserta on 06/10/23.
//

import SwiftUI

struct AcervoView: View {
    @EnvironmentObject var motivoRepository: MotivoRepository
    @State var deleteConfirmation = false
    @State var motivoToDelete : Motivo?
    @State var index = 0

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    HStack(alignment: .firstTextBaseline) {
                        Image("detail")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding([.trailing], 12)
                        Text("Collect")
                            .font(.system(size: 60))
                            .fontWidth(.condensed)
                            .bold()
                        
                        Text("MOTIF")
                            .fontWidth(.condensed)
                            .foregroundStyle(.blue)
                            .bold()

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
                    ForEach(Array(motivoRepository.motivos.enumerated()), id: \.offset) {index, m in
                        NavigationLink {
                            DetailView(motivo: m)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(Color(uiColor: .systemGray6))
                                HStack {
                                    Text(m.name)
                                        .font(.system(size: 20))
                                        .fontWidth(.condensed)
                                        .bold()
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .padding()
                            }
                        }
                        .contextMenu {
                                    Button(role: .destructive) {
                                        motivoToDelete = m
                                        self.index = index
                                        deleteConfirmation = true
                                    } label: {
                                        HStack {
                                            Text("Delete")
                                            Spacer()
                                            Image(systemName: "trash")
                                        }
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal,24)
                                        .padding(.vertical)
                                        .cornerRadius(46)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 46)
                                        }
                                    }
                                }
                        }.confirmationDialog("Are you sure?", isPresented: $deleteConfirmation,  titleVisibility: .visible,
                                             actions: {
                             Button("Yes",  role: .destructive) {
                                 guard let motivo = motivoToDelete else
                                 {
                                     return
                                 }
                                 deleteItems(index, motivoRepository)
                                 deleteConfirmation = false
                             }
                         })
                }
                .foregroundColor(.white)
            }
//            .padding()
            .preferredColorScheme(.dark)
        }
    }
}

func deleteItems(_ index : Int, _ motivoRepository : MotivoRepository) {
    motivoRepository.motivos.remove(at: index)
    motivoRepository.save()
}


struct AcervoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
