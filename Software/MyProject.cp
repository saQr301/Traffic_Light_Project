#line 1 "C:/Users/saqrH/Desktop/TrafficLightProject/Software/MyProject.c"

char arr[] = {0xbf, 0x86, 0xdb, 0xcf, 0xe6, 0xed, 0xfd, 0x87, 0xff, 0xef};

void initPorts();
void loopOneSec(int t1, int u1, int t2, int u2);
void main() {

 int i,j,tens1,units1,tens2,units2;
 initPorts();

 while(1)
 {

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

 if(PORTB.B0 == 0){
 INTCON.INTF = 0;
 return;
 }

 if(PORTB.B4 == 1){
 int c = 3;

 PORTD = 0xff;
 PORTC = 0x0;
 PORTA = 0x0;

 for(c;c>0;c--){

 PORTA.B1 = 1;

 PORTD.B3 = 0x0;
 PORTC = arr[c];
 delay_ms(1000);
 }

 PORTA.B1 = 0;

 PORTC = 0x0;
 PORTD.B3 = 0xff;

 while(PORTB.B4 == 1 && PORTB.B0 == 1){
 PORTE.B0 = 1;
 PORTA.B2 = 1;
 }

 } else{
 int c = 3;

 PORTD = 0xff;
 PORTC = 0x0;
 PORTE = 0x0;

 for(c;c>0;c--){

 PORTE.B1 = 1;

 PORTD.B1 = 0x0;
 PORTC = arr[c];
 delay_ms(1000);
 }

 PORTE.B1 = 0;

 PORTC = 0x0;
 PORTD.B1 = 0xff;

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

 PORTD.B0 = 0x0;
 PORTC = arr[t1];
 delay_ms(10);
 PORTD.B0 = 0xff;

 PORTD.B1 = 0x0;
 PORTC = arr[u1];
 delay_ms(10);
 PORTD.B1 = 0xff;


 PORTD.B2 = 0;
 PORTC = arr[t2];
 delay_ms(10);
 PORTD.B2 = 0xff;


 PORTD.B3 = 0;
 PORTC = arr[u2];
 delay_ms(10);
 PORTD.B3 = 0xff;


 }
}
