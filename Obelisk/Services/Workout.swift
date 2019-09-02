//
//  Workout.swift
//  Obelisk
//
//  Created by Nick Huang on 8/7/19.
//  Copyright © 2019 Nick Huang. All rights reserved.
//

import Foundation
import os.log


class Workout: NSObject, NSCoding {
    
    var name: String?
    var muscles: String?
    var exercises: [String]?
    
    init(name_in: String, muscles_in: String, exercises_in: [String]) {
        name = name_in
        muscles = muscles_in
        exercises = exercises_in
    }
    
    //-------------------------------Data Persistence-------------------------------//
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("workouts")
    
    struct WorkoutKey {
        static let name = "name"
        static let muscles = "muscles"
        static let exercises = "exercises"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: WorkoutKey.name)
        aCoder.encode(muscles, forKey: WorkoutKey.muscles)
        aCoder.encode(exercises, forKey: WorkoutKey.exercises)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: WorkoutKey.name) as? String else {
            os_log("Unable to decode the name for a workout.", log: OSLog.default, type: .debug)
            return nil
        }
        let muscles = aDecoder.decodeObject(forKey: WorkoutKey.muscles) as? String
        let exercises = aDecoder.decodeObject(forKey: WorkoutKey.exercises) as? [String]
        
        self.init(name_in: name, muscles_in: muscles!, exercises_in : exercises!)
    }

}
