//
//  main.swift
//  SQCApp
//
//  Created by XinJinquan on 2016/1/13.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import Foundation

enum NotHuman:ErrorType
{
    case LessThanZero
}


func inVaildAge(age: Int) throws ->String {

    if age < 100 {
        throw NotHuman.LessThanZero
    }
    
    return "Human"
}

do {
    let type = try inVaildAge(-1)
    print("vaildAge is \(type)")
} catch {
    print(error)
}

let type = try? inVaildAge(1)
print(type)