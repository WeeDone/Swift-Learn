//
//  ViewController.swift
//  SQChatRomm
//
//  Created by XinJinquan on 2016/1/20.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    
    let serviceType = "Class-Chatroom1"
    var peerID :MCPeerID!
    var session:MCSession!
    var assistant: MCAdvertiserAssistant!
    var borwserViewController :MCBrowserViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        peerID = MCPeerID(displayName: "Sim")
        session =  MCSession(peer: peerID)
        session.delegate = self
        
        self.textView.textColor = UIColor.whiteColor()
        borwserViewController = MCBrowserViewController(serviceType: serviceType, session: session)
         assistant =  MCAdvertiserAssistant(serviceType: serviceType, discoveryInfo: nil, session: session)
        borwserViewController.delegate = self

       // assistant.start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController) {
        borwserViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController) {
        borwserViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    @available(iOS 7.0, *)
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        
    }
    
    // Received data from remote peer.
    @available(iOS 7.0, *)
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
     dispatch_async(dispatch_get_main_queue()) { () -> Void in
        if let msg = String(data: data, encoding:  NSUTF8StringEncoding ){
        
        self.updateChat(msg, fromPeer:peerID)
            }
        }
    }
    func updateChat(text:String, fromPeer:MCPeerID) {
        var name = String!()
        switch peerID {
        case self.peerID:
            name = "me"
        default: name = peerID.displayName

        }
        let message = "\(name):\(text)\n"
        self.textView.text = self.textView.text + message
    }
    // Received a byte stream from remote peer.
    @available(iOS 7.0, *)
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    // Start receiving a resource from remote peer.
    @available(iOS 7.0, *)
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        
    }
    
    // Finished receiving a resource from remote peer and saved the content
    // in a temporary location - the app is responsible for moving the file
    // to a permanent location within its sandbox.
    @available(iOS 7.0, *)
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        
    }
    
    // Made first contact with peer and have identity information about the
    // remote peer (certificate may be nil).
   

    @IBAction func sned(sender: AnyObject) {
        do {
        try session.sendData((self.textField.text?.dataUsingEncoding(NSUTF8StringEncoding))!, toPeers: session.connectedPeers, withMode:.Unreliable)
        } catch {
            print(error)
        }
        self.updateChat(self.textField.text!, fromPeer: peerID)
        self.textField.text! = ""
    }
    @IBAction func hostly(sender: AnyObject) {
        self.presentViewController(borwserViewController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

