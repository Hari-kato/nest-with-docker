import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello there../';
  }

  getOtp(): string{
    const digits = '0123456789';
    let result = '';
    for (let i = 0; i < 6; i++) {
      result += digits[Math.floor(Math.random() * 10)];
    }
    console.log(result);
    
    return `Hey, this is your GCP otp: ${result}`;
    
  }
}
