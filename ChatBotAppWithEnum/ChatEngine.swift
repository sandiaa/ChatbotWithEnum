//
//  ChatEngine.swift
//  ChatBotApp
//
//  Created by Admin on 07/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ChatEngineDelegate:class {
//    func showSuggestions(suggestions:[Chat])
//    func showKeyboard(type : UserResponseTypes, suggestions: [Chat])
//    func didAddNewChat()
}

enum ChatType {
    case bot
    case user
}

class ChatEngine {
    
    weak var delegate:ChatEngineDelegate?
    
//    var chatHistory = [Chat]()
//    var brain = ChatBrain()
//
//    func startOnboarding() {
//
//            let message = Chat(index: getNextIndex(), responseType: .suggestion, chatMessage: .hi
//                , image: nil, chatType: .bot)
//            chatHistory.append(message)
//        let newSuggestions  = getResponsesFromUser()
//            delegate?.showSuggestions(suggestions: newSuggestions)
//
//    }
//    func askQuestionToUser() {
//           let text = chatHistory.last?.chatMessage
//        let chatMessage = brain.getBotResponse(text: text!)
//        let message = Chat(index: getNextIndex(), responseType:brain.getTextEntry(text: chatMessage) , chatMessage: chatMessage, image: nil, chatType: .bot)
//           chatHistory.append(message)
//            delegate?.didAddNewChat()
//
//
//        let newSuggestions  = getResponsesFromUser()
//        if newSuggestions[0].responseType == .suggestion {
//            delegate?.showSuggestions(suggestions: newSuggestions)
//        }
//        else if newSuggestions[0].responseType == .name {
//            delegate?.showKeyboard(type : .name, suggestions: newSuggestions)
//        }
//        else if newSuggestions[0].responseType == .email {
//            delegate?.showKeyboard(type : .email, suggestions: newSuggestions)
//        }
//        else if newSuggestions[0].responseType == .password {
//            delegate?.showKeyboard(type : .password, suggestions: newSuggestions)
//        }
//    }
//
//
//    func getNextIndex()->Int {
//        if let lastChat = chatHistory.last {
//            return lastChat.index+1
//        }
//        else {
//            return 0
//        }
//    }
//
//    func getResponsesFromUser()->[Chat] {
//        var suggestionMessage = [Chat]()
//         let text = chatHistory[getNextIndex()-1].chatMessage
//         let array =  brain.getSuggestions(text: text)
//        if array != [] {
//        for i in array {
//         let   mes = Chat(index: getNextIndex(), responseType: .suggestion, chatMessage: i, image: nil, chatType: .user)
//            suggestionMessage.append(mes)
//        }
//       return suggestionMessage
//    }
//       let resType = brain.getTextEntry(text: text)
//      var  mes = Chat(index: getNextIndex(), responseType: resType, chatMessage: .userText, image: nil, chatType: .user)
//        suggestionMessage.append(mes)
//        return suggestionMessage
//    }
//
//    func newSuggestionSelected(suggestion:Chat) {
//        chatHistory.append(suggestion)
//        delegate?.didAddNewChat()
//    }
//
//    func userEnteredText(text : String, suggestion:Chat){
//
//        chatHistory.append(suggestion)
//        delegate?.didAddNewChat()
//        askQuestionToUser()
//
//    }
}


//struct Chat {
//    let index:Int
//    let responseType : UserResponseTypes
//    var chatMessage : BotResponse
//    let image:UIImage?
//    let chatType: ChatType
//
//}


  


