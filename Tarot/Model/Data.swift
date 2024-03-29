//
//  Data.swift
//  Tarot
//
//  Created by Serge Gori on 14/06/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit
import CoreData

struct  Data {
    
    static func dataPersonne() {
        
        Data.deletePersonnes()
        
        let img: UIImage = #imageLiteral(resourceName: "vador")
        
        let gege = Personne(context: contexte)
        gege.idJoueur = 1
        gege.surnom = "Gégé"
        gege.prenom = "Géraldine"
        gege.nom = "Colo"
        gege.horodate = Date()
        gege.photo = img
        
        let loulou = Personne(context: contexte)
        loulou.idJoueur = 2
        loulou.surnom = "Loulou"
        loulou.prenom = "Alain"
        loulou.nom = "Colo"
        loulou.horodate = Date()
        loulou.photo = img

        let serge = Personne(context: contexte)
        serge.idJoueur = 3
        serge.surnom = "Sergio"
        serge.prenom = "Serge"
        serge.nom = "Gori"
        serge.horodate = Date()
        serge.photo = img

        let filou = Personne(context: contexte)
        filou.idJoueur = 4
        filou.surnom = "Filou"
        filou.prenom = "Philippe"
        filou.nom = "Cantin"
        filou.horodate = Date()
        filou.photo = img

        let marc = Personne(context: contexte)
        marc.idJoueur = 5
        marc.surnom = "Marc"
        marc.prenom = "Marc"
        marc.nom = "Tissier"
        marc.horodate = Date()
        marc.photo = img
        
        let robert = Personne(context: contexte)
        robert.idJoueur = 6
        robert.surnom = "Robert"
        robert.prenom = "Robert"
        robert.nom = "Gouget"
        robert.horodate = Date()
        robert.photo = img
        
        let alain = Personne(context: contexte)
        alain.idJoueur = 7
        alain.surnom = "Alain"
        alain.prenom = "Alain"
        alain.nom = "Vincent"
        alain.horodate = Date()
        alain.photo = img
        
        let armelle = Personne(context: contexte)
        armelle.idJoueur = 8
        armelle.surnom = "Armelle"
        armelle.prenom = "Armelle"
        armelle.nom = "Guiheneux"
        armelle.horodate = Date()
        armelle.photo = img

        do {
            try AppDelegate.viewContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }

    private static func deletePersonnes() {
        let aSupprimer = Personne.all()
        
        for item in aSupprimer {
            let aSupprimer = item as NSManagedObject
            contexte.delete(aSupprimer)
        }
        
        do {
            try? contexte.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
//    let subject: String
//    let body: String
//    let date: Date
//    var unread = false
//
//    init(from: String, subject: String, body: String, date: Date) {
//        self.from = from
//        self.subject = subject
//        self.body = body
//        self.date = date
//    }
    
}

//let mockPersonnes: [Personne] = [
//    Personne(surnom: "Toto", prenom: "Serge", nom: "Gori"),

