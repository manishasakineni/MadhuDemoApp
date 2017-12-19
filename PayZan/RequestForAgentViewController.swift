//
//  RequestForAgentViewController.swift
//  PayZan
//
//  Created by Harikrishna Unnam on 28/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
//import TextFieldEffects

protocol RequeatAgentDelegate: class {
    
    func textChanged(text:String?)
    
}

class RequestForAgentViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    
let headerTitle = "PERSONAL INFORMATION"
    
    @IBOutlet weak var requestForAgentTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    
    weak var reqdelegate: RequeatAgentDelegate?
    
    var myPickerView = UIPickerView()
    
    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    var pickerData : Array<String> = Array()
    
    var placeholdersAry  = ["Select District","Select Mandal","Select Village","First Name","Middle Name","Last Name","Mobile No","Email","Address1","Address2"]
    
    var firstName    : String = ""
    var middileName  : String = ""
    var lastName     : String = ""
    var mobileNo   : String = ""
    var emailID       : String = ""
    var address1  : String = ""
    var address2     : String = ""
    var landmark       : String = ""
    var comments : String = ""
    
    var provinceListArr = Array<String>()
//    var provinceIDArray = Array<Int>()
    var provinceIDArray:[AgentReqResultVo]?
    var districtIDArray:[AgentDistrictResultVo]?
    var mandalIDArray:[AgentMandalResultVo]?
    var villageIDArray:[AgentVillageResultVo]?

    var districtsAry = Array<String>()
    var mandalsAry = Array<String>()
    var villagesAry = Array<String>()
    
   

    var selectedProvinceStr = ""
    var selectedDistrictStr = ""
    var selectedMandalStr   = ""
    var selectedVillageStr  = ""
    
    var provinceID     : Int    = 0
    var districtID     : Int    = 0
    var mandalID       : Int    = 0
    var villageID       : Int    = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nibName  = UINib(nibName: "AddAgentRequestTableViewCell" , bundle: nil)
        requestForAgentTableView.register(nibName, forCellReuseIdentifier: "AddAgentRequestTableViewCell")
        
        let nibName1  = UINib(nibName: "SubmitAgentTableViewCell" , bundle: nil)
        requestForAgentTableView.register(nibName1, forCellReuseIdentifier: "SubmitAgentTableViewCell")
        
        requestForAgentTableView.dataSource = self
        requestForAgentTableView.delegate = self
        
        getProvinceList()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestForAgentTableView.reloadData()
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        if let newRegCell : AddAgentRequestTableViewCell = textField.superview?.superview as? AddAgentRequestTableViewCell {
        
        if textField == newRegCell.agentRequestField {
            
            
            if (newRegCell.agentRequestField.text != nil)  {
                
                newRegCell.titleLabel.isHidden = false
                
            }
                
            else{
                
                newRegCell.titleLabel.isHidden = true
                
                
            }
        }
        }
        if textField.tag == 0{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 1 {
            
            textField.inputView = nil
            textField.keyboardType = .default
        }
            
        else if textField.tag == 2{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 3{
            
            textField.inputView = nil
            textField.keyboardType = .phonePad
            
        }
            
        else if textField.tag == 4{
            textField.inputView = nil
            textField.keyboardType = .emailAddress
            
        }
        else if textField.tag == 5{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = provinceListArr
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
            
        else if textField.tag == 6{
            
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = districtsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
        }
            
        else if textField.tag == 7{
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = mandalsAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
            
        else if textField.tag == 8{
           
            textField.clearButtonMode = .never
            textField.inputView = myPickerView
            pickerData = villagesAry
            self.pickUp(activeTextField)
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
        }
        else if textField.tag == 9{
            textField.inputView = nil
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 10 {
            
            textField.clearButtonMode = .never
           
            
        }
            
        else if textField.tag == 11 {
            
            textField.clearButtonMode = .never
            
            
        }
            
        else if textField.tag == 12 {
            
            textField.clearButtonMode = .never
      
            
        }
            

        
        // myPickerView.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 1{
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.letters
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        
        if textField.tag == 5{
            if string.characters.count > 0 {
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.characters.count == 0
            }
            
            return true
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if let newRegCell : AddAgentRequestTableViewCell = textField.superview?.superview as? AddAgentRequestTableViewCell {
            
            
            if newRegCell.agentRequestField.text == nil {
                
                newRegCell.titleLabel.isHidden = true
                newRegCell.titleLabel.isHidden = false
                
                
            }
        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        
        if let newRegCell : AddAgentRequestTableViewCell = textField.superview?.superview as? AddAgentRequestTableViewCell {
            

            if (newRegCell.agentRequestField.text != nil)  {
                
                newRegCell.titleLabel.isHidden = true
            }
                
            else{
                
                newRegCell.titleLabel.isHidden = false
                
            }
            
            if textField.tag == 0{
                
           firstName =  textField.text!
                
                
            }
            else if textField.tag == 1{
                
                middileName = textField.text!
                
            }
                
            else if textField.tag == 2 {
                
            lastName = textField.text!
                
            }
                
            else if textField.tag == 3{
                
              mobileNo = textField.text!
                
            }
            else if textField.tag == 4{

                emailID = textField.text!
                
                
            }
                
            else if textField.tag == 5 {
                
               activeTextField.text = selectedProvinceStr
                
            }
                
            else if textField.tag == 6 {
                
                activeTextField.text = selectedDistrictStr
                
            }
                
                
            else if textField.tag == 7 {
                
                 activeTextField.text = selectedMandalStr
                
            }
                
                
            else if textField.tag == 8 {
                
                activeTextField.text = selectedVillageStr
                
            }
                
            else if textField.tag == 9 {
                
                address1 = textField.text!
                
            }
                
            else if textField.tag == 10 {
                
                 address2 = textField.text!

            }
                
            else if textField.tag == 11 {
                landmark = textField.text!
       
            }
                
            else if textField.tag == 12 {
                
          comments = textField.text!
                
            }

      
            myPickerView.endEditing(true)
            
        }
        
        // textField.endEditing(true)
    }

    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white

        

            textField.inputView = self.myPickerView

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)
        //            UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RechargeViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(RechargeViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        if textField.inputView == myPickerView{
            textField.inputAccessoryView = toolBar
        }
        
    }
    
    //MARK:- Button
    func doneClick() {
        activeTextField.resignFirstResponder()
        
//        requestForAgentTableView.reloadData()
    }
    func cancelClick() {
        activeTextField.resignFirstResponder()
//        requestForAgentTableView.reloadData()
    }
    
    //MARK:- TextFiled Delegate
    

    
    //MARK:- PickerView Delegate & DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
      //  self.activeTextField.text = pickerData[row]
        
        if activeTextField.tag == 5{
            
            if pickerData.count > row {
                
                selectedProvinceStr = pickerData[row]
                activeTextField.text = selectedProvinceStr
                if(row < (provinceIDArray?.count)!){
                    if let value = provinceIDArray?[row].Id{
                        provinceID = value
                    }
                }
                
                districtsAry.removeAll()
                getDistrictList()
            }
        }
        else if activeTextField.tag == 6{
            
            if pickerData.count > row {
                
                selectedDistrictStr = pickerData[row]
                activeTextField.text = selectedDistrictStr
                if(row < (districtIDArray?.count)!){
                    if let value = districtIDArray?[row].Id{
                        districtID = value
                    }
                }
                
                mandalsAry.removeAll()
                getMandalList()
            }
        }
        
        else if activeTextField.tag == 7{
            
            if pickerData.count > row {
                
                selectedMandalStr = pickerData[row]
                activeTextField.text = selectedMandalStr
                if(row < (mandalIDArray?.count)!){
                    if let value = mandalIDArray?[row].Id{
                        mandalID = value
                    }
                }
                
                villagesAry.removeAll()
                getVillageList()
            }
        }
        else if activeTextField.tag == 8{
            
            if pickerData.count > row {
                
                selectedVillageStr = pickerData[row]
                activeTextField.text = selectedVillageStr
                if(row < (villageIDArray?.count)!){
                    if let value = villageIDArray?[row].Id{
                        villageID = value
                    }
                }
                
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return 1.0
        }
            
        else{
            return 20.0
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
            
             headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 2))
        }
        
        return headerView
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 50
        }
            
        else{
            
            return 60
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return nil
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 13
        }
            
        else if section == 1 {
            
            return  1
        }
        
        return 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAgentRequestTableViewCell") as! AddAgentRequestTableViewCell
        
        cell.selectionStyle = .none
             cell.agentRequestField.delegate = self
            
            cell.agentRequestField.tag = indexPath.row
        
        if indexPath.row == 0{
            
            cell.titleLabel?.text = "app.FirstName".localize()
//            "Select District"
            cell.agentRequestField.placeholder = "app.FirstName".localize()
            
            cell.agentRequestField.text = firstName
            
//            reqdelegate?.textChanged(text: cell.titleLabel?.text)
            
        }
         else if indexPath.row == 1{
            
            cell.titleLabel?.text = "app.MiddleName".localize()
            cell.agentRequestField.placeholder = "app.MiddleName".localize()
            cell.agentRequestField.text = middileName
            
        }
        else if indexPath.row == 2{
            
            cell.titleLabel?.text = "app.LastName".localize()
            cell.agentRequestField.placeholder = "app.LastName".localize()
            cell.agentRequestField.text = lastName
            
        }
        else if indexPath.row == 3{
            
            cell.titleLabel?.text = "app.MobileNo".localize()
            cell.agentRequestField.placeholder = "app.MobileNo".localize()
            cell.agentRequestField.text = mobileNo
            
        }
        else if indexPath.row == 4{
            
            cell.titleLabel?.text = "app.Email".localize()
            cell.agentRequestField.placeholder = "app.Email".localize()
            cell.agentRequestField.text = emailID
            
        }
        else if indexPath.row == 5{
            
            cell.titleLabel?.text = "app.SelectProvince".localize()
            cell.agentRequestField.placeholder = "app.SelectProvince".localize()
            
            cell.agentRequestField.text = selectedProvinceStr
            
        }
        else if indexPath.row == 6{
            
            cell.titleLabel?.text = "app.SelectDistricts".localize()
            cell.agentRequestField.placeholder = "app.SelectDistricts".localize()
            
            cell.agentRequestField.text = selectedDistrictStr
            
        }
        else if indexPath.row == 7{
            
            cell.titleLabel?.text = "app.SelectMandal".localize()
            cell.agentRequestField.placeholder = "app.SelectMandal".localize()
            
            cell.agentRequestField.text = selectedMandalStr
            
        }
        else if indexPath.row == 8{
            
            cell.titleLabel?.text = "app.SelectVillage".localize()
            cell.agentRequestField.placeholder = "app.SelectVillage".localize()
            
            cell.agentRequestField.text = selectedVillageStr
            
        }
        else if indexPath.row == 9{
            
            cell.titleLabel?.text = "app.Address1".localize()
            cell.agentRequestField.placeholder = "app.Address1".localize()
            
            cell.agentRequestField.text = address1
            
        }
        else if indexPath.row == 10{
            
            cell.titleLabel?.text = "app.Address2".localize()
            cell.agentRequestField.placeholder = "app.Address2".localize()
            
            cell.agentRequestField.text = address2
            
            }
        else if indexPath.row == 11{
            
            cell.titleLabel?.text = "app.Landmark"
            cell.agentRequestField.placeholder = "app.Landmark".localize()
            
            cell.agentRequestField.text = landmark
            
            }
        else if indexPath.row == 12{
            
            cell.titleLabel?.text = "app.Enteryourcomments".localize()
            cell.agentRequestField.placeholder = "app.Enteryourcomments".localize()
            
            cell.agentRequestField.text = comments
            
        }
            
            return cell
            
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitAgentTableViewCell", for: indexPath) as! SubmitAgentTableViewCell
            
            
            cell.submitBtn.addTarget(self, action: #selector(self.submitAgentAction), for: .touchUpInside)
            
            return cell
        }
        
        
    }
    
    func submitAgentAction(_ sender: UIButton) {
        
    print("sender:\(sender.tag)")
        
        requestForAgentTableView.reloadData()
        
        if self.validateAllFields()
        {
                if(appDelegate.checkInternetConnectivity()){
                    
                    addAgentReqInfoService()
                        
                    
                }
                else {
                    
                    self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                    return
                    
        }
        }
     
    }
    
    
    func validateAllFields() -> Bool
    {
        
        //Check whether textField are left empty or not
        var errorMessage:NSString?
        
        let fName:NSString = firstName as NSString
        let lName:NSString = lastName as NSString
        let mobile:NSString = mobileNo as NSString
        let email:NSString = emailID as NSString
        let province:NSString = selectedProvinceStr as NSString
        let district:NSString = selectedDistrictStr as NSString
        let mandal:NSString = selectedMandalStr as NSString
        let village:NSString = selectedVillageStr as NSString
        let address11:NSString = address1 as NSString
        let address22:NSString = address2 as NSString
        let landmarkk:NSString = landmark as NSString
        let commentss:NSString = comments as NSString
        
        
        if (fName.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankFnameErrorMessage() as String as String as NSString?
            
        }
        else if (lName.length <= 0){
            
           errorMessage=GlobalSupportingClass.blankLnameErrorMessage() as String as String as NSString?
            
        }
            
        else if (mobile.length <= 0){
            
           errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobile.length <= 9) {
            
            
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
            
            
        else if (email.length <= 0){
            

            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
            
        else if(!GlobalSupportingClass.isValidEmail(email as NSString)){
            
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
            
            
        }
        else if (email.length<=3) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
        else if (province.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankProvinceErrorMessage() as String as String as NSString?
            
        }
        else if (district.length <= 0){
            
           errorMessage=GlobalSupportingClass.blankDistrictErrorMessage() as String as String as NSString?
            
        }
        else if (mandal.length <= 0){
            
           errorMessage=GlobalSupportingClass.blankMandalErrorMessage() as String as String as NSString?
            
        }
        else if (village.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankVillageErrorMessage() as String as String as NSString?
            
        }
            
        else if (address11.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankAddress1ErrorMessage() as String as String as NSString?
            
        }
        else if (address22.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankAddress2ErrorMessage() as String as String as NSString?
            
        }
        else if (landmarkk.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankLandmarkErrorMessage() as String as String as NSString?
            
        }
        else if (commentss.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankCommentsErrorMessage() as String as String as NSString?
            
        }
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("app.Alert".localize(), message: errorMsg as String, buttonTitle: "app.Retry".localize())
            return false;
        }
        return true
    }
    
    func getProvinceList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = PROVINCE_API
            
//            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentReqVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            let provinceObj = respVO.ListResult
                            
                            
                            
                            for(index,element) in (provinceObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.provinceListArr.append(element.Name!)
//                                self.provinceIDArray.append(element.Id!)
                                
                            }
                            
                            self.provinceIDArray = provinceObj

                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }

                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    func getDistrictList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = DISTRICTS_API + String(provinceID)
            
