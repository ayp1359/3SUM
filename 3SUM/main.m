#import <Foundation/Foundation.h>

BOOL hasTwoElementsGivenSumAlg1(NSArray *numArray, int givenSum){
  
  for (int i=0;i<[numArray count];i++){
    for (int j=i+1;j<[numArray count];j++){
      if([numArray[i] intValue]+[numArray[j] intValue]==givenSum) return YES;
    }
  }
  
  return NO;
}

BOOL hasTwoElementsGivenSumAlg2(NSArray *numArray, int givenSum){
  
  NSArray *sortedNumArray = [numArray sortedArrayUsingSelector:@selector(compare:)];
  
  NSUInteger i=0;
  NSUInteger j=[sortedNumArray count]-1;
  
  while (i<j) {
    
    NSUInteger total = [sortedNumArray[i] intValue] + [sortedNumArray[j] intValue];
    if(total==givenSum){
      return YES;
    }
    else if(total>givenSum){
      j--;
    }
    else{
      i++;
    }
  }
  
  return NO;
}

BOOL hasThreeElementsGivenSumAlg1 (NSArray *numArray, int givenSum){
  
  for (int i=0;i<=[numArray count]-3;i++){
    for(int j = i+1;j<=[numArray count]-2;j++){
      for(int k = j+1;k<=[numArray count]-1;k++){
        int total = [numArray[i] intValue]+[numArray[j] intValue]+[numArray[k] intValue];
        if (total==givenSum){
          NSLog(@"%i+%i+%i=%i",[numArray[i] intValue],[numArray[j] intValue],[numArray[k] intValue],givenSum);
          return YES;
        }
      }
    }
  }
  
  return NO;
}

BOOL hasThreeElementsGivenSumAlg2(NSArray *numArray, int givenSum){
  
  NSArray *sortedNumArray = [numArray sortedArrayUsingSelector:@selector(compare:)];
  
  for(int k=0;k<=[sortedNumArray count]-3;k++){
    
    NSUInteger i = k+1;
    NSUInteger j = [sortedNumArray count]-1;
    
    while(i<j){
      
      int total = [sortedNumArray[i] intValue]+[sortedNumArray[j] intValue]+[sortedNumArray[k] intValue];
      
      if (total==givenSum){
        NSLog(@"%i+%i+%i=%i",[sortedNumArray[i] intValue],[sortedNumArray[j] intValue],[sortedNumArray[k] intValue],givenSum);
        return YES;
      }
      else if (total<givenSum){
        i++;
      }
      else{
        j--;
      }
    }
  }
  
  return NO;
}

int main(int argc, const char *argv[]){
  
  @autoreleasepool {
    
    int givenSum = 0;
    NSArray *numArray = @[@5,@9,@-1,@2,@-4,@4];
    
    NSLog(hasTwoElementsGivenSumAlg1(numArray, givenSum)? @"YES":@"NO");
    
    NSLog(hasTwoElementsGivenSumAlg2(numArray, givenSum)? @"YES":@"NO");
    
    NSLog(hasThreeElementsGivenSumAlg1(numArray, givenSum)? @"YES":@"NO");
    
    NSLog(hasThreeElementsGivenSumAlg2(numArray, givenSum)? @"YES":@"NO");
    
    return 0;
  }
}