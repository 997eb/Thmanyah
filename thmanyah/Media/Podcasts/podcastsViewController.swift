//
//  podcastsViewController.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 20/05/1443 AH.
//

import UIKit

struct Models {
    let podcastName:String?
    let podcastInfo : [PodcastInfo]?

    init(podcastName:String? , podcastInfo:[PodcastInfo])  {
        self.podcastName = podcastName
        self.podcastInfo = podcastInfo

    }
}

struct PodcastInfo {
    let podcastImage:String?
    let podcastEpsiodeTitle : String?
    let podcastPeriod:String?

    
    init(podcastImage:String? , podcastEpsiodeTitle:String?, podcastPeriod:String?)  {
        self.podcastImage = podcastImage
        self.podcastEpsiodeTitle = podcastEpsiodeTitle
        self.podcastPeriod = podcastPeriod
        

    }
}

class podcastsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    @IBOutlet weak var podcastTableView: UITableView!
    var models = [Models]()
    
    var banners = ["ashyaa-banner.jpg","aswat-banner.jpg" , "fnjan-banner.jpg" , "bokrah-banner" , "swalif-business-banner.jpg" , "tojjar-banner"]
    var timer : Timer?
    var currentCellIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        startTimer()
        pagecontroller.numberOfPages = banners.count
        
        podcastTableView.register(podcastRowsCell.nib(), forCellReuseIdentifier: podcastRowsCell.identifier)
        podcastTableView.delegate = self
        podcastTableView.dataSource = self
        fillPodcastInfo()

      
    }
    
    func fillPodcastInfo(){
        
        models.append(Models.init(podcastName: "بودكاست فنجان",
                                  podcastInfo:
                                    [PodcastInfo.init(podcastImage: "ep1.jpg", podcastEpsiodeTitle: "العرب أول من عرف القهوة",  podcastPeriod: "ساعه و 15 دقيقة"),
                                     PodcastInfo.init(podcastImage: "ep2.jpg", podcastEpsiodeTitle: "كيف سيغيّر ويب 3.0 وجه العالم" , podcastPeriod: "19 دقيقة"),
                                     PodcastInfo.init(podcastImage: "ep3.jpg", podcastEpsiodeTitle: "كيف تفشل؟", podcastPeriod: "15 دقيقة" ),
                                     PodcastInfo.init(podcastImage: "ep4.jpg", podcastEpsiodeTitle: "التوتر السعودي الايراني مع عبدالعزيز بن صقر", podcastPeriod: "40 دقيقة" )
                                    ]))
        
        models.append(Models.init(podcastName:"سوالف بزنس",
                                  podcastInfo:
                                    [PodcastInfo.init(podcastImage: "pep1.jpg", podcastEpsiodeTitle: "تطبيق الاستشارات القانونية - إياس",  podcastPeriod: "ساعه و 15 دقيقة"),
                                     PodcastInfo.init(podcastImage: "pep2.jpg", podcastEpsiodeTitle: "سالفة بزنس التدريب" , podcastPeriod: "19 دقيقة"),
                                     PodcastInfo.init(podcastImage: "pep3.jpg", podcastEpsiodeTitle: "سالفة منصة الاستشارات الطبية", podcastPeriod: "15 دقيقة" ),
                                     PodcastInfo.init(podcastImage: "pep4.jpg", podcastEpsiodeTitle:"سالفة بزنس الدعاية والاعلان - حبار", podcastPeriod: "40 دقيقة" )
                                    ]))
        
        models.append(Models.init(podcastName:"أشياء غيرتنا",
                                  podcastInfo:
                                    [PodcastInfo.init(podcastImage: "pep5.jpg", podcastEpsiodeTitle: "قصة التفحيط",  podcastPeriod: "ساعه و 15 دقيقة"),
                                     PodcastInfo.init(podcastImage: "pep6.jpg", podcastEpsiodeTitle: "الغترة والشماغ" , podcastPeriod: "19 دقيقة"),
                                     PodcastInfo.init(podcastImage: "pep7.jpg", podcastEpsiodeTitle: "قصة المسرح في السعودية", podcastPeriod: "15 دقيقة" ),
                                     PodcastInfo.init(podcastImage: "pep8.jpg", podcastEpsiodeTitle:"العمال الكوريين", podcastPeriod: "40 دقيقة" )
                                    ]))
        
        models.append(Models.init(podcastName:"بودكاست المحور الثاني",
                                  podcastInfo:
                                    [PodcastInfo.init(podcastImage: "pep9.jpg", podcastEpsiodeTitle: "أركان التجارة الإلكترونية",  podcastPeriod: "ساعه و 15 دقيقة"),
                                     PodcastInfo.init(podcastImage: "pep10.jpg", podcastEpsiodeTitle: "أزمة توصيل الشحنات في السعودية" , podcastPeriod: "19 دقيقة"),
                                     PodcastInfo.init(podcastImage: "pep11.jpg", podcastEpsiodeTitle: "هل تصبح التمور الصادر السعودي الأهم", podcastPeriod: "15 دقيقة" ),
                                     PodcastInfo.init(podcastImage: "pep12.jpg", podcastEpsiodeTitle:"عن مفهوم خدمة العملاء في الجهات الحكومية", podcastPeriod: "40 دقيقة" )
                                    ]))
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex(){
        
        if (currentCellIndex < banners.count - 1) {
            currentCellIndex += 1
        }else {
             currentCellIndex = 0

        }
        
        self.collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pagecontroller.currentPage = currentCellIndex
        
    
        
    }
    
    func moveToPlayingPodcast(tindex:Int , cIndex:Int){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "playingPodcast", bundle: nil)
        guard let playPodcast = storyBoard.instantiateViewController(identifier: "playingPodcastViewController") as? playingPodcastViewController
        else {
            return
        }
        playPodcast.podcasrEposideName = models[tindex].podcastInfo![cIndex].podcastEpsiodeTitle
        playPodcast.podcastProgram = models[tindex].podcastName
        playPodcast.podcasTCoverS = models[tindex].podcastInfo![cIndex].podcastImage
        
        navigationController?.present(playPodcast, animated: true, completion: nil)
        
    }
    
}


extension podcastsViewController: UITableViewDelegate , UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return models[section].podcastName
   
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: podcastRowsCell.identifier, for: indexPath as IndexPath) as! podcastRowsCell
        
        cell.configure(with: models[indexPath.section].podcastInfo! , tableIndex: indexPath.section)
        
        cell.disSelectPodcast = { tableIndex, collectionIndex in
       if let tableIndexe = tableIndex, let collectionIndexe = collectionIndex {
                self.moveToPlayingPodcast(tindex:tableIndexe , cIndex:collectionIndexe)
                    }
        }

        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270.0
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.right
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemBackground
        header.textLabel?.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 20)

}
    


    
    
}

    extension podcastsViewController: UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return banners.count
        }
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! podcastSlideShowCell
        cell.podcastImage.image = UIImage(named:banners[indexPath.row])
        
        return cell

      
            }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
  
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
