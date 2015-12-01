;*******************************************************************************
;   interrupt proxy.asm
;
;   This file is used to fix the interrupt table and route MSP430F5419 hardware
;   interrupt requests to the Main Program using proxy routines / vectors.
;
;   W. Goh
;   Texas Instruments Inc.
;   April 2010
;   Built with Code Composer Studio v4.2 Build: 07005 
;*******************************************************************************
;-------------------------------------------------------------------------------
; The following code section is used to define variables to allow
; accessing the interrupt vectors which are defined by the main program.
;-------------------------------------------------------------------------------
RTC_PROXY       .equ  0x5C52                ; 0x5C52 RTC
PORT2_PROXY     .equ  0x5C54                ; 0x5C54 Port 2
USCI_B3_PROXY   .equ  0x5C56                ; 0x5C56 USCI B3 Receive/Transmit
USCI_A3_PROXY   .equ  0x5C58                ; 0x5C58 USCI A3 Receive/Transmit
USCI_B1_PROXY   .equ  0x5C5A                ; 0x5C5A USCI B1 Receive/Transmit
USCI_A1_PROXY   .equ  0x5C5C                ; 0x5C5C USCI A1 Receive/Transmit
PORT1_PROXY     .equ  0x5C5E                ; 0x5C5E Port 1
TIMER1_A1_PROXY .equ  0x5C60                ; 0x5C60 Timer1_A3 CC1-2, TA1
TIMER1_A0_PROXY .equ  0x5C62                ; 0x5C62 Timer1_A3 CC0
DMA_PROXY       .equ  0x5C64                ; 0x5C64 DMA
USCI_B2_PROXY   .equ  0x5C66                ; 0x5C66 USCI B2 Receive/Transmit
USCI_A2_PROXY   .equ  0x5C68                ; 0x5C68 USCI A2 Receive/Transmit
TIMER0_A1_PROXY .equ  0x5C6A                ; 0x5C6A Timer0_A5 CC1-4, TA
TIMER0_A0_PROXY .equ  0x5C6C                ; 0x5C6C Timer0_A5 CC0
ADC12_PROXY     .equ  0x5C6E                ; 0x5C6E ADC
USCI_B0_PROXY   .equ  0x5C70                ; 0x5C70 USCI B0 Receive/Transmit
USCI_A0_PROXY   .equ  0x5C72                ; 0x5C72 USCI A0 Receive/Transmit
WDT_PROXY       .equ  0x5C74                ; 0x5C74 Watchdog Timer
TIMER0_B1_PROXY .equ  0x5C76                ; 0x5C76 Timer0_B7 CC1-6, TB
TIMER0_B0_PROXY .equ  0x5C78                ; 0x5C78 Timer0_B7 CC0
UNMI_PROXY      .equ  0x5C7A                ; 0x5C7A User Non-maskable
SYSNMI_PROXY    .equ  0x5C7C                ; 0x5C7C System Non-maskable
RESET_PROXY     .equ  0x5C7E                ; 0x5C7E Reset vector

                .cdecls C,LIST, "msp430x54x.h"
                
                
;-------------------------------------------------------------------------------
; The following code section contains the actual ISR implementation
; for all possible MSP430F5419 interrupt sources. All that is being done
; here is an indirect jump to the address that is stored in the
; main program's virtual interrupt vector table. Other than a 5 CPU
; cycle overhead added to each ISR call, there are no side effects of
; doing this.
; Also, interrupt vectors not implemented on the device are trapped and
; not forwarded to the main program.
;-------------------------------------------------------------------------------
                .sect   ".brintvec"         ; Assemble to branch interrupt
                                            ; memory
