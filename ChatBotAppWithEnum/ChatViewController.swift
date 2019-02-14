//
//  ChatViewController.swift
//  ChatBotApp
//
//  Created by Admin on 07/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AllSuggestionsCellDelegate , UITextFieldDelegate{
    @IBOutlet weak var lcChatBottomSpace: NSLayoutConstraint!
    @IBOutlet weak var chatCollectionView: UICollectionView!
    @IBOutlet weak var messageInputContainerView: UIView!
    @IBOutlet weak var inputTextField: UITextField!

    let chatEngine = ChatEngine()
    
    var isShowingSuggestions = false
    
    var userEmail:String = ""
    
    var currentInputTextType = UserResponseTypes.none

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.layer.cornerRadius = 15
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.layer.borderWidth = 1.0
        inputTextField.returnKeyType = .done
        
        chatEngine.delegate = self
//        chatEngine.startOnboarding()
        setupChatCollectionView()
        inputTextField.delegate = self
        let viewHeight = UIScreen.main.bounds.height
        messageInputContainerView.frame = CGRect(x: 0, y:viewHeight+100 , width: UIScreen.main.bounds.width, height:50)
        view.addSubview(messageInputContainerView)
      
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    func observeKeyboard() {
      tapOutside()
    }
    
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        let endFrame = ((notification as NSNotification).userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        if endFrame.origin.y == UIScreen.main.bounds.height {//Keyboard is hidden
            lcChatBottomSpace.constant = 0
        }
        else {//Keyboard is visible
            lcChatBottomSpace.constant = endFrame.height + 100
            
        }
        view.layoutIfNeeded()
    }
    
    
    
    @objc func loadChat() {
        chatEngine.askQuestionToUser()
        setupChatCollectionView()
    }
    
    func setupChatCollectionView() {
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        
        chatCollectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "UserCell")
        chatCollectionView.register(UINib(nibName: "BotCell", bundle: nil), forCellWithReuseIdentifier: "BotCell")
        chatCollectionView.register(UINib(nibName: "AllSuggestionsCell", bundle: nil), forCellWithReuseIdentifier: "AllSuggestionsCell")
        
        let springLayout = SpringyFlowLayout()
        springLayout.scrollDirection = .vertical
        springLayout.minimumLineSpacing = 10
        springLayout.minimumInteritemSpacing = 10
        springLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        chatCollectionView.setCollectionViewLayout(springLayout, animated: false)
        springLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        var numberOfItems = chatEngine.chatHistory.count
//        if isShowingSuggestions {
//            numberOfItems += 1
//        }
//        return numberOfItems
        
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if self.isShowingSuggestions && indexPath.row == chatEngine.chatHistory.count {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllSuggestionsCell", for: indexPath) as! AllSuggestionsCell
//            cell.delegate = self
//            cell.populateWith(userSuggestions: userSuggestions)
//            return cell
//        }
//        else {
//            let chat = chatEngine.chatHistory[indexPath.row]
//            if chat.chatType == .user {
//                let cell = chatCollectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCell
//                cell.populateWith(chat: chat)
//                return cell
//            }
//            else {
                let cell = chatCollectionView.dequeueReusableCell(withReuseIdentifier: "BotCell", for: indexPath) as! BotCell
//                cell.populateWith(chat: chat)
                return cell
//            }
//        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.isShowingSuggestions && indexPath.row == chatEngine.chatHistory.count {
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 80)
        }
        else {
                let chat = chatEngine.chatHistory[indexPath.row]
                let str = chat.chatMessage
                
                let lbl = UILabel()
                lbl.text = str.rawValue
                lbl.numberOfLines = 0
                lbl.font = UIFont.systemFont(ofSize: 17)
                
                let size = lbl.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 130, height: CGFloat.infinity))
                return CGSize(width:UIScreen.main.bounds.width, height: max(size.height + 20, 50))
        }
    }
    
    func didSelectSuggestion(suggestion: Chat) {
//        DispatchQueue.main.async {
//
//            self.latestSuggestion = suggestion
//            (self.chatCollectionView.collectionViewLayout as! SpringyFlowLayout).dynamicAnimator = nil
//            let newIndexPath = IndexPath(row: self.chatEngine.chatHistory.count, section: 0)
//            self.isShowingSuggestions = false
//            self.chatCollectionView.performBatchUpdates({
//                self.chatCollectionView.deleteItems(at: [newIndexPath])
//            }) { (finished) in
//
//            }
//            self.newSuggestionAdded()
////            self.perform(#selector(self.newSuggestionAdded), with: suggestion, afterDelay: 1.0)
//        }
    }
    
    @objc func newSuggestionAdded() {
        guard let latestSuggestion = latestSuggestion else { return }
//
//        self.chatEngine.newSuggestionSelected(suggestion: latestSuggestion)
//        self.perform(#selector(self.loadChat), with: nil, afterDelay: 2.0)
//        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
//            self.lcChatBottomSpace.constant = 0
//            self.view.layoutIfNeeded()
//
//        }) { (finished) in
//        }
    }
//    @objc func keyboardWillChange(notification : NSNotification){
//        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//        }
//        if notification.name == UIResponder.keyboardWillShowNotification  {
//            view.frame.origin.y = -keyboardSize.height
//        }
//        else {
//            view.frame.origin.y = 0
//        }
//    }
    
    func tapOutside() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    @objc func handleTap(){
        inputTextField.resignFirstResponder()
        
        }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        let text = inputTextField.text ?? ""

        switch currentInputTextType {
        case .name://name
            let tuple = verifyName(name: text)
            if !tuple.0  {//invalid name
      
                let chat = Chat(index: chatEngine.getNextIndex(), responseType: .none , chatMessage: .SpecialCharactersNotAllowed, image: nil, chatType: .bot)
                chatEngine.chatHistory.append(chat)
                
                didAddNewChat()
                
                showKeyboard(type: .name, suggestions: storedChat)

            }
            else {//name verified
                 inputTextField.text = ""
                UserDefaults.standard.set(text, forKey: "name")
                
                didAddNewChat()
            
            }
            break

        default://.none
            break
        }
          inputTextField.resignFirstResponder()
        return true
    }

    func verifyName(name:String) -> (Bool,BotResponse) {


     //   return (false, .SpecialCharactersNotAllowed)
        return (true, .name)
    }
}


extension ChatViewController: ChatEngineDelegate{

    
    func showKeyboard(type: UserResponseTypes,suggestions: [Chat]) {
        isShowingSuggestions = false
        observeKeyboard()
        
        currentInputTextType = type
        storedChat = suggestions
        if type == .email {
            inputTextField.keyboardType = .emailAddress
        }
        else if type == .name {
            inputTextField.keyboardType = .default
        }
        
        inputTextField.becomeFirstResponder()
    }
    
    
    

    func showSuggestions(suggestions: [Chat]) {
        
        isShowingSuggestions = true
        userSuggestions = suggestions
        chatCollectionView.reloadData()
    }
    
    func didAddNewChat() {
////        if chatEngine.chatHistory[chatEngine.chatHistory.count-1].chatMessage != "" {
//        let newIndexPath = IndexPath(row: chatEngine.chatHistory.count-1, section: 0)
//        (self.chatCollectionView.collectionViewLayout as! SpringyFlowLayout).dynamicAnimator = nil
//        
//        chatCollectionView.performBatchUpdates({
//            self.chatCollectionView.insertItems(at: [newIndexPath])
//        }) { (finished) in
//            self.chatCollectionView.scrollToItem(at: newIndexPath, at: .bottom, animated: true)
//        }
    }
//    }
  
}
