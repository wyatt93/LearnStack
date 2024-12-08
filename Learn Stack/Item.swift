//
//  Item.swift
//  Informatik Stack
//
//  Created by Fabian Meixner on 03.12.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    //Checked markiert, ob die Frage korrekt beantwortet wurde
    //var category: String
    var question: String
    var answer: String
    var checked: Bool
    
    //Initialisieren der variablen, neue Fragen immer erst false, da noch nicht bearbeitet
    init(question: String, answer: String){
        //self.category = category
        self.question = question
        self.answer = answer
        self.checked = false
    }
}
