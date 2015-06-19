//
//  BooksTableViewController.swift
//  PublicLibrary
//
//  Created by Joey Nessif on 6/15/15.
//  Copyright (c) 2015 Joey Nessif. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController, AddModifyViewControllerDelegate, UINavigationControllerDelegate {

  
  var shelf : Shelf!
  
  func addModifyViewController(controller: AddModifyViewController, didFinishAddingBook book: Book){
    let newBookIndex = shelf.booksOnShelf.count
    shelf.booksOnShelf.append(book)
    let indexPath = NSIndexPath(forRow: newBookIndex, inSection: 0)
    let indexPaths = [indexPath]
    tableView.insertRowsAtIndexPaths(indexPaths,withRowAnimation: .Automatic)
  }
  
  func addModifyViewController(controller: AddModifyViewController, didFinishModifyingBook book: Book){
    dismissViewControllerAnimated(true, completion: nil)
  }

  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return shelf.booksOnShelf.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Books", forIndexPath: indexPath) as! UITableViewCell

      let fullBook = shelf.booksOnShelf[indexPath.row].title + " by " + shelf.booksOnShelf[indexPath.row].author
      cell.textLabel?.text = fullBook

        return cell
    }
  

   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
          forRowAtIndexPath indexPath: NSIndexPath) {
        shelf.booksOnShelf.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  */
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "ModifyBook" {
        var modifyViewController = segue.destinationViewController as! AddModifyViewController
        var selectedIndexPath = self.tableView.indexPathForSelectedRow()
        var selectedBook = self.shelf.booksOnShelf[selectedIndexPath!.row]
        modifyViewController.book = selectedBook
        modifyViewController.navigationItem.title = "Modify Book"
        modifyViewController.delegate = self
      } else {
          var addViewController = segue.destinationViewController as! AddModifyViewController
          addViewController.navigationItem.title = "Add Book"
          addViewController.delegate = self
      }
  }

}
