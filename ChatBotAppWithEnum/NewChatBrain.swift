//
//  NewChatBrain.swift
//  ChatBotAppWithEnum
//
//  Created by Manoj Kumar on 18/01/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import Foundation
import UIKit

enum UserInputTypes {
    case suggestion
    case textField
}

enum ChatMessageType {
    case hi
    case userHi
    case hello
    case intro
    case signin
    case signup
    case signinEmail
    case signinPassword
    case none
    
    func getSuggestions() -> [ChatMessageType]{
        switch self {
        case .hi:
            return [.userHi, .hello]
        case .intro:
            return [.signin, .signup]
        default :
            return []
        }
    }
    
    func getBotResponse() -> ChatMessageType {
        switch self {
        case .userHi, .hello:
            return .intro
        case .signin:
            return .signinEmail
        default:
            return .none
        }
    }
    
    func getChatText() -> String {
        switch self {
        case .hi :
            return "Hi"
        case .userHi :
            return "Hi"
        case .hello :
            return "Hello"
        case .intro :
            return "I am here to assist you with onboarding. Would you like to signin or signup?"
        case .signin :
            return "Signin"
        case .signup :
            return "Signup"
        case .signinEmail :
            return "Enter your email"
        default :
            return ""
            
        }
    }
    
    func getUserInputType() -> UserInputTypes {
        switch self {
        case .signinEmail:
            return .textField
        default :
            return .suggestion
        }
    }
    
    func getKeyboardType() -> UIKeyboardType {
        switch self {
        case .signinEmail:
            return .emailAddress
        default:
            return .default
        }
    }
}
