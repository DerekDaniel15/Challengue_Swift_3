//
//  HomeViewController.swift
//  PC3
//
//  Created by Daniel Derek Arredondo Asto on 3/12/22.
//

import UIKit

class HomeViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate, AddTareaViewControllerDelegate, DescripcionViewControllerDelegate{

    var tareas: [Tareas] = [Tareas(titulo: "Saltar", descripcion: "asdads", prioriodad: "asdadsa")]

    @IBOutlet weak var homeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTable.dataSource = self
        homeTable.delegate = self
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    @IBAction func Delete(_ sender: Any) {
        print(sender)
        //tareas.remove(at: index)
        //homeTable.reloadData()
    }
    
    func deleteTarea(_view: UIViewController, didDelete index: Int) {
        tareas.remove(at: index)
        print(tareas)
        homeTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add",
           let addTareaView = segue.destination as? AddTareaViewController {
            addTareaView.delegate = self
        }
            
        if segue.identifier == "descrip",
           let descriptoinView = segue.destination as? DescripcionViewController {
            descriptoinView.delegate = self
        }
    }
    
    func addTarea(_view: UIViewController, didcreateTarea tarea: Tareas) {
        tareas.append(tarea)
        print(tareas)
        homeTable.reloadData()
    }
}

extension HomeViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tarea = tareas[indexPath.row]
        guard let descripcionViewController = storyboard?.instantiateViewController(withIdentifier: "DescripcionViewController") as? DescripcionViewController else {
            return
        }
        descripcionViewController.tarea = tarea
        descripcionViewController.index = indexPath.row
        descripcionViewController.delegate = self
        descripcionViewController.modalPresentationStyle = .fullScreen
        present(descripcionViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = homeTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell {
            let tarea = tareas[indexPath.row]
            cell.titulo.text = tarea.titulo
            cell.prioridad.text = tarea.prioriodad
            return cell
        }else {
            return UITableViewCell()
        }
    }
}
