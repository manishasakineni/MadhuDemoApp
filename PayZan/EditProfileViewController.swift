//
//  EditProfileViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

//MARK:- ViewControllerBDelegate

protocol ViewControllerBDelegate: class {
    
    func textChanged(text:String?)
    
}

class EditProfileViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate {
    
    //MARK:- OutLets

    @IBOutlet weak var editTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    //MARK:- Constants

    
    let headerTitle = "app.PERSONALINFORMATION".localize()
    let picker = UIImagePickerController()
    let datePicker = UIDatePicker()
    
    let TVC1 = TableViewCell1()
    let TVC2 = TableViewCell2()
    let GVC  = GenderTableViewCell()
    
    //MARK:- Variables

    var dateStr = String()
    var image:UIImage?
    var userNamee:String!
    var userIdd:String!
    var userEmail:String!
    
    var checked = false
    var male = true
    var female = false
    
    var jpgImageData:Data!
    
    var dictProfile:NSMutableDictionary!
    var imageData: Data!
    
    var isImageSave:Bool = false
    
    
    weak var delegate: ViewControllerBDelegate?
    
    var text: String? = nil
    var labelText:String?
    
    
    var editProfileArray:ProfileResultVo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.editTableView.delegate = self
        self.editTableView.dataSource = self
        
        self.editTableView.separatorStyle = .none
        
        labelText = text
        
        
        
        let defaults = UserDefaults.standard
        
        if let useriddd = defaults.string(forKey: userIDD) {
            
            userIdd = useriddd
            
            print("userName: \(String(describing: userIdd))")
        }
        
        if let userName = defaults.string(forKey: uNamee) {
            
            userNamee = userName
            
            print("userName: \(String(describing: userNamee))")
        }
        else {
            
            userNamee = "User Name"
        }
        
        if let email = defaults.string(forKey:emailIdd ) {
            
            userEmail = email
            
            print("userName: \(String(describing: userEmail))")
        }
        else {
            
            userEmail = "abc@gmail.com"
        }
        
        getEditProfileList()
        
