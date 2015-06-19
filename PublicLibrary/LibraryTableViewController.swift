//
//  ViewController.swift
//  PublicLibrary
//
//  Created by Joey Nessif on 6/10/15.
//  Copyright (c) 2015 Joey Nessif. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {

  
  var pubLibs = [Library]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //First Public Library with shelves and books
    let pubLib1 = Library(name: "Seattle Public Library - Downtown")
    pubLibs.append(pubLib1)
    
    pubLib1.addABookTitle("A Moveable Feast", author: "Ernest Hemingway")
    pubLib1.addABookTitle("A Tale of Two Cities", author: "Charles Dickens")
    pubLib1.addABookTitle("The Fountainhead", author: "Ayn Rand")
    pubLib1.addABookTitle("Bleak House", author: "Charles Dickens")
    pubLib1.addABookTitle("Ivanhoe", author: "Sir Walter Scott")
    pubLib1.addABookTitle("1984", author: "George Orwell")
    pubLib1.addABookTitle("HTML & CSS", author: "Jon Duckett")
    pubLib1.addABookTitle("Scientific Christian Mental Practice", author: "Emma Curtis Hopkins")
    
    loadBooks(pubLib1)
    pubLib1.reportAllBooksInLibrary()
    
    //Second Public Library with shelves and books
    var pubLib2 = Library(name: "New York - Manhatten Branch")
    pubLibs.append(pubLib2)
  
    pubLib2.addABookTitle("A Moveable Feast", author: "Ernest Hemingway")
    pubLib2.addABookTitle("A Tale of Two Cities", author: "Charles Dickens")
    pubLib2.addABookTitle("The Fountainhead", author: "Ayn Rand")
    pubLib2.addABookTitle("Bleak House", author: "Charles Dickens")
    pubLib2.addABookTitle("Ivanhoe", author: "Sir Walter Scott")
    pubLib2.addABookTitle("1984", author: "George Orwell")
    pubLib2.addABookTitle("HTML & CSS", author: "Jon Duckett")
    pubLib2.addABookTitle("Scientific Christian Mental Practice", author: "Emma Curtis Hopkins")
    
    loadBooks(pubLib2)
  
    //Third Public Library with shelves and books
    var pubLib3 = Library(name: "Carnegie Mellon - Main Branch")
    pubLibs.append(pubLib3)
    
    pubLib3.addABookTitle("A Moveable Feast", author: "Ernest Hemingway")
    pubLib3.addABookTitle("A Tale of Two Cities", author: "Charles Dickens")
    pubLib3.addABookTitle("The Fountainhead", author: "Ayn Rand")
    pubLib3.addABookTitle("Bleak House", author: "Charles Dickens")
    pubLib3.addABookTitle("Ivanhoe", author: "Sir Walter Scott")
    pubLib3.addABookTitle("1984", author: "George Orwell")
    pubLib3.addABookTitle("HTML & CSS", author: "Jon Duckett")
    pubLib3.addABookTitle("Scientific Christian Mental Practice", author: "Emma Curtis Hopkins")
    
    loadBooks(pubLib3)

  }

  func loadBooks(library: Library) {
    let shelfCount = library.shelves.count
    var bookCount = library.unshelvedBooks.count
    while bookCount > 0 {
      for (var i = 0; i < shelfCount && bookCount != 0; i++){
        library.unshelvedBooks[bookCount - 1].enshelf(library.shelves[i])
        library.unshelvedBooks.removeAtIndex(bookCount - 1)
        bookCount = library.unshelvedBooks.count
      }
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pubLibs.count
  }
  
  override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PubLibrary", forIndexPath: indexPath) as! UITableViewCell
    
    cell.textLabel?.text = pubLibs[indexPath.row].name
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "ShowShelves" {
        var shelfTableViewController = segue.destinationViewController as! ShelfTableViewController
        var selectedIndexPath = self.tableView.indexPathForSelectedRow()
        var selectedLibrary = self.pubLibs[selectedIndexPath!.row]
        shelfTableViewController.library = selectedLibrary
      }
  }
  

}
