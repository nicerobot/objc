#import <Foundation/Foundation.h>
#import "NSData+Adler32/NSData+Adler32.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  /*
	NSLog(@"testing symmetric encrypt/decrypt ...");
	NSString *_key = @"hello";
	NSString *_secret = @"hello";
	NSData *_secretData = [_secret dataUsingEncoding:NSASCIIStringEncoding];
	
	NSLog(@"plaintext string: %@",[[NSString alloc] initWithData:_secretData encoding:NSASCIIStringEncoding]);
	
	CCOptions padding = kCCOptionPKCS7Padding;
	NSData *encryptedData = [self encrypt:_secretData key:[self md5data:_key] padding:&padding];
	
	NSLog(@"encrypted data: %@", encryptedData);
	
	NSLog(@"encoded string ASCII: %@",[[NSString alloc] initWithData:encryptedData encoding:NSASCIIStringEncoding]);
	NSLog(@"encoded string UTF8: %@",[[NSString alloc] initWithData:encryptedData encoding:NSUTF8StringEncoding]);
	
	NSData *data = [self decrypt:encryptedData key:[self md5data:_key] padding:&padding];
	NSLog(@"decrypted data: %@", data);
	NSString *str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	NSLog(@"decrypted string: %@", str);
	NSLog(@"test finished.");
  //*/
  [pool drain];
  return 0;
}
