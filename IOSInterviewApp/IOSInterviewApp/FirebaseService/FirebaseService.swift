//
//  FirebaseService.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 01.09.2021.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseService {
    
    // MARK: - Registration
    
    func register(name: String, email: String, password: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    if let signedUser = Auth.auth().currentUser {
                        
                        let request = signedUser.createProfileChangeRequest()
                        request.displayName = name
                        
                        request.commitChanges { (error) in
                            if let e = error {
                                completion(.failure(e))
                            } else {
                                let newUser = UserData(uid: signedUser.uid, name: name, email: email, password: password)
                                print(newUser)
                                
                                self.saveUser(user: newUser) { result in
                                    switch result {
                                    case .success(_):
                                        completion(.success(newUser))
                                    case .failure(let error):
                                        completion(.failure(error))
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                completion(.failure(error!))
            }
        }
        
    }
    
    // MARK: - User load/save methods with specific collection
    
    private func saveUser(user: UserData, completion: @escaping (Result<Bool, Error>) -> Void) {
        let collection = Firestore.firestore().collection("users")
        let doc = collection.document(user.uid)
        do {
            try doc.setData(from: user) { (error) in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    private func loadUser(uid: String, email: String, password: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        let collection = Firestore.firestore().collection("users")
        let docRef = collection.document(uid)
        docRef.getDocument { (snapshot, error) in
            if let snapshot = snapshot {
                if let user = try? snapshot.data(as: UserData.self) {
                    completion(.success(user))
                }
            } else {
                if let error = error {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - Log out
    func logOut() {
        try? Auth.auth().signOut()
    }
    
    func isAuthorized() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func login(email: String, password: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let signedUser = Auth.auth().currentUser
                if let uid = signedUser?.uid {
                    self.loadUser(uid: uid, email: email, password: password) { (result) in
                        switch result {
                        case .failure(let error):
                            completion(.failure(error))
                        case .success(let userData):
                            completion(.success(userData))
                        }
                    }
                }
            }
        }
    }
    
}
