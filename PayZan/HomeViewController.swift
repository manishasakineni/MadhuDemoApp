//
//  HomeViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

 //MARK:- For images

var imageArray = [UIImage(named:"mobileImg"),UIImage(named:"landlineImg"),UIImage(named:"dth"),UIImage(named:"broadband"),UIImage(named:"cabletv"),UIImage(named:"electricityImg"),UIImage(named:"waterImg"),UIImage(named:"datacard")]

var imageArray1 = [UIImage(named:"mobileImg"),UIImage(named:"landlineImg"),UIImage(named:"dth"),UIImage(named:"broadband"),UIImage(named:"cabletv"),UIImage(named:"electricityImg"),UIImage(named:"waterImg"),UIImage(named:"datacard")]

var imageArray2 = [UIImage(named:"mobile"),UIImage(named:"landline"),UIImage(named:"electricity"),UIImage(named:"event"),UIImage(named:"sport"),UIImage(named:"television"),UIImage(named:"water-tap"),UIImage(named:"internet")]


//  //MARK:- for label names


var namesarra1 = [String]()

var namesarra2 = ["Water","Landline","Electricity","Events","Sports","DTH","Mobile","Internet"]

var namesarra3 = ["Mobile","Landline","Electricity","Events","Sports","DTH","Water","Internet"]

  //MARK:-  for heading names

var namesarra4 = [String]()

class HomeViewController: UIViewController,UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource,SWRevealViewControllerDelegate,UIScrollViewDelegate,UITabBarDelegate {
    
    
     //MARK:-  OutLets
    
    @IBOutlet weak var sideMenuBtn: UIButton!
    
    @IBOutlet weak var menuBtnItem: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var walletLabel: UILabel!
    
//    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var paySendImg: UIImageView!
    
    @IBOutlet weak var addWithdrawImg: UIImageView!
    
    @IBOutlet weak var myTransactionImg: UIImageView!
    
    @IBOutlet weak var paySendBtn: UIButton!
    
    @IBOutlet weak var addWithdrawBtn: UIButton!
    
    @IBOutlet weak var myTransactionBtn: UIButton!
    
    
    
    @IBOutlet weak var btnViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    //MARK:- Variables

    
    var userID:String?
    var walletID:String?
    
    var section1TitleArray = ["Mobile","LandLine","DTH","Electricity Bill","Payzan Wallet","Internet"]
    
     var iconsArray = [UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"mobileImg"),UIImage(named:"home_internet_icon")]
    
    var scrollView: UIScrollView!
    var containerView = UIView()
    
    var myNewView = UIView()
    
    var walletBal:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        namesarra4 = ["    HRECHARGEANDBILLPAYMENT".localize(value: "Your HRECHARGEANDBILLPAYMENT"),"  BOOK ON PAYZAN","  Mera Cashback Sale"]
        
        namesarra1 = ["HMobile".localize(value: "Your HMobile"),"HLandline".localize(value: "Your HLandline"),"HDTH".localize(value: "Your HDTH"),"HBroadband".localize(value: "Your HBroadband"),"HCableTV".localize(value: "Your HCableTV"),"HElectricity".localize(value: "Your HElectricity"),"HWater".localize(value: "Your HWater"),"HDataCard".localize(value: "Your HDataCard")]
        
        let defaults = UserDefaults.standard
        
        
        if let walletBal = defaults.string(forKey: walletAmountt) {
            
            walletLabel.text = walletBal
            
            print("defaults savedString: \(String(describing: walletLabel.text))")
            
            if let tabStrings = self.tabBarController?.tabBar.items
            {
                tabStrings[1].title = "MyProfile".localize(value: "My Profile")
            }

            
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            walletBal = walletAmount
            
            walletLabel.text = walletBal
            
            print("defaults savedString: \(walletAmount)")
        }
        //  paySendBtn.layer.borderColor = UIColor.lightGray.cgColor

//        paySendBtn.layer.borderColor = UIColor(red:220.0/255.0, green:198.0/255.0, blue:204.0/255.0, alpha: 1.0).cgColor
//    
//        paySendBtn.layer.borderWidth = 1.0
//        
//        addWithdrawBtn.layer.borderColor = UIColor(red:220.0/255.0, green:198.0/255.0, blue:204.0/255.0, alpha: 1.0).cgColor
//        
//        addWithdrawBtn.layer.borderWidth = 1.0
//        
//        myTransactionBtn.layer.borderColor = UIColor(red:220.0/255.0, green:198.0/255.0, blue:204.0/255.0, alpha: 1.0).cgColor
//        myTransactionBtn.layer.borderWidth = 1.0
        
        
//        self.tabBarController?.tabBar.isHidden = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        
//        walletLabel.layer.cornerRadius = 5.0
        
