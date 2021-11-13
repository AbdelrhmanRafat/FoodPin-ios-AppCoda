//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by Macbook on 04/12/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import SafariServices
class AboutTableViewController: UITableViewController {
    var sectionTitles = [NSLocalizedString("Feedback", comment: "Feedback"), NSLocalizedString("Follow Us", comment: "Follow Us")]
    var sectionContent = [[(image: "store", text: NSLocalizedString("Rate us on App Store", comment: "Rate us on App Store"), link: "https://www.apple.com/ios/app-store/"),
                           (image: "chat", text: NSLocalizedString("Tell us your feedback", comment: "Tell us your feedback"), link: "http://www.appcoda.com/contact/")],
                          [(image: "twitter", text: NSLocalizedString("Twitter", comment: "Twitter"), link: "https://twitter.com/appcodamobile"),
                           (image: "facebook", text: NSLocalizedString("Facebook", comment: "Facebook"), link: "https://facebook.com/appcodamobile"),
                           (image: "instagram", text: NSLocalizedString("Instagram", comment: "Instagram"), link: "https://www.instagram.com/appcodadotcom")]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage() , for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60), NSAttributedString.Key.font: customFont]
        }
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = sectionContent[indexPath.section][indexPath.row].link
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: link){
                    UIApplication.shared.open(url)
                }
            }
            else if indexPath.row == 1{
                performSegue(withIdentifier: "ShowWebView", sender: self)
            }
        case 1:
            if let url = URL(string: link){
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated: true, completion: nil)
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowWebView"{
            if let destinationController = segue.destination as? WebViewController , let indexpath = tableView.indexPathForSelectedRow{
                destinationController.targetUrl = sectionContent[indexpath.section][indexpath.row].link
                
            }
            
        }}
    
}
