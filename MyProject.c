
char arr[] = {0xbf, 0x86, 0xdb, 0xcf, 0xe6, 0xed, 0xfd, 0x87, 0xff, 0xef};

void initPorts();
void loopOneSec(int t1, int u1, int t2, int u2);
void main() {

        int i,j,tens1,units1,tens2,units2;
        initPorts();

        while(1)
        {
        // first
          for(i=15;i>0;i--)
          {

           int j;
           if(i>3)j=i-3;
           else j=i;
           PORTE.B1 = 0;
           PORTE.B2=1;
           if(i>3){
           PORTA.B0 = 1;
           }else{
           PORTA.B1 = 1;
           }

           tens1 = i/10;
           units1 = i%10;
           tens2 = j/10;
           units2 = j%10;

           loopOneSec(tens1,units1,tens2,units2);

          }
           //second
           for(j=23;j>0;j--)
          {

           int i;
           if(j>3)i=j-3;
           else i=j;
           PORTE.B2 = 0;
           PORTA.B1 = 0;
           PORTA.B2 = 1;
           if(j>3){
                 PORTE.B0 = 1;
           }else{
           PORTE.B0 = 0;
           PORTE.B1 = 1;
           }
           tens1 = i/10;
           units1 = i%10;
           tens2 = j/10;
           units2 = j%10;
           loopOneSec(tens1,units1,tens2,units2);
          }

          }
        }
void interrupt(){
      // Go out of Interrupt
      if(PORTB.B0 == 0){
          INTCON.INTF = 0;
          return;
      }

      if(PORTB.B4 == 1){
          int c = 3;
          //close ports
           PORTD = 0xff;
           PORTC = 0x0;
           PORTA = 0x0;
         // counter from 3 and open yellow
         for(c;c>0;c--){
             //open yellow of south
             PORTA.B1 = 1;
             //display number 3  to 1
             PORTD.B3 = 0x0;
             PORTC = arr[c];
             delay_ms(1000);
         }
         //Close yellow
         PORTA.B1 = 0;
         // close display
         PORTC = 0x0;
         PORTD.B3 = 0xff;
         // Open green of West and red of South while west is on or the interrupt not closed
         while(PORTB.B4 == 1 && PORTB.B0 == 1){
         PORTE.B0 = 1;
         PORTA.B2 = 1;
         }

      } else{
           int c = 3;
          // close ports
           PORTD = 0xff;
           PORTC = 0x0;
           PORTE = 0x0;
         // counter from 3 and open yellow
         for(c;c>0;c--){
             //open yellow of west
             PORTE.B1 = 1;
             //display number 3  to 1
             PORTD.B1 = 0x0;
             PORTC = arr[c];
             delay_ms(1000);
         }
         //Close yellow
         PORTE.B1 = 0;
         // close display
         PORTC = 0x0;
         PORTD.B1 = 0xff;
         // Open green of South and red of West while South is on or the interrupt not closed
         while(PORTB.B4 == 0 && PORTB.B0 == 1){
         PORTA.B0 = 1;
         PORTE.B2 = 1;
         }
      }

}
void initPorts(){
        TRISC = 0x0;
        TRISD = 0x0;
        PORTC = 0x0;
        PORTD = 0xff;
        TRISB = 0x0;
        PORTB = 0x0;
        TRISE = 0x0;
        PORTE = 0x0;
        TRISA = 0x0;
        PORTA = 0x0;
        TRISB.B0 = 1;
        PORTB.B0 = 0;
        TRISB.B4 = 1;
        PORTB.B4 = 0;
        INTCON.GIE = 1;
        INTCON.INTE = 1;
        OPTION_REG.INTEDG = 1;

}
void loopOneSec(int t1, int u1, int t2, int u2){
     int k;
      for(k=0;k<25;k++)
           {
           // tens in S1
                PORTD.B0 = 0x0;
              PORTC = arr[t1];
                delay_ms(10);
                PORTD.B0 = 0xff;
           // units in S1
              PORTD.B1 = 0x0;
              PORTC = arr[u1];
              delay_ms(10);
              PORTD.B1 = 0xff;

              //tens in S2
              PORTD.B2 = 0;
              PORTC = arr[t2];
              delay_ms(10);
              PORTD.B2 = 0xff;

              //units in S2
              PORTD.B3 = 0;
              PORTC = arr[u2];
              delay_ms(10);
              PORTD.B3 = 0xff;


           }
}