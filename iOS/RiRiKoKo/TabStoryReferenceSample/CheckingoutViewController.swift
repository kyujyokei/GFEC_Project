//
//  CheckingoutViewController.swift
//  fleaMarket
//
//  Created by Kero on 2016/11/18.
//  Copyright © 2016年 ColorKit. All rights reserved.
//

/*
 NOTE: The RiRiKoKo database wasn't completed to provide APIs for checking out.
 What is here is prototype UI of how the checkout process will go.
 
 
 */

import UIKit

class CheckingoutViewController: UITableViewController {
    
    var itemImageTemp:UIImage!
    var itemTitleTemp:String!
    var itemPriceTemp:Int!
    
    let uploadAlert = UIAlertView()

    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemTitle: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    
    @IBAction func buyButtonAction(sender: UIButton) {
        
        uploadAlert.title = "Processing..."
        uploadAlert.message = "Please wait"
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
        loadingIndicator.center = self.view.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating();
        uploadAlert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        uploadAlert.show()
        
        /*TODO: This part is for demonstration only and should be fixed when checkout API is released*/
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 4 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.uploadAlert.dismissWithClickedButtonIndex(-1, animated: true)
            self.performSegueWithIdentifier("show", sender: nil)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

        itemTitle.text = itemTitleTemp
        itemImage.image = itemImageTemp
        itemPrice.text = "NTD \(itemPriceTemp)"
        
        
        // Beggining of adding logo to Navigation Bar
        var titleView : UIImageView
        titleView = UIImageView(frame:CGRectMake(0, 0, 30, 45))
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "logo.png")
        self.navigationItem.titleView = titleView
        navigationController!.navigationBar.barTintColor = UIColorUtil.rgb(0xffffff);
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: nil)
        addButton.tintColor = UIColor.clearColor()
        navigationItem.rightBarButtonItem = addButton
        // End of adding logo to Navigation Bar
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let Destination : ChechoutStatusViewController = segue.destinationViewController as! ChechoutStatusViewController
        Destination.itemTitleTemp = itemTitleTemp
        Destination.itemImageTemp = itemImageTemp
        Destination.itemPriceTemp = itemPriceTemp
        
        
        
    
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
