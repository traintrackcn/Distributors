//
//  DARecentChatsViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAConversationsViewController.h"
#import "DADefine.h"
#import "DATextDefine.h"
#import "DAStyleDefine.h"
#import "DSImage.h"
#import "DAConversationCell.h"
#import "DASearchCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAConversationViewController.h"

#import "RTCICEServer.h"
#import "RTCSessionDescriptionDelegate.h"
#import "RTCPeerConnectionFactory.h"
#import "RTCMediaStream.h"
#import <AVFoundation/AVFoundation.h>
#import "RTCVideoCapturer.h"
#import "RTCPeerConnection.h"
#import "RTCMediaConstraints.h"
#import "RTCPair.h"
#import "RTCEAGLVideoView.h"
#import "RTCVideoRenderer.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionItem,
    SectionCount
};

@interface DAConversationsViewController()<RTCSessionDescriptionDelegate, RTCPeerConnectionDelegate>{
    
}


@property (nonatomic, strong) UIBarButtonItem *addButtonItem;


@property (nonatomic, strong) RTCPeerConnection *peerConnection;
@property (nonatomic, strong) RTCPeerConnectionFactory *peerConnectionFactory;
@property (nonatomic, strong) RTCMediaStream *localMediaStream;
@property (nonatomic, strong) RTCAudioTrack *audioTrack;
@property (nonatomic, strong) RTCVideoTrack *frontCameraVideoTrack;
@property (nonatomic, strong) AVCaptureDevice *frontCamera;

@end

@implementation DAConversationsViewController



- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_CHAT]];
        [self.config setCellCls:[DASearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DAConversationCell class] inSection:SectionItem];
        
        [self initWebRTC];
    }
    return self;
}

- (void)initWebRTC{
    // Enable SSL globally for WebRTC in our app
//    [RTCPeerConnectionFactory initializeSSL];
    [self.localMediaStream addAudioTrack:self.audioTrack];
//    [self.localMediaStream addVideoTrack:self.frontCameraVideoTrack];
//    [self.peerConnection addStream:self.localMediaStream];
}



- (void)createOffer{
    RTCMediaConstraints *constraints = [[RTCMediaConstraints alloc] initWithMandatoryConstraints:
    @[
      [[RTCPair alloc] initWithKey:@"OfferToReceiveAudio" value:@"true"],
      [[RTCPair alloc] initWithKey:@"OfferToReceiveVideo" value:@"true"]
      ]
optionalConstraints: nil];
    
    [self.peerConnection createOfferWithDelegate:self constraints:constraints];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setRightBarButtonItem:self.addButtonItem];
}


#pragma mark - interactive ops

- (void)didTapAdd:(id)sender{
    
}



#pragma mark - table datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionSearch) return 1;
    if (section == SectionItem) return 3;
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    
    if (section == SectionItem) {
        DAConversationViewController *vc = [DAConversationViewController instance];
        [self pushViewController:vc];
    }
}

#pragma mark - components

- (UIBarButtonItem *)addButtonItem{
    if (!_addButtonItem) {
        _addButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconAdd"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapAdd:)];
    }
    return _addButtonItem;
}


#pragma mark - webrtc properties

- (RTCPeerConnection *)peerConnection{
    if (!_peerConnection) {
        // Create the peer connection using the ICE server list and the current class as the delegate
        NSURL *uri = [NSURL URLWithString:@"YOUR_SERVER"];
        RTCICEServer *iceServer = [[RTCICEServer alloc] initWithURI:uri username:@"" password:@""];
        NSArray *iceServers = @[iceServer];
        _peerConnection = [self.peerConnectionFactory peerConnectionWithICEServers:iceServers
                                                                       constraints:nil delegate:self];
    }
    
    return _peerConnection;
}

- (RTCPeerConnectionFactory *)peerConnectionFactory{
    if (!_peerConnectionFactory) {
        _peerConnectionFactory = [[RTCPeerConnectionFactory alloc] init];
    }
    return _peerConnectionFactory;
}

- (RTCMediaStream *)localMediaStream{
    if (!_localMediaStream) {
        //create media stream
        _localMediaStream = [self.peerConnectionFactory mediaStreamWithLabel:@"someUniqueStreamLabel"];
    }
    return _localMediaStream;
}

- (RTCAudioTrack *)audioTrack{
    if (!_audioTrack) {
        _audioTrack = [self.peerConnectionFactory audioTrackWithID:@"audio0"];
    }
    return _audioTrack;
}

- (RTCVideoTrack *)frontCameraVideoTrack{
    if (!_frontCameraVideoTrack) {
        AVCaptureDevice *device = self.frontCamera;
        if (device) {
            NSString *videoId = @"";
            RTCVideoCapturer *capturer = [RTCVideoCapturer capturerWithDeviceName:device.localizedName];
            RTCVideoSource *videoSource = [self.peerConnectionFactory videoSourceWithCapturer:capturer constraints:nil];
            _frontCameraVideoTrack = [self.peerConnectionFactory videoTrackWithID:videoId source:videoSource];
        }
    }
    return _frontCameraVideoTrack;
}

- (AVCaptureDevice *)frontCamera{
    if (!_frontCamera) {
        for (AVCaptureDevice *captureDevice in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] ) {
            if (captureDevice.position == AVCaptureDevicePositionFront) {
                _frontCamera = captureDevice;
                break;
            }
        }
    }
    return _frontCamera;
}

#pragma mark - RTCSessionDescriptionDelegate

- (void)peerConnection:(RTCPeerConnection *)peerConnection didCreateSessionDescription:(RTCSessionDescription *)sdp error:(NSError *)error{
    
}

- (void)peerConnection:(RTCPeerConnection *)peerConnection didSetSessionDescriptionWithError:(NSError *)error{
    if (peerConnection.signalingState == RTCSignalingHaveLocalOffer) {
        // Send offer through the signaling channel of our application
    }
}

#pragma mark - RTCPeerConnectionDelegate

- (void)peerConnection:(RTCPeerConnection *)peerConnection gotICECandidate:(RTCICECandidate *)candidate{
    
}

- (void)peerConnection:(RTCPeerConnection *)peerConnection addedStream:(RTCMediaStream *)stream{
    // Create a new render view with a size of your choice
//    RTCEAGLVideoView *renderView = [[RTCEAGLVideoView alloc] initWithFrame:CGRectMake(100, 100)];
//    [stream.videoTracks.lastObject addRenderer:renderView];
}

@end
