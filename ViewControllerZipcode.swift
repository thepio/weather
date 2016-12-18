//
//  ViewControllerZipcode.swift
//  weather
//
//  Created by mike on 12/11/16.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

class ViewControllerZipcode: UIViewController {

    @IBOutlet weak var vv_lableZipcode: UILabel!
    var cv_str: String = "";
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cf_zipcodecheck(_ sender: UIBarButtonItem) {
        
        if(sender.title == "Check"){
            let lv_url = URL(string: "http://ziptasticapi.com/48197")!
            let lv_data : Data = try! Data(contentsOf: lv_url)
            
            let lv_json = try! JSONSerialization.jsonObject(with: lv_data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
            //{"country":"US","state":"MI","city":"YPSILANTI"}
            
            
            let lv_state: String = lv_json["state"] as! String
            let lv_city = lv_json["city"] as! String
            
            cv_str = "Address ->  \(lv_city), \(lv_state)"
            vv_lableZipcode.text = cv_str
            vv_lableZipcode.sizeToFit()
        }
        
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
