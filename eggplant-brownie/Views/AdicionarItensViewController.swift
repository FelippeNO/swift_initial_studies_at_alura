//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 05/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeItemTextField: UITextField!
    @IBOutlet weak var qntdCaloriasTextField: UITextField!
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nomeItem = nomeItemTextField.text, let qntdCalorias = qntdCaloriasTextField.text else {return}
        
        if let numeroDeCalorias = Double(qntdCalorias){
            let item = Item(nome: nomeItem, calorias: numeroDeCalorias)
            navigationController?.popViewController(animated: true)
        }
    }
}
