//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 07/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation

class ItemDAO{
    func save(_ itens: Array<Item>){
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else {return}
            try dados.write(to: caminho)
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
    
    func recupera() -> Array<Item>{
        do {
            guard let caminho = recuperaDiretorio() else {return []}
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: Item.self, from: dados) else {return []}
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
