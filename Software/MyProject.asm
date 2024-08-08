
_main:

;MyProject.c,6 :: 		void main() {
;MyProject.c,9 :: 		initPorts();
	CALL       _initPorts+0
;MyProject.c,11 :: 		while(1)
L_main0:
;MyProject.c,14 :: 		for(i=15;i>0;i--)
	MOVLW      15
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main45:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,18 :: 		if(i>3)j=i-3;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       main_i_L0+0, 0
	SUBLW      3
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVLW      3
	SUBWF      main_i_L0+0, 0
	MOVWF      main_j_L2+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_i_L0+1, 0
	MOVWF      main_j_L2+1
	GOTO       L_main6
L_main5:
;MyProject.c,19 :: 		else j=i;
	MOVF       main_i_L0+0, 0
	MOVWF      main_j_L2+0
	MOVF       main_i_L0+1, 0
	MOVWF      main_j_L2+1
L_main6:
;MyProject.c,20 :: 		PORTE.B1 = 0;
	BCF        PORTE+0, 1
;MyProject.c,21 :: 		PORTE.B2=1;
	BSF        PORTE+0, 2
;MyProject.c,22 :: 		if(i>3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       main_i_L0+0, 0
	SUBLW      3
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,23 :: 		PORTA.B0 = 1;
	BSF        PORTA+0, 0
;MyProject.c,24 :: 		}else{
	GOTO       L_main8
L_main7:
;MyProject.c,25 :: 		PORTA.B1 = 1;
	BSF        PORTA+0, 1
;MyProject.c,26 :: 		}
L_main8:
;MyProject.c,28 :: 		tens1 = i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_j_L2+0, 0
	MOVWF      R0+0
	MOVF       main_j_L2+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_j_L2+0, 0
	MOVWF      R0+0
	MOVF       main_j_L2+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;MyProject.c,33 :: 		loopOneSec(tens1,units1,tens2,units2);
	MOVF       FLOC__main+4, 0
	MOVWF      FARG_loopOneSec_t1+0
	MOVF       FLOC__main+5, 0
	MOVWF      FARG_loopOneSec_t1+1
	MOVF       FLOC__main+2, 0
	MOVWF      FARG_loopOneSec_u1+0
	MOVF       FLOC__main+3, 0
	MOVWF      FARG_loopOneSec_u1+1
	MOVF       FLOC__main+0, 0
	MOVWF      FARG_loopOneSec_t2+0
	MOVF       FLOC__main+1, 0
	MOVWF      FARG_loopOneSec_t2+1
	MOVF       R0+0, 0
	MOVWF      FARG_loopOneSec_u2+0
	MOVF       R0+1, 0
	MOVWF      FARG_loopOneSec_u2+1
	CALL       _loopOneSec+0
;MyProject.c,14 :: 		for(i=15;i>0;i--)
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;MyProject.c,35 :: 		}
	GOTO       L_main2
L_main3:
;MyProject.c,37 :: 		for(j=23;j>0;j--)
	MOVLW      23
	MOVWF      main_j_L0+0
	MOVLW      0
	MOVWF      main_j_L0+1
L_main9:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_j_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       main_j_L0+0, 0
	SUBLW      0
L__main48:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;MyProject.c,41 :: 		if(j>3)i=j-3;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_j_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       main_j_L0+0, 0
	SUBLW      3
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	MOVLW      3
	SUBWF      main_j_L0+0, 0
	MOVWF      main_i_L2+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_j_L0+1, 0
	MOVWF      main_i_L2+1
	GOTO       L_main13
L_main12:
;MyProject.c,42 :: 		else i=j;
	MOVF       main_j_L0+0, 0
	MOVWF      main_i_L2+0
	MOVF       main_j_L0+1, 0
	MOVWF      main_i_L2+1
L_main13:
;MyProject.c,43 :: 		PORTE.B2 = 0;
	BCF        PORTE+0, 2
;MyProject.c,44 :: 		PORTA.B1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,45 :: 		PORTA.B2 = 1;
	BSF        PORTA+0, 2
