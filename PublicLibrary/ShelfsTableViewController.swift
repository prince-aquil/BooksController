//
//  ShelfsTableViewController.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/5/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ShelfsTableViewController: UITableViewController {
  
  @IBOutlet var shelfTableView: UITableView!
  
  var selectedLibrary: Library!
  
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
    return selectedLibrary.shelfsInLibrary.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ShelfCell", forIndexPath: indexPath) as! UITableViewCell
    let shelfToDisplay = self.selectedLibrary.shelfsInLibrary[indexPath.row]
    let shelfNameTextLabel = cell.viewWithTag(2) as! UILabel
    shelfNameTextLabel.text = shelfToDisplay.name
    return cell
  }
  
  override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    if indexPath.row == self.selectedLibrary.shelfsInLibrary.count {
      return UITableViewCellEditingStyle.Insert
    } else {
      return UITableViewCellEditingStyle.Delete
    }
  }
  
  override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    self.editButtonItem().enabled = true
  }
  
  func addShelfItem(sender:UIBarButtonItem) {
    let alert: UIAlertController = UIAlertController(title: "Shelf", message: "Add a new shelf to this library", preferredStyle: UIAlertControllerStyle.Alert)
    let saveAction: UIAlertAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) {(action: UIAlertAction!) -> Void in
      let textfield: UITextField = alert.textFields![0] as! UITextField
      self.saveNewShelfName(name: textfield.text)
      self.shelfTableView.reloadData()
    }
    
    let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
      self.editButtonItem().enabled = true
    }
    
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in }
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    presentViewController(alert, animated: true, completion: nil)
  }
  
  func saveNewShelfName(name newName: String) {
    let name = Shelf(name: newName, library: selectedLibrary)
  }
  
  override func setEditing(editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    self.shelfTableView.setEditing(editing, animated: animated)
    if editing {
      self.editButtonItem().enabled = false
      self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addShelfItem:"), animated: true)
    } else {
      self.editButtonItem().enabled = true
      self.navigationItem.leftBarButtonItem = nil
    }
  }
  // MARK: - Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier ==  "ShowBooksTableViewController" {
      if let BooksTableViewController = segue.destinationViewController as?
        BooksTableViewController {
          let myIndexPath = self.tableView.indexPathForSelectedRow()
          if let indexPath = self.tableView.indexPathForSelectedRow() {
            let selectedRow = indexPath.row
            let selectedShelf = self.selectedLibrary.shelfsInLibrary[selectedRow]
            BooksTableViewController.selectedShelf = selectedShelf
          }
      }
    }
  }
}
