//
//  ViewController.swift
//  Calculatrice
//
//  Created by Sedera Nomentsoa on 19/03/2021.
//  Copyright © 2021 Laza Nomentsoa Rabesandratana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResultat: UILabel!
    @IBOutlet weak var lblAffichage: UILabel!
    
    
    
    var text: String = "" {
        didSet {
            lblResultat.text = text
        }
    }
    
    var textAffichage: String = "" {
        didSet {
            lblAffichage.text = textAffichage
        }
    }
    var nb1 : Double = 0
    var nb2 : Double = 0
    var clean : Bool = false
    var signe: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onClearAllListner(_ sender: UIButton) {
        text = "0"
        textAffichage = "0"
    }
    
    @IBAction func btnClique(_ sender: UIButton) {
        if clean == true {
            text = ""
            clean = false
        }
        switch sender.titleLabel?.text {
        case "+":
            nb1 = Double(text) ?? 0
            signe = "+"
            clean = true
            
            textAffichage +=  " + "
        case "=":
            nb2 = Double(text) ?? 0            
            switch signe {
            case "+":
                text = (nb1 + nb2).truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", (nb1 + nb2)) : String(nb1 + nb2)
            case "-":
                text = (nb1 - nb2).truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", (nb1 - nb2)) : String(nb1 + nb2)
            case "*":
                text = (nb1 * nb2).truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", (nb1 * nb2)) : String(nb1 + nb2)
            case "/":
                text = (nb1 / nb2).truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", (nb1 / nb2)) : String(nb1 + nb2)
            default:
                return
            }   
            
        case "-":
            nb1 = Double(text) ?? 0
            clean = true
            signe = "-"
            
            textAffichage +=  " - "
        case "x":
            nb1 = Double(text) ?? 0
            clean = true
            signe = "*"
            
            textAffichage += " x "
        case "/":
            nb1 = Double(text) ?? 0
            clean = true
            signe = "/"
            
            textAffichage +=  " / "
        case ".":
            if !text.contains("."){
                text += sender.titleLabel?.text ?? ""
                textAffichage += sender.titleLabel?.text ?? ""
            }
            
        default:
            if text != "0"{
                text += sender.titleLabel?.text ?? ""
                textAffichage += sender.titleLabel?.text ?? ""
            }else{
                text = sender.titleLabel?.text ?? ""
                textAffichage = sender.titleLabel?.text ?? ""
            }
        }
        
    }
    
}