;MyProject.c,46 :: 		if(j>3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_j_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVF       main_j_L0+0, 0
	SUBLW      3
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;MyProject.c,47 :: 		PORTE.B0 = 1;
	BSF        PORTE+0, 0
;MyProject.c,48 :: 		}else{
	GOTO       L_main15
L_main14:
;MyProject.c,49 :: 		PORTE.B0 = 0;
	BCF        PORTE+0, 0
;MyProject.c,50 :: 		PORTE.B1 = 1;
	BSF        PORTE+0, 1
;MyProject.c,51 :: 		}
L_main15:
;MyProject.c,52 :: 		tens1 = i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L2+0, 0
	MOVWF      R0+0
	MOVF       main_i_L2+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L2+0, 0
	MOVWF      R0+0
	MOVF       main_i_L2+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_j_L0+0, 0
	MOVWF      R0+0
	MOVF       main_j_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_j_L0+0, 0
	MOVWF      R0+0
	MOVF       main_j_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;MyProject.c,56 :: 		loopOneSec(tens1,units1,tens2,units2);
	MOVF       FLOC__main+4, 0
	MOVWF      FARG_loopOneSec_t1+0
	MOVF       FLOC__main+5, 0
	MOVWF      FARG_loopOneSec_t1+1
	MOVF       FLOC__main+2, 0
	MOVWF      FARG_loopOneSec_u1+0
	MOVF       FLOC__main+3, 0
	MOVWF      FARG_loopOneSec_u1+1
	MOVF       FLOC__main+0, 0
	MOVWF      FARG_loopOneSec_t2+0
	MOVF       FLOC__main+1, 0
	MOVWF      FARG_loopOneSec_t2+1
	MOVF       R0+0, 0
	MOVWF      FARG_loopOneSec_u2+0
	MOVF       R0+1, 0
	MOVWF      FARG_loopOneSec_u2+1
	CALL       _loopOneSec+0
;MyProject.c,37 :: 		for(j=23;j>0;j--)
	MOVLW      1
	SUBWF      main_j_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_j_L0+1, 1
;MyProject.c,57 :: 		}
	GOTO       L_main9
L_main10:
;MyProject.c,59 :: 		}
	GOTO       L_main0
