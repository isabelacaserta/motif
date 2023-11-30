//
//  Motivo.swift
//  Motif
//
//  Created by Isabela Caserta on 06/10/23.
//

import Foundation

struct Motivo: Identifiable, Codable {
    
    var id = UUID()
    var name: String
    var tonalidade: Tonalidade
    var compasso: Compasso
    var andamento: Andamento
    var dinamica: Dinamica
    var carater: Carater
    
    var showing: Bool = false
    
    enum Tonalidade: String, CaseIterable, Identifiable, Codable {
        var id: Tonalidade { self }
        
        case random = "Random"
        case C = "C Major"
        case D = "D Major"
        case E = "E Major"
        case F = "F Major"
        case G = "G Major"
        case A = "A Major"
        case B = "B Major"
    }
    
    enum Compasso: String, CaseIterable, Identifiable, Codable {
        var id: Compasso { self }
        
        case random = "Random"
        case dois4 = "2/4"
        case tres4 = "3/4"
        case quatro4 = "4/4"
        case seis8 = "6/8"
    }
    
    enum Andamento: String, CaseIterable, Identifiable, Codable {
        var id: Andamento { self }
        
        case random = "Random"
        case presto = "Presto"
        case allegro = "Allegro"
        case moderato = "Moderato"
        case lento = "Lento"
        case largo = "Largo"
    }
    
    enum Dinamica: String, CaseIterable, Identifiable, Codable {
        var id: Dinamica { self }
        
        case random = "Random"
        case pianissimo = "Pianissimo"
        case piano = "Piano"
        case mezzo = "Mezzo"
    }
    
    enum Carater: String, CaseIterable, Identifiable, Codable {
        var id: Carater { self }
        
        case random = "Random"
        case epico = "Epic"
        case solene = "Solemn"
        case sombrio = "Dark"
        case alegre = "Cheerful"
        case tragico = "Tragic"
        case heroico = "Heroic"
        case romantico = "Romantic"
    }
}
