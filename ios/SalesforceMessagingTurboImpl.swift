  //
  //  SalesforceMessagingTurboImpl.swift
  //  SalesforceMessagingTurbo
  //
  //  Created by Alex on 20/4/2025.
  //
import SMIClientUI
import SMIClientCore
import Foundation
@objc public class SalesforceMessagingTurboImpl : NSObject {
  var config : UIConfiguration?
  var preChatData : Dictionary<String, String> = [:]
  @objc public func configureMessagingService(serviceAPIUrl: String?, organizationId: String, developerName: String)  -> String? {
    guard let serviceURL = URL(string: serviceAPIUrl ?? "") else {
      return nil
    }
    let conversationID = UUID()
    config = UIConfiguration(serviceAPI: serviceURL,
                             organizationId: organizationId,
                             developerName: developerName,
                             conversationId: conversationID)
    return conversationID.uuidString
  }
  
  @objc public func openChatPage(){
    
    guard let config else {
      return
    }
    DispatchQueue.main.async {
      let chatVC = ModalInterfaceViewController(config)
      chatVC.modalPresentationStyle = .popover
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
         let window = windowScene.windows.first,
         let rootViewController = window.rootViewController {
        rootViewController.present(chatVC, animated: true, completion: nil)
      } else {
        NSLog("Failed to find top view controller to present SFSafariViewController")
      }
    }
  }
  
  @objc public func setPreChatData(data: Dictionary<String, String>){
    preChatData = data
  }
  
}
