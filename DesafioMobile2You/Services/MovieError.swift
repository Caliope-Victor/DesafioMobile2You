//
//  MovieError.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation

internal enum MovieError: LocalizedError {
    case dataIsEmpty
    case errorNotNil
    case dataNotLoaded
    
    var errorDescription: String? {
        switch self {
        case .dataIsEmpty:
            return "No data was returned from the url"
        case .errorNotNil:
            return "Some error was found when try to get the data from the url"
        case .dataNotLoaded:
            return "Parse has fail"
        }
    }
}
