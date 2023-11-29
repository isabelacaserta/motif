//
//  MotivoRepository.swift
//  Motif
//
//  Created by Isabela Caserta on 09/10/23.
//

import Foundation

class MotivoRepository: ObservableObject {
    @Published var motivos: [Motivo] = []
    
    init() {
        guard let motivosData = UserDefaults.standard.object(forKey: "motivos") as? Data,
              let motivos = try? JSONDecoder().decode([Motivo].self, from: motivosData) else { return }
        self.motivos = motivos
    }
    
    func save(motivo: Motivo) {
        motivos.append(motivo)
        saveOnUserDefaults()
    }
    
    private func saveOnUserDefaults() {
        guard let motivosJSON = try? JSONEncoder().encode(motivos) else { return }
        
        UserDefaults.standard.set(motivosJSON, forKey: "motivos")
    }
}
