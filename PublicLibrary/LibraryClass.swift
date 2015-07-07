//
//  LibraryClass.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/2/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class Library {
  let libraryName:String!
  var numberOfShelfs:Int!
  var shelfsInLibrary: [Shelf] = []
  var booksInLibrary: [Book] = []
  
  init (libraryName: String) {
    self.libraryName = libraryName
  }
  
  func calculateNumberOfShelfs() {
    numberOfShelfs = shelfsInLibrary.count
  }
  
  func calculateBooksInLibrary() -> [Book] {
    var AllBooksInLibrary:[Book] = []
    for shelf in shelfsInLibrary {
      AllBooksInLibrary += shelf.booksOnShelf
    }
    return AllBooksInLibrary
  }
}