//            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentDistrictVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        //                    let status = result["status"] as! String
                        
                        if(isActive == true){
                            
                            let districtObj = respVO.ListResult
                            
                            
                            
                            for(index,element) in (districtObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.districtsAry.append(element.Name!)
                                //                                self.provinceIDArray.append(element.Id!)
                                
                            }
                            
                            self.districtIDArray = districtObj
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }

                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    func getMandalList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = MANDALS_API + String(districtID)
            
//            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentMandalVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        //                    let status = result["status"] as! String
                        
                        if(isActive == true){
                            
                            let mandalObj = respVO.ListResult
                            
                            
                            
                            for(index,element) in (mandalObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.mandalsAry.append(element.Name!)
                                //                                self.provinceIDArray.append(element.Id!)
                                
                            }
                            
                            self.mandalIDArray = mandalObj
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }

                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    
    func getVillageList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = VILLAGES_API + String(mandalID)
            
//            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:AgentVillageVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        //                    let status = result["status"] as! String
                        
                        if(isActive == true){
                            
                            let villageObj = respVO.ListResult
                            
                            for(index,element) in (villageObj?.enumerated())! {
                                
                                print("index:\(index)")
                                
                                self.villagesAry.append(element.Name!)
                                //                                self.provinceIDArray.append(element.Id!)
                                
                            }
                            
                            self.villageIDArray = villageObj
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }

                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
    }
    
    func addAgentReqInfoService(){
        
        
            let  strUrl = ADDAGENT_API
            
            //        let null = NSNull()
            
            let currentDate = GlobalSupportingClass.getCurrentDate()
            
            print("currentDate\(currentDate)")
            
            let dictParams = [
                "Id": 0,
                "AgentRequestCategoryId": 38,
                "TitleTypeId": 19,
                "FirstName": firstName,
                "MiddleName": middileName,
                "LastName": lastName,
                "MobileNumber": mobileNo,
                "Email": emailID,
                "AddressLine1": address1,
                "AddressLine2": address2,
                "Landmark": landmark,
                "VillageId": villageID,
                "Comments": comments,
                "Created": currentDate
                ] as NSDictionary
            
            print("dic params \(dictParams)")
            
            let dictHeaders = ["":"","":""] as NSDictionary
            
            
            print("dictHeader:\(dictHeaders)")
            
            serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        print("result:\(result)")
                        
                        let respVO:AddAgentReqVo = Mapper().map(JSONObject: result)!
                        
                        
                        print("responseString = \(respVO)")
                        
                        
                        let statusCode = respVO.IsSuccess
                        
                        print("StatusCode:\(String(describing: statusCode))")
                        
                        
                        
                        if statusCode == true
                        {
                            
                            let successMsg = respVO.EndUserMessage
                            
                            
                            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            self.navigationController?.pushViewController(homeViewController, animated: true)
                            
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            return
                            
                        }
                        else {
                            
                            let failMsg = respVO.EndUserMessage
                            
                            self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                            
                            return
                            
                        }
                            
                       
                }
            }, failureHandler: {(error) in
            })
        
        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        
    }
    
    
}
    
    
    
    
    
    
    
    



    



