//
//  HomeViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit


var imageArray = [UIImage(named:"mobile"),UIImage(named:"electricity"),UIImage(named:"event"),UIImage(named:"sport"),UIImage(named:"television"),UIImage(named:"internet"),UIImage(named:"water-tap"),UIImage(named:"landline")]

var imageArray1 = [UIImage(named:"water-tap"),UIImage(named:"landline"),UIImage(named:"electricity"),UIImage(named:"event"),UIImage(named:"sport"),UIImage(named:"television"),UIImage(named:"mobile"),UIImage(named:"internet")]

var imageArray2 = [UIImage(named:"mobile"),UIImage(named:"landline"),UIImage(named:"electricity"),UIImage(named:"event"),UIImage(named:"sport"),UIImage(named:"television"),UIImage(named:"water-tap"),UIImage(named:"internet")]
//for label names

var namesarra1 = ["Mobile","Electricity","Events","Sports","DTH","Internet","Water","Landline"]

var namesarra2 = ["Water","Landline","Electricity","Events","Sports","DTH","Mobile","Internet"]

var namesarra3 = ["Mobile","Landline","Electricity","Events","Sports","DTH","Water","Internet"]

//for heading names

var namesarra4 = ["RECHARGE AND BILL PAYMENT","BOOK ON PAYZAN","Mera Cashback Sale"]

class HomeViewController: UIViewController,UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource,SWRevealViewControllerDelegate,UIScrollViewDelegate,UITabBarDelegate {
    
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
    
    var section1TitleArray = ["Mobile","LandLine","DTH","Electricity Bill","Payzan Wallet","Internet"]
    
     var iconsArray = [UIImage(named:"home_mobile_icon"),UIImage(named:"home_landline_icon"),UIImage(named:"home_cabletv_icon"),UIImage(named:"home_electricityr_icon"),UIImage(named:"home_mobile_icon"),UIImage(named:"home_internet_icon")]
    
    var scrollView: UIScrollView!
    var containerView = UIView()
    
    var myNewView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paySendBtn.layer.borderColor = UIColor.lightGray.cgColor
        paySendBtn.layer.borderWidth = 1.0
        
        addWithdrawBtn.layer.borderColor = UIColor.lightGray.cgColor
        addWithdrawBtn.layer.borderWidth = 1.0
        
        myTransactionBtn.layer.borderColor = UIColor.lightGray.cgColor
        myTransactionBtn.layer.borderWidth = 1.0
        
        
        self.tabBarController?.tabBar.isHidden = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        walletLabel.layer.cornerRadius = 5.0
        
