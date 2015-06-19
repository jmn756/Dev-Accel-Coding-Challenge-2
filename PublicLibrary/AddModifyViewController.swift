//
//  AddModifyViewController.swift
//  PublicLibrary
//
//  Created by Joey Nessif on 6/17/15.
//  Copyright (c) 2015 Joey Nessif. All rights reserved.
//

import UIKit

protocol AddModifyViewControllerDelegate: class {
  func addModifyViewController(controller: AddModifyViewController, didFinishAddingBook book: Book)
  func addModifyViewController(controller: AddModifyViewController, didFinishModifyingBook book: Book)
}

class AddModifyViewController: UIViewController, UITextFieldDelegate {

  
  var book: Book!
  var newBook: Book!
  
  @IBOutlet weak var bookTitle: UITextField!
  @IBOutlet weak var bookAuthor: UITextField!
  
  weak var delegate: AddModifyViewControllerDelegate?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        self.bookTitle.delegate = self
        self.bookAuthor.delegate = self
        self.bookTitle.tag = 0
        self.bookAuthor.tag = 1

    
        if self.book != nil {
          self.bookTitle.text = book.title
          self.bookAuthor.text = book.author
        }
    }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    bookTitle.becomeFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      //set the first name
      self.book?.title =  textField.text
    } else {
      //set the last name
      self.book?.author = textField.text
    }
    if self.navigationItem.title == "Add Book" {
      if (bookTitle.text != "") {
        if (bookAuthor.text != "") {
            newBook = Book(title: bookTitle.text, author: bookAuthor.text)
            delegate?.addModifyViewController(self, didFinishAddingBook: newBook)
        }
      }
    }
  }

  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
