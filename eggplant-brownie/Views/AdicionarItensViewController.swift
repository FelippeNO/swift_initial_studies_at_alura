//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 05/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction

    @IBAction func adicionarItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
