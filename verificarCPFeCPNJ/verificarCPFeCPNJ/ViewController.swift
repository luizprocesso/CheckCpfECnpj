//
//  ViewController.swift
//  verificarCPFeCPNJ
//
//  Created by Luiz Otávio Processo on 21/05/19.
//  Copyright © 2019 Luiz Otávio Processo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var digitoDoc: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func verificaDocc(_ sender: Any) {
        
        let num:String? = digitoDoc.text
        let numArray:[String] = (num?.map{String($0)})!
 
        var soma1 = 0
        var soma2 = 0
        var verificadorUm = 10
        var verificadorDois = 11

        if(numArray[0] == numArray[1] && numArray[1] == numArray[2] && numArray[2] == numArray[3] && numArray[3] == numArray[4] && numArray[4] == numArray[5] && numArray[5] == numArray[6] && numArray[6] == numArray[7] && numArray[7] == numArray[8] && numArray[8] == numArray[9]){
            label.textColor = .red
            label.text = "cpf não válido"
            
        }else if(numArray.count == 11){
            for i in 0...numArray.count-3{
                if let digCpf = Int(numArray[i]){
                    soma1 += digCpf*verificadorUm
                }
                verificadorUm = verificadorUm-1
            }
            var restoDig1 = 11-soma1%11
            restoDig1 > 9 ? (restoDig1 = 0) : (restoDig1 = restoDig1)
           
            if(restoDig1 == Int(numArray[9])){
                for i in 0...numArray.count-2{
                    if let digCpf = Int(numArray[i]){
                        soma2 += digCpf*verificadorDois
                    }
                    verificadorDois = verificadorDois-1
                }
                var restoDig2 = 11-soma2%11
                restoDig2 > 9 ? (restoDig2 = 0) : (restoDig2 = restoDig2)

                if(restoDig2 == Int(numArray[10])){
                    label.textColor = .green
                    label.text = "cpf válido"
                }else{
                    label.textColor = .red
                    label.text = "cpf não válido"
                }
                
            }else{
                label.textColor = .red
                label.text = "cpf não válido"
            }
        }else if(numArray.count != 11 || numArray.count != 14){
            label.textColor = .red
            label.text = "cpf não válido"
        }
        
        
        if(numArray.count == 14){
            
            var verificadorCnpjUm = 5
            var verificadorCnpjDois = 9
            var somaCnpj1 = 0
            
            var verificadorCnpjTres = 6
            var verificadorCnpjQuatro = 9
            var somaCnpj2 = 0
            
            for i in 0..<4{
                if let digCnpj = Int(numArray[i]){
                    somaCnpj1 += digCnpj*verificadorCnpjUm
                }
                verificadorCnpjUm = verificadorCnpjUm - 1
            }
            for i in 4..<12{
                if let digCnpj = Int(numArray[i]){
                    somaCnpj1 += digCnpj*verificadorCnpjDois
                }
                verificadorCnpjDois = verificadorCnpjDois - 1
            }
            
            var restoCnpjDig1 = 11-somaCnpj1%11
            restoCnpjDig1 > 9 ? (restoCnpjDig1 = 0) : (restoCnpjDig1 = restoCnpjDig1)
            
            if(restoCnpjDig1 == Int(numArray[12])!){
                for i in 0..<5{
                    if let digCnpj = Int(numArray[i]){
                        somaCnpj2 += digCnpj*verificadorCnpjTres
                    }
                    verificadorCnpjTres = verificadorCnpjTres - 1
                }
                for i in 5..<13{
                    if let digCnpj = Int(numArray[i]){
                        somaCnpj2 += digCnpj*verificadorCnpjQuatro
                    }
                    verificadorCnpjQuatro = verificadorCnpjQuatro - 1
                }
                
                var restoCnpjDig2 = 11-somaCnpj2%11
                restoCnpjDig2 > 9 ? (restoCnpjDig2 = 0) : (restoCnpjDig2 = restoCnpjDig2)
                
                if(restoCnpjDig2 == Int(numArray[13])!){
                    label.textColor = .blue
                    label.text = "CNPJ é válido"
                    
                }else{
                    label.textColor = .yellow
                    label.text = "CNPJ não é válido"
                }
                
            }else{
                label.textColor = .yellow
                label.text = "CNPJ não é válido"
            }
        }
        
        
    }
}