        //MARK:- headerImgHeight For iphone and ipad

        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }
        
           }
    
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return 1.0
        }
            
        else{
            return 45.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        var headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.9222715736, green: 0.9222715736, blue: 0.9222715736, alpha: 1)
        
        if (section == 0) {
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 2))
            
        }
        else {
            
            let headerLabel = UILabel(frame: CGRect(x: 15, y: 20, width:
                tableView.bounds.size.width, height: 20))
            headerLabel.font = UIFont(name: "Verdana", size: 11)
            headerLabel.textColor = UIColor.gray
            headerLabel.text = self.tableView(self.editTableView, titleForHeaderInSection: section)
            headerLabel.sizeToFit()
            headerView.addSubview(headerLabel)
        }
        
        return headerView
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 100
        }
            
        else{
            if indexPath.row == 4{
                
                return 150
            }
            return 50
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section==1){
            
            
            return headerTitle
        }
        
        return nil
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
            
        else if section == 1 {
            
            return  6
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.selectionStyle = .none
            cell.profileImag.layer.cornerRadius = cell.profileImag.frame.size.height/2;
            cell.profileImag.layer.borderColor = UIColor.gray.cgColor
            cell.profileImag.layer.borderWidth = 1
            cell.profileImag.clipsToBounds = true
            cell.profileImag.image = image
            
            
            cell.firstNameTF.text = editProfileArray?.UserName
            cell.lastNameTF.text = editProfileArray?.FirstName
            cell.firstNameTF.placeholder = "app.FirstName".localize()
            cell.lastNameTF.placeholder = "app.LastName".localize()
            cell.editButton.addTarget(self, action: #selector(self.editBtnClicked), for: .touchDown)
            
            return cell
            
        }
            
        else
        {
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.selectionStyle = .none
            
            if indexPath.row == 0{
                
                cell.detailsTF.text = editProfileArray?.UserName
                cell.detailsLbl?.text = "app.UserName".localize()
                cell.detailsTF.placeholder = "app.UserName".localize()
                cell.detailsTF.layer.borderWidth = 0.5
                cell.detailsTF.layer.borderColor = UIColor.lightGray.cgColor
                cell.detailsTF.layer.cornerRadius = 3
                cell.detailsTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
                 delegate?.textChanged(text: cell.detailsLbl?.text)
//                cell.ImgVW?.image = UIImage(named: "Profile")
                
                
            }
                
                

            else if indexPath.row == 1{
                
                cell.detailsTF.text = editProfileArray?.Email
                cell.detailsLbl?.text = "app.Email".localize()
                cell.detailsTF.placeholder = "app.Email".localize()
                cell.detailsTF.layer.borderWidth = 0.5
                cell.detailsTF.layer.borderColor = UIColor.lightGray.cgColor
                cell.detailsTF.layer.cornerRadius = 3
                cell.detailsTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//                cell.ImgVW?.image = UIImage(named: "Mail")
                
                
            }
                
            else if indexPath.row == 2{
                
                cell.detailsTF.text = editProfileArray?.UserName
                cell.detailsLbl?.text = "app.MobileNo".localize()
                cell.detailsTF.placeholder = "app.MobileNo".localize()
                cell.detailsTF.layer.borderWidth = 0.5
                cell.detailsTF.layer.borderColor = UIColor.lightGray.cgColor
                cell.detailsTF.layer.cornerRadius = 3
                cell.detailsTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//                cell.ImgVW?.image = UIImage(named: "Mobile")
                
                
            }
                
            else if indexPath.row == 3{
                
                
                cell.detailsLbl?.text = editProfileArray?.DOB
                cell.detailsTF.placeholder = "app.DateOfBirth".localize()
                cell.detailsTF.layer.borderWidth = 0.5
                cell.detailsTF.layer.borderColor = UIColor.lightGray.cgColor
                cell.detailsTF.layer.cornerRadius = 3
                cell.detailsTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
//                cell.ImgVW?.image = UIImage(named: "DOB")
                
                datePicker.datePickerMode = .date
                let toolBar = UIToolbar()
                toolBar.sizeToFit()
                
                let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
                
                toolBar.setItems([doneButton], animated: true)
                
                cell.detailsTF.inputAccessoryView = toolBar
                
                cell.detailsTF.inputView = datePicker
                cell.detailsTF.text! = dateStr
                
                
            }
                
            else if indexPath.row == 4{
                
                let cell = Bundle.main.loadNibNamed("GenderTableViewCell", owner: self, options: nil)?.first as! GenderTableViewCell
                
                
                cell.selectionStyle = .none
                
                cell.maleUnCheckBtn.image = (male == true) ? UIImage(named:"checked_83366") : UIImage(named:"icons8-Unchecked Circle-50")
                
                cell.femaleUnCheck.image = (female == true) ? UIImage(named:"checked_83366") : UIImage(named:"icons8-Unchecked Circle-50")
                
                cell.maleBtn.addTarget(self, action: #selector(self.maleBtnClicked), for: .touchUpInside)
                
                
                cell.femaleBtn.addTarget(self, action: #selector(self.femaleBtnClicked), for: .touchUpInside)
                
                cell.saveBtn.addTarget(self, action: #selector(self.saveBtnClicked), for: .touchUpInside)
                
                
                return cell
                
            }
            
            
            
            return cell
        }
        
        
    }
    
    
    //MARK:- Edit Action
    
    
    func editBtnClicked(_ sender: UIButton) {
        print("I Clicked a button")
        
        
        let alert:UIAlertController=UIAlertController(title: "app.ChooseProfileImage".localize(), message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "app.FromCamera".localize(), style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "app.FromGallery".localize(), style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        self.present(alert, animated: true, completion: nil)
        
//        let images = UIImagePickerController()
//        
//        images.delegate = self
//        
//        images.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        
//        images.allowsEditing = false
//        
//        self.present(images, animated : true){
//            
//            
//        }
    }
    
    //MARK:- saveBtnClicked

    
    func saveBtnClicked(_ sender: UIButton) {
        
        
    }
    //MARK:- openCamera

    
    func openCamera() {
        picker.allowsEditing = true
        //      picker.sourceType = .PhotoLibrary
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
        
    }
    
    //MARK:- openGallary

    
    func openGallary() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        //      picker.sourceType = .Camera
        present(picker, animated: true, completion: nil)
        
    }
    
    //MARK:- imagePickerController
 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        dismiss(animated: true, completion: nil)
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        editTableView.reloadData()
    }
    
    //MARK:- UIPickerViewController

    
    func image(_ image: UIImage!, didFinishSavingWithError error: NSError!, contextInfo: AnyObject!) {
        if (error != nil) {
            // print("image")
            
            // Something wrong happened.
        } else {
            
            //  print("not image")
            // Everything is alright.
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- saveImage

    
    func saveImage (_ image: UIImage, path: String ) -> Bool{
        
        isImageSave = true
        
        //let pngImageData = UIImagePNGRepresentation(image)
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = (try? jpgImageData!.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil
        
        return result
    }
    
    //MARK:- donePressed

    
    
    func donePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        dateStr = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
        editTableView.reloadData()
    }
    
    //MARK:- textFieldDidBeginEditing

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        if  TVC1.firstNameTF.text != nil{
            
            TVC1.FNLbl.isHidden = false
        }
        
        
        
    }
    
    //MARK:- hideLabels

    
    func hideLabels(){
        
        
        
    }
    
    //MARK:- maleBtnClicked

    
    func maleBtnClicked(_ sender: UIButton) {
        
        male = true
        female = false
        
        
        
        let indexPath = IndexPath(item: 5, section: 1)
        
        editTableView.reloadRows(at: [indexPath], with: .fade)
        
        editTableView.reloadData()
        
        
    }
    
    //MARK:- femaleBtnClicked

    
    func femaleBtnClicked(_ sender: UIButton){
        
        male = false
        female = true
        
        
        
        let indexPath = IndexPath(item: 5, section: 1)
        
        editTableView.reloadRows(at: [indexPath], with: .fade)
        
        editTableView.reloadData()
        
    }
    
    //MARK:- Button Actions

    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        delegate?.textChanged(text: labelText)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        delegate?.textChanged(text: labelText)
    }
    
    func getEditProfileList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if userIdd != nil {
            
            let strUrl = getProfileUrl + "" + userIdd
            
//            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:GetProfileVo = Mapper().map(JSONObject: result)!
                        
                        let isSuccess = respVO.IsSuccess
                        
                        //                    let status = result["status"] as! String
                        
                        if(isSuccess == true){
                            
                            let editProfileObj = respVO.Result
                            
                            if editProfileObj != nil {
                                
                                var objjj = editProfileObj!
                                
                                self.editProfileArray = objjj
                                
                                
                            }
                            
                            self.editTableView.reloadData()
                            
                        }else if(isSuccess == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                        //  MBProgressHUD.hide(for:self.appDelegate.window, animated: true)
                }
            }, failure:  {(error) in
            })
            }
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    @IBAction func doneAction(_ sender: Any) {
    }
   

}
