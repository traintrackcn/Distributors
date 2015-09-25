//
//  DAChatCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 9/10/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAChatCoordinator.h"
#import <LayerKit/LayerKit.h>
#import "GlobalDefine.h"
#import "AGRemoteUnit.h"

@interface DAChatCoordinator(){
    
}

@property (nonatomic, strong) LYRClient *layerClient;
@property (nonatomic, strong) AGRemoteUnit *rUnitForToken;

@end

@implementation DAChatCoordinator

- (void)initLayer{
//    NSURL *appID = [NSURL URLWithString:@"layer:///apps/staging/5283ee4a-4ab5-11e5-be11-919090090683"];
//    self.layerClient = [LYRClient clientWithAppID:appID];
    TLOG(@"layer is connecting ...");
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self connectToLayer];
    }
    return self;
}


#pragma mark - remote ops

- (void)connectToLayer{
    [self.layerClient connectWithCompletion:^(BOOL success, NSError *error) {
        //        TLOG(@"layer connect %d", success);
        if (success) {
            NSLog(@"Client is Connected!");
            
            // For the purposes of this Quick Start project, let's authenticate as a user named 'Device'.  Alternatively, you can authenticate as a user named 'Simulator' if you're running on a Simulator.
            //            NSString *userIDString = @"Device";
            //            // Once connected, authenticate user.
            //            // Check Authenticate step for authenticateLayerWithUserID source
            //            [self authenticateLayerWithUserID:userIDString completion:^(BOOL success, NSError *error) {
            //                if (!success) {
            //                    NSLog(@"Failed Authenticating Layer Client with error:%@", error);
            //                }
            //            }];
            
            
//            [self.layerClient requestAuthenticationNonceWithCompletion:^(NSString *nonce, NSError *error) {
//                TLOG(@"nonce -> %@", nonce);
//            }];
            
//            [self.layerClient authenticateWithIdentityToken:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImN0eSI6ImxheWVyLWVpdDt2PTEiLCJraWQiOiJsYXllcjovLy9rZXlzLzVhZjhlNzg2LTViNzQtMTFlNS05OTU4LWU5OTc5ZjAwN2ZjNSJ9.eyJpc3MiOiJsYXllcjovLy9wcm92aWRlcnMvZGY5MTkxOWMtNWFjNC0xMWU1LWI5MzAtMTVkYTJhMDAyOTliIiwicHJuIjoiMTIzNDU2IiwiaWF0IjoxNDQyMzEwMzMyLCJleHAiOjE0NDIzMjAzMzIsIm5jZSI6ImYyQjBhdDZQbEt3TWxReGswNlgyV3kzV29LVnVrRHk5T3ZFMjVHU3M0OFdCVURLblVWbHAzTmQwcjNCVmFBeHBwczIwejZrNVQ5cXBwUXgvd0xhdml3PT0ifQ.UWMG619zUVUaq3lXJXGVjoSNoAupes_3V-qBZj0iX9W_RB1BfA12SS9fcSUMGMVBMbCMNkOwf5WY-amYqEwtOMVXdUwnToke3u02930PAao6bvAB1Rudxzo1g08wrr1gonvuHfETR0WdR_AdCQaMSI-qnidQDevNe1hMfhzY72k" completion:^(NSString *authenticatedUserID, NSError *error) {
//                TLOG(@"authenticatedUserID -> %@ error -> %@", authenticatedUserID, error);
//                
//            }];
            
            [self authenticateLayerWithUserID:@"traintrackcn" completion:^(BOOL success, NSError *error) {
            
            }];
            
        }
    }];
}


- (void)authenticateLayerWithUserID:(NSString *)userID completion:(void (^)(BOOL success, NSError * error))completion
{
    if (self.layerClient.authenticatedUserID) {
        NSLog(@"Layer Authenticated as User %@", self.layerClient.authenticatedUserID);
        if (completion) completion(YES, nil);
        return;
    }
    
    // Authenticate with Layer
    // See "Quick Start - Authenticate" for more details
    // https://developer.layer.com/docs/quick-start/ios#authenticate
    
    /*
     * 1. Request an authentication Nonce from Layer
     */
    [self.layerClient requestAuthenticationNonceWithCompletion:^(NSString *nonce, NSError *error) {
        TLOG(@"nonce -> %@", nonce);
        if (!nonce) {
            if (completion) {
                completion(NO, error);
            }
            return;
        }
        
        /*
         * 2. Acquire identity Token from Layer Identity Service
         */
        
        [self requestIdentityTokenForUserID:userID appID:[self.layerClient.appID absoluteString] nonce:nonce completion:^(NSString *identityToken, NSError *error) {
            if (!identityToken) {
                if (completion) {
                    completion(NO, error);
                }
                return;
            }
            
            /*
             * 3. Submit identity token to Layer for validation
             */
            [self.layerClient authenticateWithIdentityToken:identityToken completion:^(NSString *authenticatedUserID, NSError *error) {
                if (authenticatedUserID) {
                    if (completion) {
                        completion(YES, nil);
                    }
                    TLOG(@"Layer Authenticated as User: %@", authenticatedUserID);
                } else {
                    completion(NO, error);
                }
            }];
        }];
    }];
}


- (void)requestIdentityTokenForUserID:(NSString *)userID appID:(NSString *)appID nonce:(NSString *)nonce completion:(void(^)(NSString *identityToken, NSError *error))completion
{
    
    NSMutableDictionary *requestBody = [NSMutableDictionary dictionary];
    [requestBody setValue:userID forKey:@"user_id"];
    [requestBody setValue:nonce forKey:@"nonce"];
    [self.rUnitForToken setRequestBody:requestBody];
    
    [self.rUnitForToken requestWithCompletion:^(id data, id error) {
//        TLOG(@"data -> %@ %@", [data class], data);
        NSString *identityToken = [data objectForKey:@"identity_token"];
        
        TLOG(@"identityToken -> %@", identityToken);
        
        [self.layerClient authenticateWithIdentityToken:identityToken completion:^(NSString *authenticatedUserID, NSError *error) {
            TLOG(@"authenticatedUserID -> %@", authenticatedUserID);
        }];
    }];
}


- (AGRemoteUnit *)rUnitForToken{
    if (!_rUnitForToken) {
        _rUnitForToken = [AGRemoteUnit instance];
        [_rUnitForToken setThirdPartyUrl:[NSURL URLWithString:@"http://localhost:3000/auth"]];
        [_rUnitForToken setMethod:AGRemoteUnitMethodPOST];
        
    }
    
    
    
    return _rUnitForToken;
}



#pragma mark - properties

- (LYRClient *)layerClient{
    if (!_layerClient) {
        NSURL *appID = [NSURL URLWithString:@"layer:///apps/staging/df92d1ec-5ac4-11e5-9ba6-15da2a00299b"];
        _layerClient = [LYRClient clientWithAppID:appID];
    }
    return _layerClient;
}

@end
