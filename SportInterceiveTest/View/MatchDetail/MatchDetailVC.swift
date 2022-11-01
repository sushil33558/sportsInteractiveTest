//
//  MatchDetailVC.swift
//  SportInterceiveTest
//
//  Created by Sushil Chaudhary on 10/27/22.
//
//-----------------------------------------------------------------------
import UIKit
class MatchDetailVC: UIViewController {
//MARK: - IBoutlet
//---------------
    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var bottomScrollView: UIScrollView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btmView: UIView!
    //---
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var venueIDLbl: UILabel!
    @IBOutlet weak var venuNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    //------
    @IBOutlet weak var sTeamNameLbl: UILabel!
    @IBOutlet weak var sVenueIDLbl: UILabel!
    @IBOutlet weak var sVenuNameLbl: UILabel!
    @IBOutlet weak var sDateLbl: UILabel!
    @IBOutlet weak var sTimeLbl: UILabel!
    //MARK: - variables
//---------------
    var viewModel = CricketMatchVM()
    //firstApiTeamData
    var firstTeamData : [String : Team]?
    var secondTeamData : [String : Team]?
    //SecondTeamData
    var sFirstTeamData : [String : Team]?
    var sSecondTeamData : [String : Team]?
    
//MARK: - lifeCycles
//---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.addTarget(self, action: #selector(DidTapNext(_:)), for: .touchUpInside)
        nextBtn.layer.cornerRadius = 12
        navigationItemS()
        topScrollView.layer.cornerRadius = 12
        bottomScrollView.layer.cornerRadius = 12
        topView.layer.cornerRadius = 12
        btmView.layer.cornerRadius = 12
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MatchD()
        MatchTeam()
    }
//MARK: - iBaction
//---------------
//MARK: - func
//---------------
    func navigationItemS() {
        self.navigationItem.title = "Match Detail"
        let rightbutton = UIButton(frame: CGRect(x:0.0 , y:0.0, width: 30, height: 30))
        rightbutton.contentMode = .right
        rightbutton.setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
        rightbutton.tintColor = .label
        rightbutton.addTarget(self, action:#selector(DidTapNext(_:)), for: .touchUpInside)
        let rightBarButton:UIBarButtonItem = UIBarButtonItem(customView:rightbutton)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    func MatchD(){
        viewModel.MatchDetailApi { (isSuccess, message) in
            if isSuccess{
                print("-------------Api is Succeed-----------------")
                self.teamNameLbl.text = self.viewModel.model?.matchdetail?.series?.name ?? ""
                self.dateLbl.text = self.viewModel.model?.matchdetail?.match?.date ?? ""
                self.timeLbl.text = self.viewModel.model?.matchdetail?.match?.time ?? ""
                self.venuNameLbl.text = self.viewModel.model?.matchdetail?.venue?.name ?? ""
                self.venueIDLbl.text = self.viewModel.model?.matchdetail?.venue?.id ?? ""
                self.firstTeamData = self.viewModel.model?.teams
                self.secondTeamData = self.viewModel.model?.teams
            }else{
                print("-------------Api not Succeed-----------------")
            }
        }
    }
    func MatchTeam(){
        viewModel.MatchTeamInfo { (isSuccess, message) in
            if isSuccess{
                print("-------------Api is Succeed-----------------")
                self.sTeamNameLbl.text = self.viewModel.modelOne?.matchdetail?.series?.name ?? ""
                self.sDateLbl.text = self.viewModel.modelOne?.matchdetail?.match?.date ?? ""
                self.sTimeLbl.text = self.viewModel.modelOne?.matchdetail?.match?.time ?? ""
                self.sVenuNameLbl.text = self.viewModel.modelOne?.matchdetail?.venue?.name ?? ""
                self.sVenueIDLbl.text = self.viewModel.modelOne?.matchdetail?.venue?.id ?? ""
                self.sFirstTeamData = self.viewModel.modelOne?.teams
                self.sSecondTeamData = self.viewModel.modelOne?.teams
            }else{
                print("-------------Api not Succeed-----------------")
            }
        }
    }
//MARK: - objc func
//---------------
    @objc func DidTapNext(_ sender:UIButton){
        let storyboard = UIStoryboard(name: "Support", bundle: nil)
        let matchTeamInfo = storyboard.instantiateViewController(identifier: "MatchInfo") as! MatchTeamInfoVC
        matchTeamInfo.firstTeamData = self.firstTeamData
        matchTeamInfo.secondTeamData = self.secondTeamData
        matchTeamInfo.sFirstTeamData = self.sFirstTeamData
        matchTeamInfo.sSecondTeamData = self.sSecondTeamData
        self.navigationController?.pushViewController(matchTeamInfo, animated: true)
    }
}
