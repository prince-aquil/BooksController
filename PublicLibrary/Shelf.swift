//
//  Shelf.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/5/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class Shelf {
  let name: String!
  var library: Library
  var numberOfBooksOnShelf: Int!
  var booksOnShelf: [Book] = []
  
  init (name: String, library: Library) {
    self.name = name
    self.library = library
    library.shelfsInLibrary.append(self)
  }
  
  func calculateNumberOfBooksInShelf() {
    numberOfBooksOnShelf = booksOnShelf.count
  }
  
  func addToLibrary(library: Library  ) {
    library.shelfsInLibrary.append(self)
  }
  
  func removeFromLibrary(shelfToRemoveFrom: Shelf) {
    shelfToRemoveFrom.booksOnShelf = shelfToRemoveFrom.booksOnShelf.filter {$0 !== self}
    println(shelfToRemoveFrom.booksOnShelf)
  }
}
