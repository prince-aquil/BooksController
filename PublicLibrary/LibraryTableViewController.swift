//
//  LibraryTableViewController.swift
//  PublicLibrary
//
//  Created by Alberto Vega Gonzalez on 7/5/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {
  
  var libraries = [Library]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLibrariesShelfsAndBooks()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return libraries.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("LibraryCell", forIndexPath: indexPath) as! UITableViewCell
    let libraryToDisplay = self.libraries[indexPath.row]
    let libraryNameTextLabel = cell.viewWithTag(1) as! UILabel
    libraryNameTextLabel.text = libraryToDisplay.libraryName
    return cell
  }
  
  func setupLibrariesShelfsAndBooks() {
    var KidsLibrary = Library(libraryName: "Kids Books")
    libraries.append(KidsLibrary)
    var Programming = Library(libraryName: "Programming Books")
    libraries.append(Programming)
    
    var toddlersShelf = Shelf(name: "Toddlers", library: KidsLibrary)
    var spanishKidsShelf = Shelf(name: "Spanish", library: KidsLibrary)
    var swiftShelf = Shelf(name: "Swift", library: Programming)
    var iOSShelf = Shelf(name: "iOS Programming", library: Programming)
    
    var iosApprentice = Book(title: "iOS Apprentice", author: "Ray Wenderlich", pages: 899, publisher: "Ray Wenderlich.com", iSBN: 132425267289)
    iosApprentice.enshelf(iOSShelf)
    var iOSProgramming = Book(title: "IOS Programming", author: "Keur, Christian", pages: 542, publisher: "Big Nerd Ranch", iSBN: 9780321942050)
    iOSProgramming.enshelf(iOSShelf)
    var iOSUICollectionViewTheCompleteGuide = Book(title: "IOS UICollection View", author: "Furrow, Ash", pages: 191, publisher: "Addison-Wesley", iSBN: 9780133762631)
    iOSUICollectionViewTheCompleteGuide.enshelf(iOSShelf)
    var passbookAppDevelopment = Book(title: "Instant Passbook App Dev", author: "Moon, Keith D", pages: 44, publisher: "Packt Pub", iSBN: 9781849697071)
    passbookAppDevelopment.enshelf(iOSShelf)
    var iOSCoreAnimation = Book(title: "IOS Core Animation", author: "Lockwood, Nick", pages: 356, publisher: "Addison-Wesley Professional", iSBN: 9780133440751)
    iOSCoreAnimation.enshelf(iOSShelf)
    var learningSwiftProgramming = Book(title: "Learning Swift Programming", author: "Schatz, Jacob", pages: 233, publisher: "Addison-Wesley", iSBN: 9780133950403)
    learningSwiftProgramming.enshelf(swiftShelf)
    var beginningSwiftProgramming = Book(title: "Beginning Swift Programming", author: "Lee, Wei-Meng", pages: 257, publisher: "Wrox, a Wiley Brand", iSBN: 9781119009313)
    beginningSwiftProgramming.enshelf(swiftShelf)
    var swiftForProgrammers = Book(title: "Swift for Programmers", author: "Deitel, Paul J", pages: 374, publisher: "Pearson Education", iSBN: 9780134021362)
    swiftForProgrammers.enshelf(swiftShelf)
    var barCodesWithIOS = Book(title: "Barcodes with IOS", author: "Drobnik, Oliver", pages: 227, publisher: "Manning", iSBN: 9781617292156)
    barCodesWithIOS.enshelf(iOSShelf)
    var whereIsTheGreenSheep = Book(title: "Where is the Green Sheep", author: "Judy Horacek", pages: 40, publisher: "Houghton Mifflin Harcourt", iSBN: 9780547396941)
    whereIsTheGreenSheep.enshelf(toddlersShelf)
    var iAmSoBrave = Book(title: "I am so Brave", author: "Krensky, Stephen", pages: 60, publisher: "Abrams Appleseed", iSBN: 9781419709371)
    iAmSoBrave.enshelf(toddlersShelf)
    var scaredySquirrel = Book(title: "Scaredy Squirrel", author: "Watt, Melanie", pages: 34, publisher: "Kids Can Press", iSBN: 1553379594)
    scaredySquirrel.enshelf(toddlersShelf)
    var theMostMagnificentThing = Book(title: "The Most Magnificent Thing", author: "Spires, Ashley", pages: 24, publisher: "Kids Can Press", iSBN: 9781554537044)
    theMostMagnificentThing.enshelf(toddlersShelf)
    var orangePearAppleBear = Book(title: "Orange Pear Apple Bear", author: "Gravett Emily", pages: 20, publisher: "Simon & Schuster Books", iSBN: 9781416939993)
    orangePearAppleBear.enshelf(toddlersShelf)
    var deColores = Book(title: "De Colores", author: "Diaz, David", pages: 25, publisher: "Marshall Cavendish", iSBN: 9780761454311)
    deColores.enshelf(spanishKidsShelf)
    var yoComo = Book(title: "Yo Como", author: "Graux, Amelie", pages: 20, publisher: "Éditions Milan", iSBN: 9788426139030)
    yoComo.enshelf(spanishKidsShelf)
    var laCamaGrandeDeSofia = Book(title: "La cama grande de Sofia", author: "Burke, Tina", pages: 18, publisher: "Kane/Miller Book Pub", iSBN: 9781933605784)
    laCamaGrandeDeSofia.enshelf(spanishKidsShelf)
  }
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the item to be re-orderable.
  return true
  }
  */
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowShelfsTableViewController" {
      if let ShelfsTableViewController = segue.destinationViewController as? ShelfsTableViewController {
        let myIndexPath = self.tableView.indexPathForSelectedRow()
        if let indexPath = self.tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedLibrary = self.libraries[selectedRow]
          println(selectedLibrary.libraryName)
          ShelfsTableViewController.selectedLibrary = selectedLibrary
        }
      }
    }
  }
}
