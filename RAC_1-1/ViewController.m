//
//  ViewController.m
//  RAC_1-1
//
//  Created by ccguo on 16/9/22.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ViewController.h"
//#import <rea>

@interface ViewController ()

@property (nonatomic,strong) NSString * title;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

#pragma mark -  aaa
    
//    NSArray *array2 = @[@"a",@"b",@"c",];
//    RACSignal * arrat2Single = [array2.rac_sequence signal];
//    [arrat2Single subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
    
//    __block unsigned subscriptions = 0;
//    RACSignal * loginSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
//        subscriptions ++;
////        [subscriber sendNext:nil];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    
//    [loginSignal subscribeCompleted:^{
//        NSLog(@"subscription %u", subscriptions);
//    }];
//    
//    [loginSignal subscribeCompleted:^{
//        NSLog(@"subscription %u", subscriptions);
//    }];
    
    
//    __block unsigned subscriptions = 0;
//    RACSignal * loginSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
//        subscriptions ++;
//        //        [subscriber sendNext:nil];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    
//    [loginSignal doCompleted:^{
//        NSLog(@"about to complete subscription %u", subscriptions);
//    }];
//    
//    [loginSignal subscribeCompleted:^{
//        NSLog(@"subscription %u", subscriptions);
//    }];
//
    
//    NSArray * nums = @[@(7),@(9),@(1),@(2),@(3),@(6),@(10)];
//    RACSequence * numSequence = [nums rac_sequence];
//    RACSequence * mapSequence = [numSequence map:^id(id x){
//        return @([(NSNumber *)x intValue] * 10);
//    }];
//    
//    [[mapSequence signal] subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
    

//    NSArray * nums = @[@(7),@(9),@(1),@(2),@(3),@(6),@(10)];
//    RACSequence * numSequence = [nums rac_sequence];
//    RACSequence * mapSequence = [numSequence filter:^BOOL(id value){
//        return ([(NSNumber *)value intValue] > 4);
//    }];
//    
//    [[mapSequence signal] subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
    

    
    
//    NSArray * abcs = @[@"a",@"b",@"c"];
//    NSArray * nums = @[@"1",@"2",@"3"];
//
//    RACSequence * concat = [abcs.rac_sequence concat:nums.rac_sequence];
//    [[concat signal] subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
//    
    
    
    
//    NSArray * abcs = @[@"a",@"b",@"c"];
//    NSArray * nums = @[@"1",@"2",@"3"];
//    
//    RACSequence * seqs = @[abcs.rac_sequence,nums.rac_sequence].rac_sequence;
//    
//    RACSequence * flatten = [seqs flatten];
//    
//    [[flatten signal] subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
    

    
//    RACSubject * letters = [RACSubject subject];
//    RACSubject * numbers = [RACSubject subject];
//    RACSignal * signalOfSignals = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
//        [subscriber sendNext:letters];
//        [subscriber sendNext:numbers];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    
//    RACSignal * flattendes = [signalOfSignals flatten];
//    [flattendes subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
//    
//    [letters sendNext:@"A"];
//    [numbers sendNext:@"1"];
//    [letters sendNext:@"Aa"];
//    [letters sendNext:@"B"];
//    [letters sendNext:@"C"];
//    [numbers sendNext:@"2"];
    
    
    
    
//    RACSequence  * numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;
//    
//    RACSequence * extended = [numbers flattenMap:^(NSString *num){
//        return @[num,num].rac_sequence;
//    }];
//    
//    RACSequence *edited = [numbers flattenMap:^(NSString *num){
//        if (num.intValue % 2 == 0) {
//            return [RACSequence empty];
//        } else {
//            NSString *newNum = [num stringByAppendingString:@"_"];
//            return [RACSequence return:newNum];
//        }
//    }];
//
//    [[edited signal] subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
    
    
    
#pragma  mark -   RACSignal
  
    /*
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    // The new signal only contains: 1 2 3 4 5 6 7 8 9
    //
    // But when subscribed to, it also outputs: A B C D E F G H I
    RACSignal *sequenced = [[letters
                             doNext:^(NSString *letter) {
                                 NSLog(@"%@", letter);
                             }]
                            then:^{
                                return [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
                            }];

    
    [sequenced subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
     */
    
    
    
