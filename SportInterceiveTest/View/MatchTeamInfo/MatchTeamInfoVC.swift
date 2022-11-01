//
//  MatchTeamInfoVC.swift
//  SportInterceiveTest
//
//  Created by Sushil Chaudhary on 10/27/22.
//

import UIKit
class MatchTeamInfoVC: UIViewController{
    //MARK: - IBoutlet
    //---------------
    @IBOutlet weak var firstCv: UICollectionView!
    @IBOutlet weak var secondCv: UICollectionView!
    @IBOutlet weak var thirdCv: UICollectionView!
    @IBOutlet weak var fourthCv: UICollectionView!
    @IBOutlet weak var nameOneLbl: UILabel!
    @IBOutlet weak var nameTwoLbl: UILabel!
    @IBOutlet weak var nameThreeLbl: UILabel!
    @IBOutlet weak var nameFourLbl: UILabel!
    //MARK: - variables
    //---------------
    var firstTeamData : [String : Team]?
    var secondTeamData : [String : Team]?
    //SecondModelData
    var sFirstTeamData : [String : Team]?
    var sSecondTeamData : [String : Team]?
    //----
    var indiateamkeys = [String]()
    var newzteamkeys = [String]()
    var pakteamkeys = [String]()
    var southafrickeys = [String]()
    //MARK: - lifeCycles
    //---------------
        override func viewDidLoad() {
            super.viewDidLoad()
           navigationItemS()
            DelData()
            print(firstTeamData ?? [])
            indiateamkeys = firstTeamData?["4"]?.players?.map({$0.key}) ?? []
            print(secondTeamData ?? [])
            newzteamkeys = secondTeamData?["5"]?.players?.map({$0.key}) ?? []
            print(sFirstTeamData ?? [])
            pakteamkeys = sFirstTeamData?["6"]?.players?.map({$0.key}) ?? []
            print(sSecondTeamData ?? [])
            southafrickeys = sSecondTeamData?["7"]?.players?.map({$0.key}) ?? []
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameOneLbl.text = firstTeamData?["4"]?.nameFull ?? ""
        nameTwoLbl.text = secondTeamData?["5"]?.nameFull ?? ""
        nameThreeLbl.text = sFirstTeamData?["6"]?.nameFull ?? ""
        nameFourLbl.text = sSecondTeamData?["7"]?.nameFull ?? ""
    }
    //MARK: - iBaction
    //---------------
    //MARK: - func
    //---------------
    func navigationItemS() {
        self.navigationItem.title = "Match Team Info"
        let rightbutton = UIButton(frame: CGRect(x:0.0 , y:0.0, width: 30, height: 30))
        rightbutton.contentMode = .left
        rightbutton.setImage(UIImage(systemName: "arrow.backward.circle.fill"), for: .normal)
        rightbutton.tintColor = .label
        rightbutton.addTarget(self, action:#selector(DidTapBack(_:)), for: .touchUpInside)
        let rightBarButton:UIBarButtonItem = UIBarButtonItem(customView:rightbutton)
        self.navigationItem.leftBarButtonItem = rightBarButton
    }
    func DelData(){
        //register
        firstCv.register(UINib(nibName: "FirstCell", bundle: nil), forCellWithReuseIdentifier: "FirstCell")
        secondCv.register(UINib(nibName: "SecondCell", bundle: nil), forCellWithReuseIdentifier: "SecondCell")
        thirdCv.register(UINib(nibName: "ThirdCell", bundle: nil), forCellWithReuseIdentifier: "ThirdCell")
        fourthCv.register(UINib(nibName: "FourthCell", bundle: nil), forCellWithReuseIdentifier: "FourthCell")
        //Delegate
        firstCv.delegate = self
        secondCv.delegate = self
        thirdCv.delegate = self
        fourthCv.delegate = self
        //-----
        firstCv.dataSource = self
        fourthCv.dataSource = self
        secondCv.dataSource = self
        thirdCv.dataSource = self
    }
    //MARK: - objc func
    //---------------
    @objc func DidTapBack(_ sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - extension
//-----------------
extension MatchTeamInfoVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCv{
            return  firstTeamData?["4"]?.players?.count ?? 0
        }else if collectionView == secondCv{
            return secondTeamData?["5"]?.players?.count ?? 0
        }else if collectionView == thirdCv{
            return  sFirstTeamData?["6"]?.players?.count ?? 0
        }else{
            return sSecondTeamData?["7"]?.players?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCv{
            let firstC = firstCv.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! FirstCell
            firstC.fullName.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.nameFull ?? ""
            if firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.iscaptain == true{
                firstC.innerView.backgroundColor = .red
               
            }
            //Bating
            //------
            firstC.styleLbl.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.batting?.style?.rawValue
            firstC.avgrateLbl.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.batting?.average ?? ""
            firstC.strikeRateLbl.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.batting?.strikerate ?? ""
            firstC.runnLbl.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.batting?.runs ?? ""
            //Bowling
            //-----
            firstC.styleBowldLbl.text =  firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.bowling?.style ?? ""
            firstC.avgrateBowlLbl.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.bowling?.average ?? ""
            firstC.economyRateLbl.text = firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.bowling?.economyrate ?? ""
            firstC.wicketLbl.text =  firstTeamData?["4"]?.players?[indiateamkeys[indexPath.row]]?.bowling?.wickets ?? ""
            firstC.innerView.layer.cornerRadius = 12
            firstC.impView.roundCorners(.topRight, radius: 12)
            return firstC
        }else if collectionView == secondCv{
            let secondC = secondCv.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath) as! SecondCell
            secondC.fullName.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.nameFull ?? ""
            if secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.iscaptain == true{
                secondC.innerView.backgroundColor = .red
            }
            //BAtting
            //------
            secondC.styleLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.batting?.style?.rawValue
            secondC.avgrateLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.batting?.average ?? ""
            secondC.strikeRateLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.batting?.strikerate ?? ""
            secondC.runnLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.batting?.runs ?? ""
            //Bowling
            //-------
            secondC.styleBowldLbl.text =  secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.bowling?.style ?? ""
            secondC.avgrateBowlLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.bowling?.average ?? ""
            secondC.economyRateLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.bowling?.economyrate ?? ""
            secondC.wicketLbl.text = secondTeamData?["5"]?.players?[newzteamkeys[indexPath.row]]?.bowling?.wickets ?? ""
            secondC.innerView.layer.cornerRadius = 12
            secondC.impView.roundCorners(.topRight, radius: 12)
            return secondC
        }else if collectionView == thirdCv{
            let thirdC = thirdCv.dequeueReusableCell(withReuseIdentifier: "ThirdCell", for: indexPath) as! ThirdCell
            thirdC.fullName.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.nameFull ?? ""
            if sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.iscaptain == true{
                thirdC.innerView.backgroundColor = .red
            }
            //BAting
            //------
            thirdC.styleLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.batting?.style?.rawValue
            thirdC.avgrateLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.batting?.average
            thirdC.strikeRateLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.batting?.strikerate ?? ""
            thirdC.runnLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.batting?.runs ?? ""
            //Bowling
            //-------
                thirdC.styleBowldLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.bowling?.style ?? ""
                thirdC.avgrateBowlLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.bowling?.average ?? ""
                thirdC.economyRateLbl.text = sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.bowling?.economyrate ?? ""
                thirdC.wicketLbl.text =  sFirstTeamData?["6"]?.players?[pakteamkeys[indexPath.row]]?.bowling?.wickets ?? ""
            thirdC.innerView.layer.cornerRadius = 12
            thirdC.impView.roundCorners(.topRight, radius: 12)
            return thirdC
        }else{
            let fourthC = fourthCv.dequeueReusableCell(withReuseIdentifier: "FourthCell", for: indexPath) as! FourthCell
            fourthC.fullName.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.nameFull ?? ""
            if sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.iscaptain == true{
                fourthC.innerView.backgroundColor = .red
                
            }
            //Bating
            //-----
            fourthC.styleLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.batting?.style?.rawValue
            fourthC.avgrateLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.batting?.average ?? ""
            fourthC.strikeRateLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.batting?.strikerate ?? ""
            fourthC.runnLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.batting?.runs ?? ""
            //Bowling
            //------
                fourthC.styleBowldLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.bowling?.style ?? ""
                fourthC.avgrateBowlLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.bowling?.average ?? ""
                fourthC.economyRateLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.bowling?.economyrate ?? ""
                fourthC.wicketLbl.text = sSecondTeamData?["7"]?.players?[southafrickeys[indexPath.row]]?.bowling?.wickets ?? ""
                fourthC.innerView.layer.cornerRadius = 12
            fourthC.impView.roundCorners(.topRight, radius: 12)
            return fourthC
        }
    }
    //Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCv{
            
        }else if collectionView == secondCv{
            
        }else if collectionView == thirdCv{
            
        }else{
            
        }
    }
    //DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == firstCv{
            return CGSize(width:Double((firstCv.frame.width-5))/2, height:Double((firstCv.frame.height)))
        }else if collectionView == secondCv{
            return CGSize(width:Double((secondCv.frame.width-5))/2, height:Double((secondCv.frame.height)))
        }else if collectionView == thirdCv{
            return CGSize(width:Double((thirdCv.frame.width-5))/2, height:Double((thirdCv.frame.height)))
        }else{
            return CGSize(width:Double((fourthCv.frame.width-5))/2, height:Double((fourthCv.frame.height)))
        }
    }
}
//MARK: - UIViewExtension
//-----------------------
extension UIView{
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