;MyProject.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,61 :: 		void interrupt(){
;MyProject.c,63 :: 		if(PORTB.B0 == 0){
	BTFSC      PORTB+0, 0
	GOTO       L_interrupt16
;MyProject.c,64 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;MyProject.c,65 :: 		return;
	GOTO       L__interrupt52
;MyProject.c,66 :: 		}
L_interrupt16:
;MyProject.c,68 :: 		if(PORTB.B4 == 1){
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt17
;MyProject.c,69 :: 		int c = 3;
	MOVLW      3
	MOVWF      interrupt_c_L1+0
	MOVLW      0
	MOVWF      interrupt_c_L1+1
;MyProject.c,71 :: 		PORTD = 0xff;
	MOVLW      255
	MOVWF      PORTD+0
;MyProject.c,72 :: 		PORTC = 0x0;
	CLRF       PORTC+0
;MyProject.c,73 :: 		PORTE = 0x0;
	CLRF       PORTE+0
;MyProject.c,74 :: 		PORTA = 0x0;
	CLRF       PORTA+0
;MyProject.c,76 :: 		for(c;c>0;c--){
L_interrupt18:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      interrupt_c_L1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt53
	MOVF       interrupt_c_L1+0, 0
	SUBLW      0
L__interrupt53:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt19
;MyProject.c,78 :: 		PORTA.B1 = 1;
	BSF        PORTA+0, 1
;MyProject.c,80 :: 		PORTD.B3 = 0x0;
	BCF        PORTD+0, 3
;MyProject.c,81 :: 		PORTC = arr[c];
	MOVF       interrupt_c_L1+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,82 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt21:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt21
	DECFSZ     R12+0, 1
	GOTO       L_interrupt21
	DECFSZ     R11+0, 1
	GOTO       L_interrupt21
	NOP
	NOP
;MyProject.c,76 :: 		for(c;c>0;c--){
	MOVLW      1
	SUBWF      interrupt_c_L1+0, 1
	BTFSS      STATUS+0, 0
	DECF       interrupt_c_L1+1, 1
;MyProject.c,83 :: 		}
	GOTO       L_interrupt18
L_interrupt19:
;MyProject.c,85 :: 		PORTA.B1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,87 :: 		PORTC = 0x0;
	CLRF       PORTC+0
;MyProject.c,88 :: 		PORTD.B3 = 0xff;
	BSF        PORTD+0, 3
;MyProject.c,90 :: 		while(PORTB.B4 == 1 && PORTB.B0 == 1){
L_interrupt22:
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt23
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt23
L__interrupt43:
;MyProject.c,91 :: 		PORTE.B0 = 1;
	BSF        PORTE+0, 0
;MyProject.c,92 :: 		PORTA.B2 = 1;
	BSF        PORTA+0, 2
;MyProject.c,93 :: 		}
	GOTO       L_interrupt22
L_interrupt23:
;MyProject.c,95 :: 		} else{
	GOTO       L_interrupt26
L_interrupt17:
;MyProject.c,96 :: 		int c = 3;
	MOVLW      3
	MOVWF      interrupt_c_L1_L1+0
	MOVLW      0
	MOVWF      interrupt_c_L1_L1+1
;MyProject.c,98 :: 		PORTD = 0xff;
	MOVLW      255
	MOVWF      PORTD+0
;MyProject.c,99 :: 		PORTC = 0x0;
	CLRF       PORTC+0
;MyProject.c,100 :: 		PORTE = 0x0;
	CLRF       PORTE+0
;MyProject.c,101 :: 		PORTA = 0x0;
	CLRF       PORTA+0
;MyProject.c,103 :: 		for(c;c>0;c--){
L_interrupt27:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      interrupt_c_L1_L1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt54
	MOVF       interrupt_c_L1_L1+0, 0
	SUBLW      0
L__interrupt54:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt28
;MyProject.c,105 :: 		PORTE.B1 = 1;
	BSF        PORTE+0, 1
;MyProject.c,107 :: 		PORTD.B1 = 0x0;
	BCF        PORTD+0, 1
;MyProject.c,108 :: 		PORTC = arr[c];
	MOVF       interrupt_c_L1_L1+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,109 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt30:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt30
	DECFSZ     R12+0, 1
	GOTO       L_interrupt30
	DECFSZ     R11+0, 1
	GOTO       L_interrupt30
	NOP
	NOP
;MyProject.c,103 :: 		for(c;c>0;c--){
	MOVLW      1
	SUBWF      interrupt_c_L1_L1+0, 1
	BTFSS      STATUS+0, 0
	DECF       interrupt_c_L1_L1+1, 1
;MyProject.c,110 :: 		}
	GOTO       L_interrupt27
L_interrupt28:
;MyProject.c,112 :: 		PORTE.B1 = 0;
	BCF        PORTE+0, 1
;MyProject.c,114 :: 		PORTC = 0x0;
	CLRF       PORTC+0
;MyProject.c,115 :: 		PORTD.B1 = 0xff;
	BSF        PORTD+0, 1
;MyProject.c,117 :: 		while(PORTB.B4 == 0 && PORTB.B0 == 1){
L_interrupt31:
	BTFSC      PORTB+0, 4
	GOTO       L_interrupt32
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt32
L__interrupt42:
;MyProject.c,118 :: 		PORTA.B0 = 1;
	BSF        PORTA+0, 0
;MyProject.c,119 :: 		PORTE.B2 = 1;
	BSF        PORTE+0, 2
;MyProject.c,120 :: 		}
	GOTO       L_interrupt31
L_interrupt32:
;MyProject.c,121 :: 		}
L_interrupt26:
;MyProject.c,123 :: 		}
L_end_interrupt:
L__interrupt52:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_initPorts:

;MyProject.c,124 :: 		void initPorts(){
;MyProject.c,125 :: 		TRISC = 0x0;
	CLRF       TRISC+0
;MyProject.c,126 :: 		TRISD = 0x0;
	CLRF       TRISD+0
;MyProject.c,127 :: 		PORTC = 0x0;
	CLRF       PORTC+0
;MyProject.c,128 :: 		PORTD = 0xff;
	MOVLW      255
	MOVWF      PORTD+0
;MyProject.c,129 :: 		TRISB = 0x0;
	CLRF       TRISB+0
;MyProject.c,130 :: 		PORTB = 0x0;
	CLRF       PORTB+0
;MyProject.c,131 :: 		TRISE = 0x0;
	CLRF       TRISE+0
;MyProject.c,132 :: 		PORTE = 0x0;
	CLRF       PORTE+0
;MyProject.c,133 :: 		TRISA = 0x0;
	CLRF       TRISA+0
;MyProject.c,134 :: 		PORTA = 0x0;
	CLRF       PORTA+0
;MyProject.c,135 :: 		TRISB.B0 = 1;
	BSF        TRISB+0, 0
;MyProject.c,136 :: 		PORTB.B0 = 0;
	BCF        PORTB+0, 0
;MyProject.c,137 :: 		TRISB.B4 = 1;
	BSF        TRISB+0, 4
;MyProject.c,138 :: 		PORTB.B4 = 0;
	BCF        PORTB+0, 4
;MyProject.c,139 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;MyProject.c,140 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;MyProject.c,141 :: 		OPTION_REG.INTEDG = 1;
	BSF        OPTION_REG+0, 6
;MyProject.c,143 :: 		}
L_end_initPorts:
	RETURN
; end of _initPorts

_loopOneSec:

;MyProject.c,144 :: 		void loopOneSec(int t1, int u1, int t2, int u2){
;MyProject.c,146 :: 		for(k=0;k<25;k++)
	CLRF       R1+0
	CLRF       R1+1
L_loopOneSec35:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__loopOneSec57
	MOVLW      25
	SUBWF      R1+0, 0
L__loopOneSec57:
	BTFSC      STATUS+0, 0
	GOTO       L_loopOneSec36
;MyProject.c,149 :: 		PORTD.B0 = 0x0;
	BCF        PORTD+0, 0
;MyProject.c,150 :: 		PORTC = arr[t1];
	MOVF       FARG_loopOneSec_t1+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,152 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_loopOneSec38:
	DECFSZ     R13+0, 1
	GOTO       L_loopOneSec38
	DECFSZ     R12+0, 1
	GOTO       L_loopOneSec38
	NOP
;MyProject.c,153 :: 		PORTD.B0 = 0xff;
	BSF        PORTD+0, 0
;MyProject.c,155 :: 		PORTD.B1 = 0x0;
	BCF        PORTD+0, 1
;MyProject.c,156 :: 		PORTC = arr[u1];
	MOVF       FARG_loopOneSec_u1+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,158 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_loopOneSec39:
	DECFSZ     R13+0, 1
	GOTO       L_loopOneSec39
	DECFSZ     R12+0, 1
	GOTO       L_loopOneSec39
	NOP
;MyProject.c,159 :: 		PORTD.B1 = 0xff;
	BSF        PORTD+0, 1
;MyProject.c,162 :: 		PORTD.B2 = 0;
	BCF        PORTD+0, 2
;MyProject.c,163 :: 		PORTC = arr[t2];
	MOVF       FARG_loopOneSec_t2+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,165 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_loopOneSec40:
	DECFSZ     R13+0, 1
	GOTO       L_loopOneSec40
	DECFSZ     R12+0, 1
	GOTO       L_loopOneSec40
	NOP
;MyProject.c,166 :: 		PORTD.B2 = 0xff;
	BSF        PORTD+0, 2
;MyProject.c,169 :: 		PORTD.B3 = 0;
	BCF        PORTD+0, 3
;MyProject.c,170 :: 		PORTC = arr[u2];
	MOVF       FARG_loopOneSec_u2+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,172 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_loopOneSec41:
	DECFSZ     R13+0, 1
	GOTO       L_loopOneSec41
	DECFSZ     R12+0, 1
	GOTO       L_loopOneSec41
	NOP
;MyProject.c,173 :: 		PORTD.B3 = 0xff;
	BSF        PORTD+0, 3
;MyProject.c,146 :: 		for(k=0;k<25;k++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MyProject.c,176 :: 		}
	GOTO       L_loopOneSec35
L_loopOneSec36:
;MyProject.c,177 :: 		}
L_end_loopOneSec:
	RETURN
; end of _loopOneSec
