//
//  PickerViewExtension.swift
//  Tarot
//
//  Created by Serge Gori on 14/06/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit

extension JeuResultatController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func miseEnPlacePicker() {
        pickerViewAppele.delegate = self
        pickerViewAppele.dataSource = self
        
        pickerViewPreneur.delegate = self
        pickerViewPreneur.dataSource = self
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cellTab.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cellTab[row].surnom.text
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let surnomDuPreneur = cellTab[row].surnom.text ?? "surnom"
        print("Ligne choisie: " + surnomDuPreneur)
    }
}


