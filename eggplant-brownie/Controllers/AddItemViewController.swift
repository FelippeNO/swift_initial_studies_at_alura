//
//  AddItemViewController.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 05/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AddItemViewController: UIViewController {
    
    //MARK: - Atributos
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AddItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeItemTextField: UITextField!
    @IBOutlet weak var qntdCaloriasTextField: UITextField!
    @IBOutlet weak var botaoAdd: UIButton!
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    
    
    @IBAction func addItem(_ sender: Any) {
        guard let nomeItem = nomeItemTextField.text, let qntdCalorias = qntdCaloriasTextField.text else {return}
        
        if let numeroDeCalorias = Double(qntdCalorias){
            let item = Item(nome: nomeItem, calorias: numeroDeCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
