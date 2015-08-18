//
//  DALabConvertSpeechToTextViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/11/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DALabConvertSpeechToTextViewController.h"
#import "AGRemoteUnit.h"
#import "GlobalDefine.h"
#import "NSString+HTML.h"

@interface DALabConvertSpeechToTextViewController (){
    NSArray *sentences;
}

@property (nonatomic, strong) AGRemoteUnit *rUnit;

@end

@implementation DALabConvertSpeechToTextViewController


- (instancetype)init{
    self = [super init];
    if (self) {
        sentences = @[
                      @"Become a product of the product",
                      @"submit your testimonial within 48 hours",
                      @"set yourself up on the proper autoship",
                      @"pruchase 2 boxes of coffee (black & latte)",
                      @"build a list of contacts",
                      @"50 coffee drinkers",
                      @"50 opportuity seekers",
                      @"learn and use the 4 questions",
                      @"get customers now with the script",
                      @"book four coffee jazz mixers",
                      @"at your home, apartment, clubhouse or office",
                      @"plug into a proven success system",
                      @"18 month commitment to a proven system",
                      @"register for free at www.oguniversity.com",
                      @"ongoing weekyly cjm's",
                      @"bussiness and leadership events",
                      @"Opportunity and training calls",
                      ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self requestParser];
    [self doNLP];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - 

- (void)doNLP{
    NSString *sentence = @"What is the capital of New York";
//    sentence = @"buy 5 boxes black coffee";
//    sentence = @"Register for FREE at www.OGUniversity.com";
    
//    TLOG(@"NSLinguisticTagOther -> %@", NSLinguisticTagOther);
    NSLinguisticTaggerOptions options = NSLinguisticTaggerOmitWhitespace|NSLinguisticTaggerOmitPunctuation|NSLinguisticTaggerJoinNames;
    NSString *lang = @"en";
    NSArray *schemes = [NSLinguisticTagger availableTagSchemesForLanguage:lang];
    NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] initWithTagSchemes:schemes options:options];
    [tagger setString:sentence];
    [tagger enumerateTagsInRange:NSMakeRange(0, sentence.length) scheme:NSLinguisticTagSchemeNameTypeOrLexicalClass options:options usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
        NSString *token = [sentence substringWithRange:tokenRange];
        TLOG(@"%@ [%@] stop -> %d", token, tag, *stop);
    }];
    
    
}


#pragma mark - remote ops

- (void)requestParser{
    
    __weak DALabConvertSpeechToTextViewController *ws = self;
    [self.rUnit requestWithCompletion:^(id data, id error) {
        [ws requestParserCallback:data error:error];
    }];
}

- (void)requestParserCallback:(id)data error:(id)error{
    TLOG(@"data -> %@", data);
}

#pragma mark -


- (NSURL *)thirdPartyUrl{
    NSString *value = @"buy 5 coffee";
    NSMutableString *str = [NSMutableString stringWithString:@""];
    [str appendFormat:@"http://www.naturalparsing.com/api/parse"];
//    [str appendFormat:@"?format=json"];
//    [str appendFormat:@"&jsoncallback=%@",self.youtubePlaylistId];
    [str appendFormat:@"?input=%@",[value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [str appendFormat:@"&version=0.1"];
    [str appendFormat:@"&options=none"];
    TLOG(@"str -> %@", str);
    return [NSURL URLWithString:str];
}

- (AGRemoteUnit *)rUnit{
    if (!_rUnit) {
        _rUnit = [AGRemoteUnit instance];
        
    }
    
    [_rUnit setThirdPartyUrl:self.thirdPartyUrl];
    
    TLOG(@"_rUnit.thirdPartyUrl -> %@ %@", _rUnit.thirdPartyUrl, self.thirdPartyUrl);
    
    return _rUnit;
}

@end
