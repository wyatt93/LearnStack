//
//  NewItemSheet.swift
//  Informatik Stack
//
//  Created by Fabian Meixner on 07.12.24.
//

import SwiftUI

struct NewItemSheet: View {
    //NewItemSheet zugriff auf den Context geben
    @Environment(\.modelContext) private var modelContect
    @Environment(\.dismiss) private var dismiss
    
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Frage", text: $question)
                TextField("Antwort", text: $answer)
            }
            .navigationTitle("Neue Frage")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Abbrechen"){
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Speichern"){
                        let item = Item(question: question, answer: answer)
                        modelContect.insert(item)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewItemSheet()
}
