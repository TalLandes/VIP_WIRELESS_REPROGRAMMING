/*
 *   
 * 
 * Ghaith Matalkah and Jesse Dumond
 * 
 * Georgia Institute of Technology  2010
 * 
 * 
 */
/* ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
 *   MRFI (Minimal RF Interface)
 *   Board definition file.
 *   Target : Texas Instruments MSP-EXP430F5438
 *   Radios : CC2520
 * ~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=
 */

#ifndef MRFI_BOARD_DEFS_H
#define MRFI_BOARD_DEFS_H

/* ------------------------------------------------------------------------------------------------
 *                                           Includes
 * ------------------------------------------------------------------------------------------------
 */
#include "bsp.h"


/* ------------------------------------------------------------------------------------------------
 *                                        Radio Selection
 * ------------------------------------------------------------------------------------------------
 */
#if (!defined MRFI_CC2520)
#error "ERROR: A compatible radio must be specified for the EXP5438 board."
#endif



/*

 CC2520---MSP-EXP430F5438  Pin connections 
  
  GPIO_0 <---- TX_FRM_DONE -----> P1.4
  GPIO_1 <----    FIFO     -----> P1.5
  GPIO_2 <----    FIFOP    -----> P1.6
  GPIO_3 <---- not used    -----> P1.3
  GPIO_4 <---- not used    -----> P8.3
  GPIO_5 <---- not used    -----> P8.2
  VREG_EN <---------------------> P1.7 
  RESETN   <--------------------> P1.2
  
             SPI pins
  RF_MISO <---------------------> P3.2
  RF_MOSI <---------------------> P3.1
  RF_SPI_CLK <------------------> P3.3
  RF_STE(CSn) <-----------------> P3.0
 */ 
  /* ------------------------------------------------------------------------------------------------
 *                                      TX Status Config
 * ------------------------------------------------------------------------------------------------
 */

#define MRFI_BOARD_CONFIG_RADIO_GPIO() st(                                     \
    /* Program the radio GPIO_0 to output TX_FRM_DONE Exception see table 8 CC2520 data sheet */             \
    mrfiSpiWriteReg(GPIOCTRL0, 0x02);                                          \
    );
     
#define __mrfi_TX_FRM_DONE_BIT	 				4   
#define MRFI_CONFIG_TX_FRAME_DONE_AS_INPUT()	st(  P1SEL &= ~BV(__mrfi_TX_FRM_DONE_BIT); \
													 P1DIR &= ~BV(__mrfi_TX_FRM_DONE_BIT);) 
#define MRFI_TX_DONE_STATUS()                   ( P1IN & BV(__mrfi_TX_FRM_DONE_BIT) )   

/* ------------------------------------------------------------------------------------------------
 *                                      RX Interrupt Pin Config
 * ------------------------------------------------------------------------------------------------
 */
//#define MRFI_RX_INT_VECTOR                  	PORT1_VECTOR
#define __mrfi_FIFO_BIT 						5
#define __mrfi_FIFOP_BIT						6

#define MRFI_CONFIG_FIFO_AS_INPUT() 			st( P1SEL &= ~BV(__mrfi_FIFO_BIT); \
													P1DIR &= ~BV(__mrfi_FIFO_BIT);)
#define MRFI_CONFIG_FIFOP_AS_INPUT()         	st( P1SEL &= ~BV(__mrfi_FIFOP_BIT); \
													P1DIR &= ~BV(__mrfi_FIFOP_BIT); \
													P1IES &= ~BV(__mrfi_FIFOP_BIT);)
//port Rx status
#define MRFI_FIFO_STATUS()						( P1IN & BV(__mrfi_FIFO_BIT) )
#define MRFI_FIFOP_STATUS()						( P1IN & BV(__mrfi_FIFOP_BIT) ) 


// Port interrupt flags 
#define MRFI_FIFOP_INTERRUPT_FLAG()     		(P1IFG & BV(__mrfi_FIFOP_BIT))

