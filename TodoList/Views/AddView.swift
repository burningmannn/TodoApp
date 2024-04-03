//
//  AddView.swift
//  TodoList
//
//  Created by Daniil Shutkin on 31.03.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var someColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    let textFieldColor = Color("TextFieldColor")
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(textFieldColor)
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add in Item ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [secondaryAccentColor, .white, .accentColor]).opacity(0.6))
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        let obsceneWords = ["badword", "wordbad", "Badword", "Wordbad"]
        let wordsInText = textFieldText.components(separatedBy: "Error")
        
        if textFieldText.count < 6 {
            alertTitle = "Your new todo item must be at least 6 characters long 😪"
            showAlert.toggle()
            return false
        }
        
        for word in wordsInText {
            if obsceneWords.contains(where: { $0.caseInsensitiveCompare(word) == .orderedSame }) {
                alertTitle = "You can't use obscene words 🥶"
                showAlert.toggle()
                return false
            }
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
