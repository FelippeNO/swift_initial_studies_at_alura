//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Felippe Negrão de Oliveira on 05/07/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoViewControllerDelegate{
    
    var refeicoes:Array<Refeicao> = [
        Refeicao(nome: "Pizza", felicidade: 4),
        Refeicao(nome: "Café", felicidade: 5),
        Refeicao(nome: "Bolo", felicidade: 3),
        Refeicao(nome: "Acarajé", felicidade: 5),
        Refeicao(nome: "Japonesa", felicidade: 1),
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Dois métodos obrigatórios para criaco de TableView.
    //Quantidade de celulas e conteudo.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula:UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil);
        let refeicaoString:String = refeicoes[indexPath.row].nome;
        celula.textLabel?.text = refeicaoString;
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        
        celula.addGestureRecognizer(longPressGesture)
        
        return celula;
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        print("LONG PRESSED")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self;
            }
        }
    }
    
    func add(a refeicao: Refeicao){
        refeicoes.append(refeicao);
        tableView.reloadData();
    }
}
