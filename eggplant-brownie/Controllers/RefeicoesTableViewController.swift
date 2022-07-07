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
        guard let caminho = recuperaCaminho() else {return}
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {return}
            refeicoes = refeicoesSalvas
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("refeicao")
        return caminho
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
        
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else {return}
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(viewController: self).exibe(refeicao: refeicao, handler: {
                alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
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
        guard let caminho = recuperaCaminho() else {return}
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
        
        
        
        tableView.reloadData();
    }
}
