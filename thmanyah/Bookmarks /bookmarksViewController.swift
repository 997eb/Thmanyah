//
//  bookmarksViewController.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 18/05/1443 AH.
//

import UIKit

struct Articals {
    let sectionMame :String?
    let mainArtical : [mainArtical]?
    let listArtials : [listArtials]?
    

    init(sectionMame:String? , mainArtical:[mainArtical] , listArtials : [listArtials])   {
        self.sectionMame = sectionMame
        self.mainArtical = mainArtical
        self.listArtials = listArtials
    }
}

struct mainArtical {
    var mainArticalName: String?
    var mainArticalPublishDate: String?
    var mainArticalAuthor: String?
    var mainArticalImage: String?
    
    init( mainArticalName: String?,mainArticalPublishDate: String? , mainArticalAuthor: String?, mainArticalImage: String?)   {
        self.mainArticalName = mainArticalName
        self.mainArticalPublishDate = mainArticalPublishDate
        self.mainArticalAuthor = mainArticalAuthor
        self.mainArticalImage = mainArticalImage

    }
}

struct listArtials {
    var listArticalImage: String?
    var listread: String?
    var listArticalName: String?
    var listAuthorName: String?
    
    init( listAuthorName: String?,listArticalName: String? , listread: String?, listArticalImage: String?)   {
        self.listAuthorName = listAuthorName
        self.listArticalName = listArticalName
        self.listread = listread
        self.listArticalImage = listArticalImage

    }
}


class bookmarksViewController: UIViewController {

    @IBOutlet weak var artcalsTableView: UITableView!
    
    var articalsArr = [Articals]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artcalsTableView.delegate = self
        artcalsTableView.dataSource = self
        
        artcalsTableView.register(articalListTableViewCell.nib(), forCellReuseIdentifier: articalListTableViewCell.identifier)
        
        artcalsTableView.register(articalMainTableViewCell.nib(), forCellReuseIdentifier: articalMainTableViewCell.identifier)

        fillArticals()
   

    }

    func fillArticals(){
        
        self.articalsArr.append(Articals.init(sectionMame: "الرأي", mainArtical: [mainArtical.init(mainArticalName: "كيف يتصالح الجمهور مع تشفير الدوري السعودي؟", mainArticalPublishDate: "26 ديسمبر", mainArticalAuthor: "محمود عصام", mainArticalImage: "cate1_1.jpg")], listArtials: [listArtials.init(listAuthorName: "ثمود بن محفوظ", listArticalName: "لاتسلبوني مشترياتي الرقمية" , listread: "٣ دقائق قراءة", listArticalImage:  "cate1_2.jpg"),listArtials.init(listAuthorName: "أشرف فقية", listArticalName: "مستقبل الجنس البشري", listread: "٥ دقائق قراءة", listArticalImage:  "cate1_3.jpg")]))
        
        self.articalsArr.append(Articals.init(sectionMame: "الرأسمالية", mainArtical: [mainArtical.init(mainArticalName: "انفصال المطرب العربي عن جماهيرة", mainArticalPublishDate: "16 ديسمبر", mainArticalAuthor:"مصطفى علي", mainArticalImage: "cate3_1.jpg")], listArtials: [listArtials.init(listAuthorName:"محمود عصام" , listArticalName: "من يقتل لآعبي كرة القدم", listread: "٣ دقائق قراءة", listArticalImage: "cate3_2.jpg"),listArtials.init(listAuthorName:"سعيد عبدالجبار", listArticalName: "متى تبيع أسهمك؟", listread:"٤ دقائق قراءة ", listArticalImage: "cate3_3.jpg")]))
        
        self.articalsArr.append(Articals.init(sectionMame: "المستقبل", mainArtical: [mainArtical.init(mainArticalName: "في انتظار الباص", mainArticalPublishDate: "16 اغسطس", mainArticalAuthor: "رويحة عبدالرب", mainArticalImage: "cate2_2.jpg")], listArtials: [listArtials.init(listAuthorName: "جنان الهاملي", listArticalName: "علمني لغة في ثلاثين يومًا", listread: "٣ دقائق قراءة", listArticalImage:  "cate2_1.jpg"),listArtials.init(listAuthorName: "ثمود بن محفوظ", listArticalName: "كيف تنحاز الاحصائيات", listread: "٥ دقائق قراءة", listArticalImage:  "cate2_3.jpg")]))
        
    }
}



extension  bookmarksViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return ((articalsArr[section].listArtials!.count) + (articalsArr[section].mainArtical!.count))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == artcalsTableView{
            return nil
        }
        else
        {
            return nil
        }
     }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == artcalsTableView {
            return articalsArr.count
        }
        else
        {
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            if indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "articalMainTableViewCell", for: indexPath as IndexPath) as! articalMainTableViewCell
                cell.configureMain(with: (articalsArr[indexPath.section].mainArtical?[indexPath.row])!)
                return cell
            }
            
            else
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: "articalListTableViewCell", for: indexPath as IndexPath) as! articalListTableViewCell
                cell.configureList(with: (articalsArr[indexPath.section].listArtials?[indexPath.row - 1])!)
            return cell
        }
        }
}


