/******************************************************************************/
/* lnk_msp430f5438a.cmd - LINKER COMMAND FILE FOR LINKING MSP430F5438A PROGRAMS     */
/*                                                                            */
/*   Usage:  lnk430 <obj files...>    -o <out file> -m <map file> lnk.cmd     */
/*           cl430  <src files...> -z -o <out file> -m <map file> lnk.cmd     */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/* These linker options are for command line linking only.  For IDE linking,  */
/* you should set your linker options in Project Properties                   */
/* -c                                               LINK USING C CONVENTIONS  */
/* -stack  0x0100                                   SOFTWARE STACK SIZE       */
/* -heap   0x0100                                   HEAP AREA SIZE            */
/*                                                                            */
/*----------------------------------------------------------------------------*/


/****************************************************************************/
/* SPECIFY THE SYSTEM MEMORY MAP                                            */
/****************************************************************************/



/* Flash memory addresses */
__Flash_Start = 0x5C00;             /* Start of Flash */
__Flash_End = 0xFE00;                           /* End of Flash */
    /* Reserved Flash locations for Bootloader Area */
    __Boot_Start = 0xADC0;         /* Boot flash */
    __Boot_Reset = 0xFFFE;                          /* Boot reset vector */
    __Boot_VectorTable = 0xFF80;      /* Boot vector table */

    /* Reserved Flash locations for Application Area */
    _App_Start = (__Flash_Start);                 /* Application Area */
    _App_End = (__Boot_Start-1);                    /* End of application area (before boot) */
    _CRC_Size = (_App_End - _App_Start +1);         /* Number of bytes calculated for CRC */
    _App_Reset_Vector = (__Boot_Start-2);           /* Address of Application reset vector */
    _App_Proxy_Vector_Start = 0xF9DA; /* Proxy interrupt table */
    
 
MEMORY
{
    SFR                     : origin = 0x0000, length = 0x0010
    PERIPHERALS_8BIT        : origin = 0x0010, length = 0x00F0
    PERIPHERALS_16BIT       : origin = 0x0100, length = 0x0100
    RAM                     : origin = 0x1C00, length = 0x4000
    INFOA                   : origin = 0x1980, length = 0x0080
    INFOB                   : origin = 0x1900, length = 0x0080
    INFOC                   : origin = 0x1880, length = 0x0080
    INFOD                   : origin = 0x1800, length = 0x0080
    FLASH                   : origin = 0xADC0, length = 0x5040
    FLASH2                  : origin = 0x10000,length = 0x35C00
    BRINTVEC				: origin = 0xFE00, length = 0x0180
    MAININTVEC1				: origin = 0xFF80, length = 0x005E
    INT47                   : origin = 0xFFDE, length = 0x0002
	MAININTVEC2				: origin = 0xFFE0, length = 0x001E
    RESET                   : origin = 0xFFFE, length = 0x0002
}

/****************************************************************************/
/* SPECIFY THE SECTIONS ALLOCATION INTO MEMORY                              */
/****************************************************************************/

SECTIONS
{
    .bss       : {} > RAM                /* GLOBAL & STATIC VARS              */
    .sysmem    : {} > RAM                /* DYNAMIC MEMORY ALLOCATION AREA    */
    .stack     : {} > RAM (HIGH)         /* SOFTWARE SYSTEM STACK             */
    
    .text      : {}>> FLASH | FLASH2     /* CODE                              */
    .text:_isr : {} > FLASH              /* ISR CODE SPACE                    */
    .cinit     : {} > FLASH              /* INITIALIZATION TABLES             */
//#ifdef (__LARGE_DATA_MODEL__)
    .const     : {} > FLASH | FLASH2     /* CONSTANT DATA                     */
//#else
//    .const     : {} > FLASH              /* CONSTANT DATA                     */
//#endif
    .cio       : {} > RAM                /* C I/O BUFFER                      */

    .pinit     : {} > FLASH              /* C++ CONSTRUCTOR TABLES            */
    
    .infoA     : {} > INFOA              /* MSP430 INFO FLASH MEMORY SEGMENTS */
    .rpdata   : {} > INFOB              /* , fill=0x0001 */
    .infoB	   : {} > INFOB
    .infoC     : {} > INFOC
    .infoD     : {} > INFOD

	.brintvec  : {} > BRINTVEC
	
	.mainintvec1 : {} > MAININTVEC1
    .int47   : {} > INT47
    .mainintvec2 : {} > MAININTVEC2

    .reset   : {} > RESET              /* MSP430 RESET VECTOR               */ 
}

/****************************************************************************/
/* INCLUDE PERIPHERALS MEMORY MAP                                           */
/****************************************************************************/

-l msp430f5438a.cmd

