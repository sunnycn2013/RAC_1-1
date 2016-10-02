# RAC_1-1


##### Subscription

订阅者
热信号

冷信号

```
 __block unsigned subscriptions = 0;
    RACSignal * loginSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
        subscriptions ++;
//        [subscriber sendNext:nil];
        [subscriber sendCompleted];
        return nil;
    }];
    
    [loginSignal subscribeCompleted:^{
        NSLog(@"subscription %u", subscriptions);
    }];
    
    [loginSignal subscribeCompleted:^{
        NSLog(@"subscription %u", subscriptions);
    }];


out put :

2016-10-02 16:58:56.938 RAC_1-1[46719:236962] subscription 1
2016-10-02 16:58:58.578 RAC_1-1[46719:236962] subscription 2
```

### Transforming streams

#####  map

```
    NSArray * nums = @[@(7),@(9),@(1),@(2),@(3),@(6),@(10)];
    RACSequence * numSequence = [nums rac_sequence];
    RACSequence * mapSequence = [numSequence map:^id(id x){
        return @([(NSNumber *)x intValue] * 10);
    }];
    
    [[mapSequence signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    
    输出:
2016-10-02 17:11:54.827 RAC_1-1[47184:245027] 70
2016-10-02 17:11:54.829 RAC_1-1[47184:245027] 90
2016-10-02 17:11:54.830 RAC_1-1[47184:245027] 10
2016-10-02 17:11:54.831 RAC_1-1[47184:245027] 20
2016-10-02 17:11:54.831 RAC_1-1[47184:245027] 30
2016-10-02 17:11:54.832 RAC_1-1[47184:245027] 60
2016-10-02 17:11:54.833 RAC_1-1[47184:245027] 100

```


#### filter
过滤操作

```
    NSArray * nums = @[@(7),@(9),@(1),@(2),@(3),@(6),@(10)];
    RACSequence * numSequence = [nums rac_sequence];
    RACSequence * mapSequence = [numSequence filter:^BOOL(id value){
        return ([(NSNumber *)value intValue] > 4);
    }];
    
    [[mapSequence signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    输出:
    2016-10-02 17:14:17.642 RAC_1-1[47265:246460] 7
2016-10-02 17:14:17.643 RAC_1-1[47265:246460] 9
2016-10-02 17:14:17.644 RAC_1-1[47265:246460] 6
2016-10-02 17:14:17.644 RAC_1-1[47265:246460] 10
    
```


### Combining streams

事物叫合并  信号叫联合
#### Concatenating  合并

```
 RACSubject * subject = [[RACSubject alloc] init];
    [[subject filter:^BOOL(NSString * x){
        if ([x isEqualToString:@"123"]) {
            return YES;
        }
        return NO;
    }] subscribeNext:^(id x){
        NSLog(@"this is true val : %@",x);
    }];
    
    [subject sendNext:@"123" ];
    输出：
    2016-10-02 17:27:10.096 RAC_1-1[47411:253513] a
2016-10-02 17:27:10.097 RAC_1-1[47411:253513] b
2016-10-02 17:27:10.097 RAC_1-1[47411:253513] c
2016-10-02 17:27:10.098 RAC_1-1[47411:253513] 1
2016-10-02 17:27:10.099 RAC_1-1[47411:253513] 2
2016-10-02 17:27:10.099 RAC_1-1[47411:253513] 3
```

#### Flattening





##### RACSingle

##### RACSubject


##### RACSequence
Sequence 类似于NSArray 

```
NSArray *array2 = @[@"a",@"b",@"c",];
    RACSignal * arrat2Single = [array2.rac_sequence signal];
    [arrat2Single subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];

log:a
	b
	c
```