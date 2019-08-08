//
//  ViewController.swift
//  3dtouch hello world
//
//  Created by MacInBox on 07/08/19.
//  Copyright © 2019 MacInBox. All rights reserved.
//

import UIKit

enum ForceTouch {
    case cartaoVirtual, fatura, atendimento, beneficios
    
    func getName() -> String {
        switch self {
        case .cartaoVirtual:
            return "Cartão Virtual"
        case .fatura:
            return "Minha fatura"
        case .atendimento:
            return "Atendimento"
        case .beneficios:
            return "Benefícios"
        default:
            return ""
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var lblAction: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: NSNotification.Name("post"), object: nil)
    }
    
    @objc func handleNotification() {
        if traitCollection.forceTouchCapability == .available, let _ = Singleton.shared.forceTouch {
            lblAction.isHidden = false
            lblAction.text = "\(Singleton.shared.type!.getName())"
            Singleton.shared.forceTouch = nil
            Singleton.shared.type = nil
        } else {
            lblAction.isHidden = true
        }
        
        view.layoutIfNeeded()
    }
}
