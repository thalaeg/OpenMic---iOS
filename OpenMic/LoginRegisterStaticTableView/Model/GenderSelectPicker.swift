//
//  GenderSelectPicker.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit




class GenderSelect: NSObject {
    
    private var genders = ["Male", "Female", "Other"]
    
    private var picker: UIPickerView
    
    init(picker: UIPickerView) {
        self.picker = picker
        super.init()

        
    }
    
    
    
}

extension GenderSelect: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        return  NSAttributedString(string: genres[row].genre, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
//    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //delegate?.selectedGenre(genre: genres[row])
    }
    
}
