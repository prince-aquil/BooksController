//
//  BooksTableViewController.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/6/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
  
  @IBOutlet var booksTableView: UITableView!
  
  var selectedShelf: Shelf!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedShelf.booksOnShelf.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("BooksCell", forIndexPath: indexPath) as! UITableViewCell
    let bookToDisplay = self.selectedShelf.booksOnShelf[indexPath.row]
    let bookNameTextLabel = cell.viewWithTag(3) as! UILabel
    bookNameTextLabel.text = bookToDisplay.title
    return cell
  }
  
  override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    self.editButtonItem().enabled = true
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      self.selectedShelf.booksOnShelf.removeAtIndex(indexPath.row)
      self.booksTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    } else {
      self.navigationController?.inputViewController?.inputAccessoryView
    }
  }
  
  func addBookItem(sender:UIBarButtonItem) {
    let alert: UIAlertController = UIAlertController(title: "Books", message: "Add a new Book to this shelf", preferredStyle: UIAlertControllerStyle.Alert)
    let saveAction: UIAlertAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
      let textField: UITextField = alert.textFields![0] as! UITextField
      self.saveNewBookTitle(name: textField.text)
      self.booksTableView.reloadData()
    }
    
    let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
      self.editButtonItem().enabled = true
    }
    
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in}
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    presentViewController(alert, animated: true, completion: nil)
  }
  
  func saveNewBookTitle(name newName: String) {
    let name = Book(title: newName, author: "", pages: 0, publisher: " ", iSBN: 0)
    self.selectedShelf.booksOnShelf.append(name)
  }
  
  override func setEditing(editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    self.booksTableView.setEditing(editing, animated: animated)
    if editing {
      self.editButtonItem().enabled = false
      self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addBookItem:"), animated: true)
    } else {
      self.editButtonItem().enabled = true
      self.navigationItem.leftBarButtonItem = nil
    }
  }
  // MARK: - Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowBooksDetailViewController" {
      if let DetailViewController = segue.destinationViewController as? DetailViewController {
        let myIndexPath = self.tableView.indexPathForSelectedRow()
        if let indexPath = self.tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedBook = self.selectedShelf.booksOnShelf[selectedRow]
          DetailViewController.selectedBook = selectedBook
        }
      }
    }
  }
}



