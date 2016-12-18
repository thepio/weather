//
//  MyTableViewController.swift
//  weather
//
//  Created by mike on 12/11/16.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var cv_arrayCityList: [String] = ["Home","Find People"]
    var cv_StateNmae : [String] = ["MI","XX"]
    var cv_arrayZipCode: [String] = ["48327","48111"]
    let db = SQLiteDB.sharedInstance
    var cv_arrayTemp: [Double] = [98.2,99.9]
    var cv_str: String = ""
    override func viewDidLoad() {
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       super.viewDidLoad()
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cv_arrayCityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "MyCustomCell")! as! MyTableViewCell
        // Configure the cell...
        
        DispatchQueue.global(qos: .background).async {
            let lv_url = URL(string: "http://ziptasticapi.com/" + self.cv_arrayZipCode[(indexPath).row])!
            let lv_data : Data = try! Data(contentsOf: lv_url)
            
            let lv_json = try! JSONSerialization.jsonObject(with: lv_data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
            //{"country":"US","state":"MI","city":"YPSILANTI"}
            
            let lv_state: String = lv_json["state"] as! String
            let lv_city = lv_json["city"] as! String
            
            let lv_Nurl = URL(string:  "http://api.openweathermap.org/data/2.5/weather?zip=" + self.cv_arrayZipCode[(indexPath).row] + ",us&APPID=20b5ea28bf05afc3a3f20b7b99946930")!
            let lv_Ndata = try! Data(contentsOf: lv_Nurl)
            
            let lv_Newjson = try! JSONSerialization.jsonObject(with: lv_Ndata, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
            let nestedDictionary = lv_Newjson["weather"] as? [String: Any]
            
            
            
            
            
            
            
            
            
            
            DispatchQueue.main.async {
                
                cell.cv_lbCityname.text = lv_city + " " + lv_state
//                cell.vv_zipCode.text = try! String(NSInteger :nestedDictionary?.count)
                cell.Temp.text = self.cv_arrayTemp[indexPath.row].description
                cell.cv_lbCityname.sizeToFit()
                cell.vv_zipCode.sizeToFit()
                cell.Temp.sizeToFit()

                
                
                
            }
        }
        
        
        return cell
       
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
