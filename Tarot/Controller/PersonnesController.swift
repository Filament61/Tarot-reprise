//
//  Personnes.swift
//  Tarot
//
//  Created by Serge Gori on 18/06/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit
import CoreData

class PersonnesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellId = "PersonneCell"
    
    var personnes = [Personne]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPersonnes()
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return joueursTab.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnes.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 320
//    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? UITableViewCell
//        cell?.textLabel?.text = "\(indexPath.row)"
//        return cell!
//
        let joueurDeLaCell = personnes[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PersonneCell {
            cell.miseEnPlace(personne: joueurDeLaCell)
            return cell
        }
        return UITableViewCell()
        
    }
 

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            if let personneASupprimmer = personnes[indexPath.row] as? Personne {
                contexte.delete(personneASupprimmer)
                do {
                    try contexte.save()
                } catch {
                    print(error.localizedDescription)
                }
                personnes.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        default: break
        }
    }
    
    
    func fetchPersonnes() {
        let requete: NSFetchRequest<Personne> = Personne.fetchRequest()
        let tri = NSSortDescriptor(key: "nom", ascending: true)
        requete.sortDescriptors = [tri]
        do {
            personnes = try contexte.fetch(requete)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }

    
}
