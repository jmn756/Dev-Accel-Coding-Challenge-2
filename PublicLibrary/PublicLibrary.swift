//
//  PublicLibrary.swift
//  PublicLibrary
//
//  Created by Joey Nessif on 6/14/15.
//  Copyright (c) 2015 Joey Nessif. All rights reserved.
//

import Foundation

class Library {
  var name = ""
  var shelves = [Shelf]()
  var unshelvedBooks = [Book]()
  
  init (name: String){
    self.name = name
    
    //Install 5 shelves when Library object is created. The shelf at index:0 will be used to house books when they are first acquired.
    for (var i = 0; i < 5; i++){
      self.installAShelf(i)
    }
  }
  
  func installAShelf(shelfID: Int) {
    let shelf = Shelf(shelfID: shelfID)
    shelves.append(shelf)
  }
  
  //Newly acquired books are always placed in the unshelvedBooks array
  func addABookTitle(title: String, author: String){
    let book = Book(title: title, author: author)
    unshelvedBooks.append(book)
  }
  
  func takeBookOffShelf(book: Book, shelf: Shelf){
      book.unshelf(shelf)
      unshelvedBooks.append(book)
  }
  
  
  func reportAllBooksInLibrary() {
    println(self.name + " has " + String(self.unshelvedBooks.count) + " unshelved books at its location.")
    println(self.name + " has the following books on its shelves:")
    
    let shelfCount = self.shelves.count
    var bookCount = 0
    for (var i = 0; i < shelfCount; i++){
      println("\n")
      println("Shelf Location: " + String(self.shelves[i].shelfID + 1))
      bookCount = self.shelves[i].booksOnShelf.count
      for (var j = 0; j < bookCount; j++){
        println("     Title: " + self.shelves[i].booksOnShelf[j].title)
        println("     Author: " + self.shelves[i].booksOnShelf[j].author)
        println("\n")
      }
    }
  }
}


//Shelf class
class Shelf {
  
  var shelfID = 0
  var booksOnShelf = [Book]()
  
  init (shelfID: Int) {
    self.shelfID = shelfID
  }
  
}

//Book class
class Book {
  
  var title = ""
  var author = ""
  
  init (title: String, author: String) {
    self.title = title
    self.author = author
  }
  
  func enshelf(shelf: Shelf) {
    shelf.booksOnShelf.append(self)
  }
  
  func unshelf(shelf: Shelf) {
    for (var i = 0; i < shelf.booksOnShelf.count; i++) {
      if (shelf.booksOnShelf[i].title == self.title) && (shelf.booksOnShelf[i].author == self.author) {
        shelf.booksOnShelf.removeAtIndex(i)
      }
    }
  }
}


  
