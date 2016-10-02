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
    
    
    
    NSArray * abcs = @[@"a",@"b",@"c"];
    NSArray * nums = @[@"1",@"2",@"3"];
    
    RACSequence * seqs = @[abcs,nums].rac_sequence;
    
    RACSequence * flatten = [seqs flatten];
    
    [[flatten signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    
    
    
    
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
