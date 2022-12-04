//
//  AddTareaTableViewController.swift
//  PC3
//
//  Created by Daniel Derek Arredondo Asto on 3/12/22.
//

import UIKit

protocol AddTareaViewControllerDelegate {
    func addTarea(_view: UIViewController, didcreateTarea tarea: Tareas)
}

class AddTareaViewController: UIViewController {

    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var descripcion: UITextField!
    @IBOutlet weak var prioridad: UITextField!
    var delegate : AddTareaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func AddTarea(_ sender: Any) {
        guard let t = titulo.text, !t.isEmpty else { return }
        guard let d = descripcion.text, !d.isEmpty else { return }
        guard let p = prioridad.text, !p.isEmpty else { return }
        let tarea = Tareas(titulo: t, descripcion: d, prioriodad: p)
        delegate?.addTarea(_view: self, didcreateTarea: tarea)
        dismiss(animated: true)
    }
    
    
    
}