#define MRFI_DISABLE_RX_INTERRUPT()             st( P1IE  &= ~BV(__mrfi_FIFOP_BIT); )  
#define MRFI_ENABLE_RX_INTERRUPT() 				st( P1IE  |=  BV(__mrfi_FIFOP_BIT); )      
#define MRFI_CLEAR_RX_INTERRUPT_FLAG()			st( P1IFG &= ~BV(__mrfi_FIFOP_BIT); )

/* ------------------------------------------------------------------------------------------------
 *                                      RESETn Pin Configuration
 * ------------------------------------------------------------------------------------------------
 */
#define __mrfi_RESETn_BIT                     2         
#define MRFI_CONFIG_RESETN_PIN_AS_OUTPUT()		st( P1DIR |= BV(__mrfi_RESETn_BIT);)
#define MRFI_DRIVE_RESETN_PIN_HIGH()         	st( P1OUT |=  BV(__mrfi_RESETn_BIT);)
#define MRFI_DRIVE_RESETN_PIN_LOW()				st( P1OUT &= ~BV(__mrfi_RESETn_BIT);)

/* ------------------------------------------------------------------------------------------------
 *                                      VREG_EN Pin Configuration
 * ------------------------------------------------------------------------------------------------
 */ 
#define __mrfi_VEREG_EN_BIT					7                     
#define MRFI_CONFIG_VREG_EN_PIN_AS_OUTPUT()		st( P1DIR |= BV(__mrfi_VEREG_EN_BIT);)
#define MRFI_DRIVE_VREG_EN_PIN_HIGH()        	st( P1OUT |=  BV(__mrfi_VEREG_EN_BIT);)
#define MRFI_DRIVE_VREG_EN_PIN_LOW()			st( P1OUT &= ~BV(__mrfi_VEREG_EN_BIT);)

/* ------------------------------------------------------------------------------------------------
 *                                      CSn Pin Configuration
 * ------------------------------------------------------------------------------------------------
 */
#define __mrfi_SPI_CHIP_SELECT_BIT__             0
#define MRFI_SPI_CHIP_SELECT_AS_OUTPUT()   	st( P3DIR |=  BV(__mrfi_SPI_CHIP_SELECT_BIT__); )
#define MRFI_SPI_CHIP_SELECT_IS_OFF()        	 (  P3OUT &  BV(__mrfi_SPI_CHIP_SELECT_BIT__) )
#define MRFI_SPI_SET_CHIP_SELECT_OFF()       	 st( P3OUT |=  BV(__mrfi_SPI_CHIP_SELECT_BIT__); )
#define MRFI_SPI_SET_CHIP_SELECT_ON()			 st( P3OUT &= ~BV(__mrfi_SPI_CHIP_SELECT_BIT__); )



  		  
/* ------------------------------------------------------------------------------------------------
 *                                      SPI Configuration
 * ------------------------------------------------------------------------------------------------
 */

/* CSn Pin Configuration */
#define __mrfi_SPI_CSN_GPIO_BIT__             0
#define MRFI_SPI_CONFIG_CSN_PIN_AS_OUTPUT()   st( P3DIR |=  BV(__mrfi_SPI_CSN_GPIO_BIT__); )
#define MRFI_SPI_DRIVE_CSN_HIGH()             st( P3OUT |=  BV(__mrfi_SPI_CSN_GPIO_BIT__); ) /* atomic operation */
#define MRFI_SPI_DRIVE_CSN_LOW()              st( P3OUT &= ~BV(__mrfi_SPI_CSN_GPIO_BIT__); ) /* atomic operation */
#define MRFI_SPI_CSN_IS_HIGH()                 (  P3OUT &   BV(__mrfi_SPI_CSN_GPIO_BIT__) )

