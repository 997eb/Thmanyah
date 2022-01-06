//
//  menuViewController.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 18/05/1443 AH.
//

import UIKit

class menuContent {
    var menuSection :String?
    var menuItem: [String]?
    
    init(menuSection :String?, menuItem: [String]?) {
        self.menuSection = menuSection
        self.menuItem = menuItem
        
    }
    
    
}

class menuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var menuArr = [menuContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.tableFooterView = UIView()
       fillMenu()
    }
    
    func fillMenu(){
            menuArr.append(menuContent.init(menuSection:"عن الشركة", menuItem: [ " من نحن؟", "فريق العمل"]))
            menuArr.append(menuContent.init(menuSection:"الدستور", menuItem: [  "الهوية", "سياسة النشر", "القيم", "نواميس"]))
            menuArr.append(menuContent.init(menuSection:"تواصل معنا", menuItem: [ "ثمانية على مواقع التواصل", "اتصل بنا"]))
            menuArr.append(menuContent.init(menuSection:"المظهر", menuItem: ["الوضع الليلي"]))
    }
    


}


extension  menuViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuArr[section].menuItem?.count ?? 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! menuTableViewCell
        cell.meneItem.text = menuArr[indexPath.section].menuItem?[indexPath.row]
        cell.meneItem.font = UIFont(name: "IBMPlexSansArabic-Regular", size: 17)
       
        if (indexPath.section) == 3 {
            cell.more.isHidden = true
            cell.switch.isHidden = false
            cell.switch.tag = indexPath.row
            cell.switch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            
        }
                return cell
       
        }
    
    
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuArr[section].menuSection
  
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.right
        header.textLabel?.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 20)
      
}
    
    @objc func switchChanged(_ sender:UISwitch!){
    
        
        if sender.isOn == true
        {
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .dark
            
        }
        else
        {
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .light
        }
     }
    
}
    
