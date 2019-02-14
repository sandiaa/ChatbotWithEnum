//
//  ChatBrain.swift
//  ChatBotApp
//
//  Created by Admin on 07/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ChatBrainDelegate : class{
    func getLastIndex()->String?
}
enum UserResponseTypes :String {
    case email
    case name
    case password
    case suggestion
    case none
}


enum BotResponse : String {
    case hi = "hi"
    case hello = "hello"
    case iamHereToAssistYou = "I am here to Assist You"
    case okay = "Okay"
    case doYouwantToSignuporSignin = "Do you want to login or signup"
    case signup = "signup"
    case signin = "signin"
    case enterYourName = "enter your name"
    case enterYourEmail = "enter your email"
    case enterYourPassword = "enter your password"
    case iCouldNotUnderstandYou = "I could not understand you"
    case userText
    case name
    case email
    case password
    case SpecialCharactersNotAllowed = "Special characters not allowed"
}
class ChatBrain {

    func getSuggestions(text : BotResponse)->[BotResponse] {
            switch text {
            case .hi:
                return [.hello]
            case .iamHereToAssistYou:
                return [.okay]
            case .doYouwantToSignuporSignin:
                return [.signup,.signin]
            default:
                return []
            }
        }
        
    func getBotResponse(text : BotResponse)-> BotResponse {
            switch text {
            case .hello:
                return .iamHereToAssistYou
            case .okay :
                return .doYouwantToSignuporSignin
            case .signup:
                return .enterYourName
            case .signin:
                return .enterYourEmail
            default:
                return .iCouldNotUnderstandYou
            }
        }

    func getTextEntry(text : BotResponse) -> UserResponseTypes {
            switch text {
            case .enterYourEmail:
                return .email
            case .enterYourName:
                return .name
            case .enterYourPassword:
                return .password
            default:
                return .suggestion
            }
        }
}