//         paySendBtn.layer.cornerRadius = 5.0
//         addWithdrawBtn.layer.cornerRadius = 5.0
//         myTransactionBtn.layer.cornerRadius = 5.0
        
        
        walletLabel.layer.masksToBounds = true
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        
//        self.scrollView.backgroundColor = UIColor.red
        
        //MARK:- headerImgHeight For iphone and ipad

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            
        self.scrollView.contentSize = CGSize(width: 100, height: 100)
        
        self.myNewView = UIView(frame: CGRect(x: 10, y: 0, width: self.view.frame.size.width-20, height: 100))
            
            
            myNewView.addSubview(scrollView)
            
            scrollView.showsHorizontalScrollIndicator = false
            
            scrollView.isScrollEnabled = true
            
            containerView.backgroundColor = UIColor.red
            
            containerView.isUserInteractionEnabled = true
            
            self.scrollView.alwaysBounceHorizontal = true
            
           let myImages = ["baner","baner2","baner1","baner3","baner","baner1","baner2","baner3","baner"]
            let imageWidth:CGFloat = 200
            let imageHeight:CGFloat = 100
            var xPosition:CGFloat = 0
            var scrollViewContentSize:CGFloat=0;
            
            for index in 0 ..< myImages.count
            {
                let myImage:UIImage = UIImage(named: myImages[index])!
                let myImageView:UIImageView = UIImageView()
                myImageView.image = myImage
                myImageView.contentMode = UIViewContentMode.scaleAspectFit
                myImageView.frame.size.width = imageWidth
                myImageView.frame.size.height = imageHeight
                //            myImageView.center = self.view.center
                myImageView.frame.origin.x = xPosition
                scrollView.addSubview(myImageView)
                let spacer:CGFloat = 10
                xPosition+=imageWidth + spacer
                scrollViewContentSize+=imageWidth + spacer
                scrollView.contentSize = CGSize(width: scrollViewContentSize, height:imageHeight)
            }
            
            btnViewHeight.constant = 150
            headerImgHeight.constant = 150
        
        }
        
        else{
            
        self.scrollView.contentSize = CGSize(width: 100, height: 80)
            
        self.myNewView = UIView(frame: CGRect(x: 10, y: 0, width: self.view.frame.size.width-20, height: 80))
            
           
            
            myNewView.addSubview(scrollView)
            
            scrollView.showsHorizontalScrollIndicator = false
            
            scrollView.isScrollEnabled = true
            
            containerView.backgroundColor = UIColor.red
            
            containerView.isUserInteractionEnabled = true
            
            self.scrollView.alwaysBounceHorizontal = true
            
            let myImages = ["baner","baner2","baner1","baner3","baner","baner1","baner2","baner3","baner"]
            let imageWidth:CGFloat = 150
            let imageHeight:CGFloat = 80
            var xPosition:CGFloat = 0
            var scrollViewContentSize:CGFloat=0;
            
            for index in 0 ..< myImages.count
            {
                let myImage:UIImage = UIImage(named: myImages[index])!
                let myImageView:UIImageView = UIImageView()
                myImageView.image = myImage
                myImageView.contentMode = UIViewContentMode.scaleAspectFit
                myImageView.frame.size.width = imageWidth
                myImageView.frame.size.height = imageHeight
                //            myImageView.center = self.view.center
                myImageView.frame.origin.x = xPosition
                scrollView.addSubview(myImageView)
                let spacer:CGFloat = 10
                xPosition+=imageWidth + spacer
                scrollViewContentSize+=imageWidth + spacer
                scrollView.contentSize = CGSize(width: scrollViewContentSize, height:imageHeight)
            }
            
            
            btnViewHeight.constant = 70
            headerImgHeight.constant = 79

        }
        
        
        
        
        //MARK:- NibName

        let nibName  = UINib(nibName: "HomeTableViewCell" , bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeTableViewCell")
        
        let nibName1  = UINib(nibName: "AddAgentTableViewCell" , bundle: nil)
        tableView.register(nibName1, forCellReuseIdentifier: "AddAgentTableViewCell")
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeCell")
        
        self.tabBarController?.delegate = self
        
       
  
    }
    
    
    
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        self.tabBarController?.tabBar.isHidden = false
        
        let defaults = UserDefaults.standard
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            walletBal = walletAmount
            
            walletLabel.text = walletBal
            
            print("defaults savedString: \(walletAmount)")
            
            
        }
        
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
        namesarra4 = ["    HRECHARGEANDBILLPAYMENT".localize(value: "Your HRECHARGEANDBILLPAYMENT"),"BOOKONPAYZAN".localize(value: "Your HRECHARGEANDBILLPAYMENT"),"MeraCashbackSale".localize(value: "Your HRECHARGEANDBILLPAYMENT")]
        
        namesarra1 = ["HMobile".localize(value: "Your HMobile"),"HLandline".localize(value: "Your HLandline"),"HDTH".localize(value: "Your HDTH"),"HBroadband".localize(value: "Your HBroadband"),"HCableTV".localize(value: "Your HCableTV"),"HElectricity".localize(value: "Your HElectricity"),"HWater".localize(value: "Your HWater"),"HDataCard".localize(value: "Your HDataCard")]
        
        tableView.reloadData()
        
        
        let defaults = UserDefaults.standard
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            walletBal = walletAmount
            
            walletLabel.text = walletBal
            
            print("defaults savedString: \(walletAmount)")
            
        }
        
        if let tabStrings = self.tabBarController?.tabBar.items
        {
            let tabTitle:String! = tabStrings[1].title
            
            if  tabTitle == "Login" || tabTitle == "உள் நுழை" || tabTitle == "ඇතුල් වන්න"{
                
                tabStrings[1].title = "app.Login".localize()
                
            }
            else {
                
                tabStrings[1].title = "app.MyProfile".localize()
            }
        }

    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = myNewView.bounds
        containerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

    
    }
    
     //MARK:- iPhoneScreenSizes

    func iPhoneScreenSizes(){
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")

        case 568.0:
            print("iPhone 5")
            
        case 667.0:
            print("iPhone 6")
            
        case 736.0:
            print("iPhone 6+")
            
            
        case 1024.0:
            print("iPadAir")
            
            
        default:
            print("not an iPhone")
            
            
        }
        
        
    }
    //MARK:- Tableview Datasource Methods

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 3
    }
    
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
//        
//        return 100
//        
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height:CGFloat = CGFloat()
        
        if indexPath.row == 0 {
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                height = 500
            }
            else {
                
                let bounds = UIScreen.main.bounds
                let sHeight = bounds.size.height
                
                switch sHeight {
                case 480.0:
                    print("iPhone 3,4")
                    
                    height = 180
                    
                case 568.0:
                    print("iPhone 5")
                    
                     height = 200
                    
                case 667.0:
                    print("iPhone 6")
                    
                    height = 250
                    
                case 736.0:
                    print("iPhone 6+")
                    
                    height = 280
                    
                    
                case 1024.0:
                    print("iPadAir")
                    
                    
                default:
                    print("not an iPhone")
                    
                    
                }
                
            }
            
        }
        else if indexPath.row == 1{
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
                
                height = 130
            }
            else {
                
                 height = 80
                
            }
           
        }
        else {
            
            height = 60
            
        }
        
        return height
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        if(indexPath.row == 0){
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        profileCell.homeColeectionVW.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil),
                                            forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        profileCell.selectionStyle = .none
        
        
        profileCell.headLabel.text = namesarra4[indexPath.row]
        
        profileCell.homeColeectionVW.delegate = self
        
        profileCell.homeColeectionVW.dataSource = self
        
        profileCell.homeColeectionVW.collectionViewLayout.invalidateLayout()
        
        profileCell.homeColeectionVW.tag = indexPath.row
        
        profileCell.homeColeectionVW.reloadData()
        
        
        return profileCell
            
        }else if(indexPath.row == 1){
            
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as UITableViewCell!
            cell.selectionStyle = .none
           
//            self.myNewView.backgroundColor = UIColor.blue
            
            cell.contentView.addSubview(myNewView)
            
             return cell
        }
        else {
            
            let agentCell = tableView.dequeueReusableCell(withIdentifier: "AddAgentTableViewCell", for: indexPath) as! AddAgentTableViewCell
            
            agentCell.layer.borderWidth = 0.5
            agentCell.layer.borderColor = UIColor.lightGray.cgColor
            
            agentCell.addAgentBtn.addTarget(self, action: #selector(self.addAgentAction), for: .touchUpInside)

            
            return agentCell
        }
        
        
        
    }
    
    //MARK:- addAgentAction

    
    func addAgentAction(_ sender: UIButton) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "RequestForAgentViewController") as! RequestForAgentViewController
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
     //MARK:- Button Actions
    
    @IBAction func menuAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func paySendAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 0
        addMoneyViewController.isHiddenSendView = false
        addMoneyViewController.isHiddenTransactionView = true
        addMoneyViewController.isHiddenWithdrawView = true
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
    @IBAction func addWithdrawAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 1
        addMoneyViewController.isHiddenWithdrawView = false
        addMoneyViewController.isHiddenSendView = true
        addMoneyViewController.isHiddenTransactionView = true
    
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
    }
    
    @IBAction func myTransactionAction(_ sender: Any) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 2
        addMoneyViewController.isHiddenTransactionView = false
        addMoneyViewController.isHiddenWithdrawView = true
        addMoneyViewController.isHiddenSendView = true
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
    }
    
}

 //MARK:- Collectionview Extension

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView.tag == 0 {
            
            return imageArray.count
            
        } else if collectionView.tag == 1{
            
            return imageArray1.count
        }
        else if collectionView.tag == 2{
                
                return imageArray2.count
        }
        
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            
            print(" indexPath:\( indexPath.row)")
        }
        
        if collectionView.tag == 0 {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.productIMG.image = imageArray[ indexPath.row]
            cell.nameLBL.text = namesarra1[indexPath.row]
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            
            
            return cell
            
            
        }
            
        else if collectionView.tag == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.productIMG.image =   imageArray1[indexPath.row]
            cell.nameLBL.text = namesarra1[indexPath.row]
            
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            
            return cell
            
        }
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.productIMG.image =   imageArray2[indexPath.row]
        cell.nameLBL.text = namesarra1[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.borderWidth = 1.0
        
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
        
        
    }
    
     //MARK:- Collectionview didSelectItemAt indexPath
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        if indexPath.item == 0 {
            
            let rchargeViewController = self.storyboard?.instantiateViewController(withIdentifier: "RechargeViewController") as! RechargeViewController
            self.navigationController?.pushViewController(rchargeViewController, animated: true)
        }
        else if indexPath.item == 1 {
            
            let landViewController = self.storyboard?.instantiateViewController(withIdentifier: "LandlineViewController") as! LandlineViewController
            self.navigationController?.pushViewController(landViewController, animated: true)
            
            
        }
        else if indexPath.item == 2 {
            
            let dthViewController = self.storyboard?.instantiateViewController(withIdentifier: "DTHViewController") as! DTHViewController
            self.navigationController?.pushViewController(dthViewController, animated: true)
            
            
        }
        else if indexPath.item == 3 {
            
            let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "BroadbandViewController") as! BroadbandViewController
            self.navigationController?.pushViewController(cableViewController, animated: true)
        }
        else if indexPath.item == 4 {
            
            let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "CableTvViewController") as! CableTvViewController
            self.navigationController?.pushViewController(cableViewController, animated: true)
        }
        else if indexPath.item == 5 {
            
            let electricityViewController = self.storyboard?.instantiateViewController(withIdentifier: "ElectricityViewController") as! ElectricityViewController
            self.navigationController?.pushViewController(electricityViewController, animated: true)
        }
            
        else if indexPath.item == 6 {
            
            let cableViewController = self.storyboard?.instantiateViewController(withIdentifier: "WaterViewController") as! WaterViewController
            self.navigationController?.pushViewController(cableViewController, animated: true)
        }
        else if indexPath.item == 7 {
            
            let dthViewController = self.storyboard?.instantiateViewController(withIdentifier: "DatacardViewController") as! DatacardViewController
            self.navigationController?.pushViewController(dthViewController, animated: true)
        }
    }
    
      //MARK:- Collectionview sizeForItemAt indexPath
    
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            let cellsPerRow = 4
            
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        else {
            

            let cellsPerRow = 4
            
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
      
    }
}

