//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 06/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation
import UIKit

class RemoveRefeicaoViewController {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController){
        self.viewController = viewController
    }
    
    func exibe(refeicao: Refeicao, handler: @escaping(UIAlertAction)->Void){
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alerta.addAction(botaoCancelar)
        alerta.addAction(botaoRemover)
        
        viewController.present(alerta, animated: true)
        
    }
}
