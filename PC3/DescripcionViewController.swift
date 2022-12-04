//
//  DescripcionViewController.swift
//  PC3
//
//  Created by Daniel Derek Arredondo Asto on 3/12/22.
//

import UIKit

protocol DescripcionViewControllerDelegate {
    func deleteTarea(_view: UIViewController, didDelete index:Int)
}

class DescripcionViewController: UIViewController {
    
    var tarea:Tareas?
    var index:Int?

    @IBOutlet weak var prioridad: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descripcion: UITextView!
    
    var delegate: DescripcionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prioridad.text =  tarea?.prioriodad
        titulo.text = tarea?.titulo
        descripcion.text = tarea?.descripcion
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Delete(_ sender: Any) {
        print(index)
        if let i = index {
            delegate?.deleteTarea(_view: self, didDelete: i)
            dismiss(animated: true)
        }else {
            return
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
