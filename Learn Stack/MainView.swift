//
//  MainView.swift
//  Informatik Stack
//
//  Created by Fabian Meixner on 03.12.24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @State private var isFlipped = false
    @State private var isShowingItemSheet = false
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        FlashCard(question: item.question, answer: item.answer, checked: item.checked)
                    } label: {
                        Text(item.question)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .sheet(isPresented: $isShowingItemSheet, content: {
                NewItemSheet()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        if items.isEmpty {
            ContentUnavailableView(
                label: {Label("Keine Daten", systemImage: "list.bullet.rectangle.portrait")},
                description: {Text("Füge Daten hinzu, um sie anzuzeigen.")})
        }
    }

    private func addItem() {
        withAnimation {
            isShowingItemSheet.toggle()
            NewItemSheet()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    MainView()
}
