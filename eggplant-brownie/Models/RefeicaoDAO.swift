//
//  RefeicaoDAO.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 07/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation

class RefeicaoDAO{
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("refeicao")
        return caminho
    }
    
    func save(_ refeicoes: Array<Refeicao>){
        
        guard let caminho = recuperaCaminho() else {return}
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> Array<Refeicao>{
        guard let caminho = recuperaCaminho() else {return []}
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: Refeicao.self, from: dados) else {return []}
            return refeicoesSalvas
        } catch{
            print(error.localizedDescription)
            return []
        }
    }
}