        walletLabel.layer.masksToBounds = true
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: 1000, height: 180)
        
        scrollView.isScrollEnabled = true
        
        containerView.backgroundColor = UIColor.red
        
        containerView.isUserInteractionEnabled = true
        
        self.scrollView.alwaysBounceHorizontal = true
        
        let myImages = ["addsImg","addsImg","addsImg","addsImg","addsImg","addsImg","addsImg","addsImg","addsImg"]
        let imageWidth:CGFloat = 380
        let imageHeight:CGFloat = 180
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
            xPosition+=imageHeight + spacer
            scrollViewContentSize+=imageHeight + spacer
            scrollView.contentSize = CGSize(width: scrollViewContentSize, height:imageHeight)
        }

        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let nibName  = UINib(nibName: "HomeTableViewCell" , bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeTableViewCell")
        
        self.tabBarController?.delegate = self
        
        sideMenus()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        
        super.viewDidAppear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        scrollView.delegate = self
        scrollView.frame = myNewView.bounds
        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
           // CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)
    }
    
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("Test")
//        
//        if(item.tag == 1) {
//            print("item1")
//            
////            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
////            self.navigationController?.pushViewController(homeViewController, animated: true)
//            
//            self.view.isHidden = false
//            
//            //your code for tab item 1
//        }
//        else if(item.tag == 2) {
//            print("item2")
//            
//            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "OffersViewController") as! OffersViewController
//            self.navigationController?.pushViewController(homeViewController, animated: true)
//            //your code for tab item 2
//        }
//        else if(item.tag == 3) {
//            print("item3")
//            
//            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
//            self.navigationController?.pushViewController(homeViewController, animated: true)
//            //your code for tab item 2
//        }
//        else if(item.tag == 4){
//            
//            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            
////            homeViewController.headerView.backgroundColor = UIColor.white
//            
//            self.navigationController?.pushViewController(homeViewController, animated: true)
//            print("item4")
//        }
//    }
    
    
    func sideMenus(){
        
        if revealViewController() != nil {
            
            self.revealViewController().delegate = self
            
                        menuBtnItem.target = revealViewController()
                        menuBtnItem.action = #selector(SWRevealViewController.revealToggle(_:))
                        //  revealViewController() .rearViewRevealWidth = 275
                        revealViewController().rightViewRevealWidth = 275
            
                        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height:CGFloat = CGFloat()
        
        if indexPath.row == 0 {
            height = 380
        }
        else if indexPath.row == 1{
            height = 250
        }
        else {
            
            height = 200
            
        }
        
        return height
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        profileCell.homeColeectionVW.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil),
                                            forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        if(indexPath.row == 0){
            
            
             self.myNewView = UIView(frame: CGRect(x: 10, y: 200, width: 395, height: 180))
            
            
             myNewView.addSubview(scrollView)
            
            
            profileCell.contentView.addSubview(myNewView)
            
//            profileCell.backgroundColor = UIColor.white
//            
//            profileCell.homeColeectionVW.backgroundColor = UIColor.white
//            
//            profileCell.headLabel.backgroundColor = UIColor.clear
//            profileCell.headLabel.textColor = UIColor.black
            
        }else{
            
//            profileCell.backgroundColor = UIColor.white
//            
//            profileCell.homeColeectionVW.backgroundColor = UIColor.white
//            
//            profileCell.headLabel.backgroundColor = UIColor.white
//            profileCell.headLabel.textColor = UIColor.black
            
            
        }
        
        
        
        profileCell.headLabel.text = namesarra4[indexPath.row]
        
        profileCell.homeColeectionVW.delegate = self
        
        profileCell.homeColeectionVW.dataSource = self
        
        profileCell.homeColeectionVW.collectionViewLayout.invalidateLayout()
        
        profileCell.homeColeectionVW.tag = indexPath.row
        
        profileCell.homeColeectionVW.reloadData()
        
        
        return profileCell
        
        
        
    }
    
    
    @IBAction func menuAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

    
}

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
        
        if collectionView.tag == 0 {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.productIMG.image =   imageArray[ indexPath.row]
            cell.nameLBL.text = namesarra1[indexPath.row]
            
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            
            cell.contentView.layer.cornerRadius = 20
            cell.contentView.layer.borderWidth = 1.0
            
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

         //   cell.contentView.layer.backgroundColor = UIColor.red.cgColor
//            cell.backgroundColor = UIColor.white
            
            return cell
            
            
        }
            
        else if collectionView.tag == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.productIMG.image =   imageArray1[indexPath.row]
            
            cell.nameLBL.text = namesarra2[indexPath.row]
            
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            
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
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.productIMG.image =   imageArray2[indexPath.row]
        cell.nameLBL.text = namesarra3[indexPath.row]
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        if indexPath.item == 0 {
            
            let rchargeViewController = self.storyboard?.instantiateViewController(withIdentifier: "RechargeViewController") as! RechargeViewController
            self.navigationController?.pushViewController(rchargeViewController, animated: true)
        }
    }
    
    //for label heigt
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        
//        if collectionView.tag == 0 {
//            
//            return CGSize(width: 90, height: 200)
//        }
        
        return CGSize(width: 85, height: 85)
        
    }
    
    
}
