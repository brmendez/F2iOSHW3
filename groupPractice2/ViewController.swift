//
//  ViewController.swift
//  groupPractice2
//
//  Created by Brian Mendez on 8/17/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var teacherArray = [Person]()
    var personArray = [Person]()
    var allArrays = [[Person]]()
    var preProfile : Person!
    
    var brad = Person(fName: "Brad", lName: "Johnson")
    var john = Person(fName: "John", lName: "Clem")
    
    var kori = Person(fName: "Kori", lName: "Kolo")
    var brian = Person(fName: "Brian", lName: "Mendez")
    
    var sectionsArray = ["Students", "Teachers"]
//    var numberOfSectionCounter = 0
    
    
    
//MARK: ViewDidLoad - Append
    override func viewDidLoad() {
        super.viewDidLoad()

        personArray = [kori, brian]
        teacherArray = [brad, john]
        allArrays = [personArray, teacherArray]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        println("number of sections in tableview")
        return self.allArrays.count
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
//        println(self.numberOfSectionCounter++)
        return allArrays[section].count
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        return sectionsArray[section]
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.imageView.image = allArrays[indexPath.section][indexPath.row].image
        cell.textLabel.text = allArrays[indexPath.section][indexPath.row].fullName()
        self.preProfile = allArrays[indexPath.section][indexPath.row]
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: DidReceiveMemory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let indexPath = self.tableView.indexPathForSelectedRow()
        if segue.identifier == "showDetail" {
        let destination = segue.destinationViewController as DetailViewController
        destination.personSegue = allArrays[indexPath.section][indexPath.row]
        }
    }
    
//    sectionIndexTitlesForTableView(<#tableView: UITableView!#>)
    
}

