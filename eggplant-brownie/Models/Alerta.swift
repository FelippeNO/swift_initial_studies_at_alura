//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 06/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation
import UIKit

class Alerta{
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(title: String, message: String){
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Ok", style: .cancel)
        alerta.addAction(botaoCancelar);
        controller.present(alerta, animated: true, completion: nil)
    }
}
