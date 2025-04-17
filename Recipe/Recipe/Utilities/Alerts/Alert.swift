//
//  Alert.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/13/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: Text(Constants.errorTitle.stringValue),
                                            message: Text(Constants.invalidDataText.stringValue),
                                            dismissButton: .default(Text(Constants.errorDismissButton.stringValue)))
    
    static let invalidResponse  = AlertItem(title: Text(Constants.errorTitle.stringValue),
                                            message: Text(Constants.invalidResponseText.stringValue),
                                            dismissButton: .default(Text(Constants.errorDismissButton.stringValue)))
    
    static let invalidURL       = AlertItem(title: Text(Constants.errorTitle.stringValue),
                                            message: Text(Constants.invalidURLText.stringValue),
                                            dismissButton: .default(Text(Constants.errorDismissButton.stringValue)))
    
    static let unableToComplete = AlertItem(title: Text(Constants.errorTitle.stringValue),
                                            message: Text(Constants.unableToCompleteText.stringValue),
                                            dismissButton: .default(Text(Constants.errorDismissButton.stringValue)))
    
    static let emptyData = AlertItem(title: Text(Constants.errorTitle.stringValue),
                                     message: Text(Constants.emptyDataText.stringValue),
                                            dismissButton: .default(Text(Constants.errorDismissButton.stringValue)))
}
