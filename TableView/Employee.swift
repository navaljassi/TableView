//
//  Employee.swift
//  TableView
//
//  Created by Naval Jassi on 22/2/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import Foundation

class Employee: NSObject, NSCoding {
    
    struct Keys {
        static let FirstName = "firstName";
        static let LastName = "lastName";
    }
    
    private var _firstName = ""
    private var _lastName = ""
    
    override init() {}
        
    
    
    init(firstName: String, lastName: String){
        self._firstName = firstName;
        self._lastName = lastName;
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let firstNameObj = aDecoder.decodeObject(forKey: Keys.FirstName) as? String{
            _firstName = firstNameObj;
        }
        
        if let lastNameObj = aDecoder.decodeObject(forKey: Keys.LastName) as? String{
            _lastName = lastNameObj;
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_firstName, forKey: Keys.FirstName);
        aCoder.encode(_lastName, forKey: Keys.LastName);
    }
    
    var FirstName: String {
        get {
            return _firstName
        }
        set {
            _firstName = newValue
        }
    }
    
    var LastName: String {
        get {
            return _lastName;
        }
        set {
            _lastName = newValue;
        }
    }
    
}












