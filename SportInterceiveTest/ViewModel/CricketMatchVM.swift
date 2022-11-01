//
//  CricketMatchVM.swift
//  SportInterceiveTest
//
//  Created by Sushil Chaudhary on 10/27/22.
//

import Foundation
import Alamofire
class CricketMatchVM:BaseAPI{
    //MARK: - Variable
    //----------------
    var model:CricketModel?
    var modelOne:CricketModel?
    //MARK: - ApiImplementAnd(JsonParse)
    //---------------------------------
    func MatchDetailApi(completion:@escaping(Bool,String)->()){
        super.hitApi(requests: Request(url: (URLS.baseUrl, APISuffix.indnewz), method: .get, headers: false)) { (recieved, message, response) in
            if response == 1{
                if let data = recieved as? [String:Any]{
                    do{
                        let jsonser = try JSONSerialization.data(withJSONObject: data, options:.prettyPrinted)
                        self.model = try JSONDecoder().decode(CricketModel.self, from: jsonser)
                        completion(true,message ?? "")
                    }catch{
                        print(error.localizedDescription)
                        completion(false,message ?? "")
                    }
                }else{
                    completion(false,message ?? "")
                }
            }else{
                completion(false,message ?? "")
            }
        }
    }
    //MARK: -
    func MatchTeamInfo(completion:@escaping(Bool,String)->()){
        super.hitApi(requests: Request(url: (URLS.baseUrl, APISuffix.pakAfric), method: .get, headers: false)) { (recieved, message, response) in
            if response == 1{
                if let data = recieved as? [String:Any]{
                    do{
                        let jsonser = try JSONSerialization.data(withJSONObject: data, options:.prettyPrinted)
                        self.modelOne = try JSONDecoder().decode(CricketModel.self, from: jsonser)
                        completion(true,message ?? "")
                    }catch{
                        print(error.localizedDescription)
                        completion(false,message ?? "")
                    }
                }else{
                    completion(false,message ?? "")
                }
            }else{
                completion(false,message ?? "")
            }
        }
    }
}