/* SCLK Pin Configuration */
#define __mrfi_SPI_SCLK_GPIO_BIT__            3
#define MRFI_SPI_CONFIG_SCLK_PIN_AS_OUTPUT()  st( P3DIR |=  BV(__mrfi_SPI_SCLK_GPIO_BIT__); )
#define MRFI_SPI_DRIVE_SCLK_HIGH()            st( P3OUT |=  BV(__mrfi_SPI_SCLK_GPIO_BIT__); )
#define MRFI_SPI_DRIVE_SCLK_LOW()             st( P3OUT &= ~BV(__mrfi_SPI_SCLK_GPIO_BIT__); )

/* SI Pin Configuration */
#define __mrfi_SPI_SI_GPIO_BIT__              1
#define MRFI_SPI_CONFIG_SI_PIN_AS_OUTPUT()    st( P3DIR |=  BV(__mrfi_SPI_SI_GPIO_BIT__); )
#define MRFI_SPI_DRIVE_SI_HIGH()              st( P3OUT |=  BV(__mrfi_SPI_SI_GPIO_BIT__); )
#define MRFI_SPI_DRIVE_SI_LOW()               st( P3OUT &= ~BV(__mrfi_SPI_SI_GPIO_BIT__); )

/* SO Pin Configuration */
#define __mrfi_SPI_SO_GPIO_BIT__              2
#define MRFI_SPI_CONFIG_SO_PIN_AS_INPUT()     st( P3DIR &= ~BV(__mrfi_SPI_SO_GPIO_BIT__);) 
#define MRFI_SPI_SO_IS_HIGH()                 ( P3IN & BV(__mrfi_SPI_SO_GPIO_BIT__) )

/* SPI Port Configuration */
#define MRFI_SPI_CONFIG_PORT()                st( P3SEL |= BV(__mrfi_SPI_SCLK_GPIO_BIT__) |  \
                                                           BV(__mrfi_SPI_SI_GPIO_BIT__)   |  \
                                                           BV(__mrfi_SPI_SO_GPIO_BIT__); )

/* read/write macros */
#define MRFI_SPI_WRITE_BYTE(x)                st( UCB0IFG &= ~UCRXIFG;  UCB0TXBUF = x; )
#define MRFI_SPI_READ_BYTE()                  UCB0RXBUF
#define MRFI_SPI_WAIT_DONE()                  while(!(UCB0IFG & UCRXIFG));

/* SPI critical section macros */
typedef bspIState_t mrfiSpiIState_t;
#define MRFI_SPI_ENTER_CRITICAL_SECTION(x)    BSP_ENTER_CRITICAL_SECTION(x)
#define MRFI_SPI_EXIT_CRITICAL_SECTION(x)     BSP_EXIT_CRITICAL_SECTION(x)


/*
 *  CC2520 SPI Specifications
 * -----------------------------------------------
 *    Max SPI Clock   :  8 MHz
 *    Data Order      :  MSB transmitted first
 *    Clock Polarity  :  low when idle
 *    Clock Phase     :  sample leading edge
 */

/* initialization macro */
#define MRFI_SPI_INIT() \
st ( \
  UCB0CTL1 = UCSWRST;                           \
  UCB0CTL1 = UCSWRST | UCSSEL1;                 \
  UCB0CTL0 = UCCKPH | UCMSB | UCMST | UCSYNC;   \
  UCB0BR0  = 2;                                 \
  UCB0BR1  = 0;                                 \
  MRFI_SPI_CONFIG_PORT();                       \
  UCB0CTL1 &= ~UCSWRST;                         \
)

#define MRFI_SPI_IS_INITIALIZED()     (UCB0CTL0 & UCMST)


/**************************************************************************************************
 *                                  Compile Time Integrity Checks
 **************************************************************************************************
 */
#ifndef BSP_BOARD_EXP5438
#error "ERROR: Mismatch between specified board and MRFI configuration."
#endif


/**************************************************************************************************
 */
#endif