//    RACSubject * subA = [[RACSubject alloc] init];
//    RACSubject * subB = [[RACSubject alloc] init];
//
//    RACSignal * merge = [RACSignal merge:@[subA,subB]];
//    
//    [merge subscribeNext:^(id x){
//        NSLog(@"merge:%@",x);
//    }];
//    
//    [subA sendNext:@"a"];
//    [subB sendNext:@"b"];
//    [subA sendNext:@"a1"];
//    [subB sendNext:@"b1"];

    
    
    
//    RACSubject * subA = [[RACSubject alloc] init];
//    RACSubject * subB = [[RACSubject alloc] init];
//    
//    RACSignal * combined = [RACSignal combineLatest:@[subA,subB] reduce:^(NSString *letter, NSString *number){
//        return [letter stringByAppendingString:number];
//    }];
//    
//    [combined subscribeNext:^(id x){
//        NSLog(@"merge:%@",x);
//    }];
//    
//    [subA sendNext:@"A"];
//    [subA sendNext:@"B"];
//    [subB sendNext:@"1"];
//    [subB sendNext:@"2"];
//    [subA sendNext:@"C"];
//    [subB sendNext:@"3"];
//
    
    
    
    RACSubject * letter = [RACSubject subject];
    RACSubject * number = [RACSubject subject];
    
    RACSubject * signalOfSignals = [RACSubject subject];
    
    RACSignal * switched = [signalOfSignals switchToLatest];
    
    [switched subscribeNext:^(id x){
        NSLog(@"switched : %@",x);
    }];
    
    [signalOfSignals sendNext:letter];
    [letter sendNext:@"L_A_1"];
    [letter sendNext:@"L_A_2"];
    
    [signalOfSignals sendNext:number];
    [letter sendNext:@"L_B_1"];
    [number sendNext:@"N_B_2"];
    
    [signalOfSignals sendNext:letter];
    [number sendNext:@"N_C_1"];
    [letter sendNext:@"L_C_2"];
    
    

    
    
//    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
//    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;
//    RACSequence *sequenceOfSequences = @[ letters, numbers ].rac_sequence;
//    
//    // Contains: A B C D E F G H I 1 2 3 4 5 6 7 8 9
//    RACSequence *flattened = [sequenceOfSequences flatten];
//    [[flattened signal] subscribeNext:^(id x){
//        NSLog(@"%@",x);
//    }];
//    
//    RACSubject * subject = [[RACSubject alloc] init];
//    [[subject filter:^BOOL(NSString * x){
//        if ([x isEqualToString:@"123"]) {
//            return YES;
//        }
//        return NO;
//    }] subscribeNext:^(id x){
//        NSLog(@"this is true val : %@",x);
//    }];
//    
//    [subject sendNext:@"123" ];
    
}

- (void)test1
{
    NSArray *array = @[@"a",@"b",@"c"];
    
    id aaa = [[array.rac_sequence filter:^BOOL(NSString *str){
        return YES;
    }] map:^(NSString *str){
        NSLog(@"aa: %@",str);
        return [str stringByAppendingString:@"foobar"];
    }];
    
    @weakify(self);
    [RACObserve(self, title) subscribeNext:^(NSString * title){
        @strongify(self);
        NSLog(@"click me %@",title);
    }];
    
    
    [[RACObserve(self, title) filter:^BOOL(NSString * title){
        return [title isEqualToString:@"aaa"];
    }] subscribeNext:^(NSString * title){
        NSLog(@"uername is true : %@",title);
    }];
    
    self.title = @"aaa";
    
    
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x){
        NSLog(@"click me 登录 了");
    }];
    RAC(self.loginButton,enabled) = [RACSignal combineLatest:@[self.userNameLabel.rac_textSignal] reduce:^(NSString *username){
        return @(username.length > 0);
    }];
}

- (IBAction)loginAction:(id)sender {
}
@end
