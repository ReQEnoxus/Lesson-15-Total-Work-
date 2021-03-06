//
//  RealmManager.swift
//  AnimationsTest
//
//  Created by Enoxus on 26.04.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol RealmManager {
    
    /// registers an observer that gets notified everytime the realm updates
    /// - Parameter onUpdate: action to perform when notification received, accepts deletions, insertions and modifications indices as params
    func observe(onUpdate: @escaping ([Int], [Int], [Int]) -> Void)
    
    /// gets all heroes from the realm
    func getAll(completion: @escaping ([HeroDto]) -> Void)
    
    /// delete an individual hero from the realm
    /// - Parameter primaryKey: id of the hero
    func delete(by primaryKey: Int)
    
    /// save array of heroes to the realm
    /// - Parameter models: modelds to be saved
    /// - Parameter completion: completion that is called once data is saved
    func saveBatch(_ models: [Hero], completion: @escaping () -> Void)
    
    /// extract an object, change its name and save it again
    /// - Parameters:
    ///   - primaryKey: primary key of the object
    ///   - name: new name
    func renameObject(with primaryKey: Int, new name: String)
    
    /// tells realm manager to attach given image to the model with given primary key
    /// - Parameters:
    ///   - imageData: image as binary data
    ///   - primaryKey: primary key of the model
    func saveImage(imageData: Data, primaryKey: Int)
}
