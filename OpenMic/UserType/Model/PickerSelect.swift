//
//  GenreSelect.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
class PickerSelect: NSObject {
    
    private var genres = [Genre]()
    
    private var picker: UIPickerView
    var delegate: PickerSelectDelegate?
    
    init(picker: UIPickerView) {
        self.picker = picker
        super.init()

        getGenres()
    }
    
    private func getGenres() {
        Genre.readGenres { (genres) in
            self.genres = genres
            self.picker.reloadAllComponents()
        }
    }
    
    
}

extension PickerSelect: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].genre
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
      return  NSAttributedString(string: genres[row].genre, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.selectedGenre(genre: genres[row])
    }

}

protocol PickerSelectDelegate {
    func selectedGenre(genre: Genre)
}