;-------------------------------------------------------------------------------
RTC_ISR         BR      &RTC_PROXY          ; Indirect jump using proxy
PORT2_ISR       BR      &PORT2_PROXY        ; Indirect jump using proxy
USCI_B3_ISR     BR      &USCI_B3_PROXY      ; Indirect jump using proxy
USCI_A3_ISR     BR      &USCI_A3_PROXY      ; Indirect jump using proxy
USCI_B1_ISR     BR      &USCI_B1_PROXY      ; Indirect jump using proxy
USCI_A1_ISR     BR      &USCI_A1_PROXY      ; Indirect jump using proxy  
;PORT1_ISR       BR      &PORT1_PROXY        ; Indirect jump using proxy
TIMER1_A1_ISR   BR      &TIMER1_A1_PROXY    ; Indirect jump using proxy
TIMER1_A0_ISR   BR      &TIMER1_A0_PROXY    ; Indirect jump using proxy
DMA_ISR         BR      &DMA_PROXY          ; Indirect jump using proxy
USCI_B2_ISR     BR      &USCI_B2_PROXY      ; Indirect jump using proxy
USCI_A2_ISR     BR      &USCI_A2_PROXY      ; Indirect jump using proxy
TIMER0_A1_ISR   BR      &TIMER0_A1_PROXY    ; Indirect jump using proxy
TIMER0_A0_ISR   BR      &TIMER0_A0_PROXY    ; Indirect jump using proxy
ADC12_ISR       BR      &ADC12_PROXY        ; Indirect jump using proxy
USCI_B0_ISR     BR      &USCI_B0_PROXY      ; Indirect jump using proxy
USCI_A0_ISR     BR      &USCI_A0_PROXY      ; Indirect jump using proxy  
WDT_ISR         BR      &WDT_PROXY          ; Indirect jump using proxy
TIMER0_B1_ISR   BR      &TIMER0_B1_PROXY    ; Indirect jump using proxy
TIMER0_B0_ISR   BR      &TIMER0_B0_PROXY    ; Indirect jump using proxy
UNMI_ISR        BR      &UNMI_PROXY         ; Indirect jump using proxy
SYSNMI_ISR      BR      &SYSNMI_PROXY       ; Indirect jump using proxy
;RESET_ISR       BR      &RESET_PROXY        ; Indirect jump using proxy
DUMMY_ISR       MOV.W   #PMMPW+PMMSWBOR,&PMMCTL0  ; Trigger device reset
;-------------------------------------------------------------------------------
; The following code section populates the actual MSP430F5419 interrupt
; vectors to point to code sections within the boot loader code. In these
; code sections, an indirect jump is performed and with this the interrupt
; requests are routed to the main program.
;-------------------------------------------------------------------------------
            .sect   ".mainintvec1"         
            .word   DUMMY_ISR               ; 0xFF80 Not Used
            .word   DUMMY_ISR               ; 0xFF82 Not Used
            .word   DUMMY_ISR               ; 0xFF84 Not Used
            .word   DUMMY_ISR               ; 0xFF86 Not Used
            .word   DUMMY_ISR               ; 0xFF88 Not Used
            .word   DUMMY_ISR               ; 0xFF8A Not Used
            .word   DUMMY_ISR               ; 0xFF8C Not Used
            .word   DUMMY_ISR               ; 0xFF8E Not Used
            .word   DUMMY_ISR               ; 0xFF90 Not Used 
            .word   DUMMY_ISR               ; 0xFF92 Not Used
            .word   DUMMY_ISR               ; 0xFF94 Not Used
            .word   DUMMY_ISR               ; 0xFF96 Not Used
            .word   DUMMY_ISR               ; 0xFF98 Not Used
            .word   DUMMY_ISR               ; 0xFF9A Not Used
            .word   DUMMY_ISR               ; 0xFF9C Not Used
            .word   DUMMY_ISR               ; 0xFF9E Not Used 
            .word   DUMMY_ISR               ; 0xFFA0 Not Used
            .word   DUMMY_ISR               ; 0xFFA2 Not Used
            .word   DUMMY_ISR               ; 0xFFA4 Not Used
            .word   DUMMY_ISR               ; 0xFFA6 Not Used
            .word   DUMMY_ISR               ; 0xFFA8 Not Used  
            .word   DUMMY_ISR               ; 0xFFAA Not Used  
            .word   DUMMY_ISR               ; 0xFFAC Not Used
            .word   DUMMY_ISR               ; 0xFFAE Not Used
            .word   DUMMY_ISR               ; 0xFFB0 Not Used
            .word   DUMMY_ISR               ; 0xFFB2 Not Used 
            .word   DUMMY_ISR               ; 0xFFB4 Not Used      
            .word   DUMMY_ISR               ; 0xFFB6 Not Used
            .word   DUMMY_ISR               ; 0xFFB8 Not Used
            .word   DUMMY_ISR               ; 0xFFBA Not Used
            .word   DUMMY_ISR               ; 0xFFBC Not Used
            .word   DUMMY_ISR               ; 0xFFBE Not Used
            .word   DUMMY_ISR               ; 0xFFC0 Not Used
            .word   DUMMY_ISR               ; 0xFFC2 Not Used
            .word   DUMMY_ISR               ; 0xFFC4 Not Used
            .word   DUMMY_ISR               ; 0xFFC6 Not Used
            .word   DUMMY_ISR               ; 0xFFC8 Not Used
            .word   DUMMY_ISR               ; 0xFFCA Not Used
            .word   DUMMY_ISR               ; 0xFFCC Not Used
            .word   DUMMY_ISR               ; 0xFFCE Not Used
            .word   DUMMY_ISR               ; 0xFFD0 Not Used    
            .word   RTC_ISR                 ; 0xFFD2 RTC
            .word   PORT2_ISR               ; 0xFFD4 Port 2
            .word   USCI_B3_ISR             ; 0xFFD6 USCI B3 Receive/Transmit
            .word   USCI_A3_ISR             ; 0xFFD8 USCI A3 Receive/Transmit
            .word   USCI_B1_ISR             ; 0xFFDA USCI B1 Receive/Transmit
            .word   USCI_A1_ISR             ; 0xFFDC USCI A1 Receive/Transmit
            
;           .word PORT1_ISR bootloader is using this interrupt
            
			.sect   ".mainintvec2"   
            .word   TIMER1_A1_ISR           ; 0xFFE0 Timer1_A3 CC1-2, TA1
            .word   TIMER1_A0_ISR           ; 0xFFE2 Timer1_A3 CC0
            .word   DMA_ISR                 ; 0xFFE4 DMA
            .word   USCI_B2_ISR             ; 0xFFE6 USCI B2 Receive/Transmit
            .word   USCI_A2_ISR             ; 0xFFE8 USCI A2 Receive/Transmit
            .word   TIMER0_A1_ISR           ; 0xFFEA Timer0_A5 CC1-4, TA
            .word   TIMER0_A0_ISR           ; 0xFFEC Timer0_A5 CC0
            .word   ADC12_ISR               ; 0xFFEE ADC
            .word   USCI_B0_ISR             ; 0xFFF0 USCI B0 Receive/Transmit
            .word   USCI_A0_ISR             ; 0xFFF2 USCI A0 Receive/Transmit
            .word   WDT_ISR                 ; 0xFFF4 Watchdog Timer
            .word   TIMER0_B1_ISR           ; 0xFFF6 Timer0_B7 CC1-6, TB
            .word   TIMER0_B0_ISR           ; 0xFFF8 Timer0_B7 CC0
            .word   UNMI_ISR                ; 0xFFFA User Non-maskable
            .word   SYSNMI_ISR              ; 0xFFFC System Non-maskable
;           .word   RESET_ISR               ; 0xFFFE Reset
;-------------------------------------------------------------------------------
            .end
