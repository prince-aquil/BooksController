//
//  Book.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/5/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class Book {
  var title: String?
  var author: String?
  var pages: Int?
  var publisher: String?
  var iSBN: Int?
  
  init (title: String, author: String, pages: Int, publisher: String?, iSBN: Int) {
    self.title = title
    self.author = author
    self.pages = pages
    self.publisher = publisher
    self.iSBN = iSBN
  }
  
  func enshelf(shelf: Shelf) {
    shelf.booksOnShelf.append(self)
  }
  
  func unshelf(shelfToRemoveFrom: Shelf) {
    shelfToRemoveFrom.booksOnShelf = shelfToRemoveFrom.booksOnShelf.filter {$0 !== self}
    println(shelfToRemoveFrom.booksOnShelf)
  }
}

