/******************************************************************************/
/* lnk_msp430f5419.cmd - LINKER COMMAND FILE FOR LINKING MSP430F5419 PROGRAMS */
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
    FLASH                   : origin = 0x5C80, length = 0x5140
    FLASH2                  : origin = 0x10000,length = 0x15C00



    BRINTVEC                : origin = 0xFE00, length = 0x180
/* Relocated segment definition for interrupt vectors / reset vector. */
    INT00                   : origin = 0x5C00, length = 0x0002
    INT01                   : origin = 0x5C02, length = 0x0002
    INT02                   : origin = 0x5C04, length = 0x0002
    INT03                   : origin = 0x5C06, length = 0x0002
    INT04                   : origin = 0x5C08, length = 0x0002
    INT05                   : origin = 0x5C0A, length = 0x0002
    INT06                   : origin = 0x5C0C, length = 0x0002
    INT07                   : origin = 0x5C0E, length = 0x0002
    INT08                   : origin = 0x5C10, length = 0x0002
    INT09                   : origin = 0x5C12, length = 0x0002
    INT10                   : origin = 0x5C14, length = 0x0002
    INT11                   : origin = 0x5C16, length = 0x0002
    INT12                   : origin = 0x5C18, length = 0x0002
    INT13                   : origin = 0x5C1A, length = 0x0002
    INT14                   : origin = 0x5C1C, length = 0x0002
    INT15                   : origin = 0x5C1E, length = 0x0002
    INT16                   : origin = 0x5C20, length = 0x0002
    INT17                   : origin = 0x5C22, length = 0x0002
    INT18                   : origin = 0x5C24, length = 0x0002
    INT19                   : origin = 0x5C26, length = 0x0002
    INT20                   : origin = 0x5C28, length = 0x0002
    INT21                   : origin = 0x5C2A, length = 0x0002
    INT22                   : origin = 0x5C2C, length = 0x0002
    INT23                   : origin = 0x5C2E, length = 0x0002
    INT24                   : origin = 0x5C30, length = 0x0002
    INT25                   : origin = 0x5C32, length = 0x0002
    INT26                   : origin = 0x5C34, length = 0x0002
    INT27                   : origin = 0x5C36, length = 0x0002
    INT28                   : origin = 0x5C38, length = 0x0002
    INT29                   : origin = 0x5C3A, length = 0x0002
    INT30                   : origin = 0x5C3C, length = 0x0002
    INT31                   : origin = 0x5C3E, length = 0x0002
    INT32                   : origin = 0x5C40, length = 0x0002
    INT33                   : origin = 0x5C42, length = 0x0002
    INT34                   : origin = 0x5C44, length = 0x0002
    INT35                   : origin = 0x5C46, length = 0x0002
    INT36                   : origin = 0x5C48, length = 0x0002
    INT37                   : origin = 0x5C4A, length = 0x0002
    INT38                   : origin = 0x5C4C, length = 0x0002
    INT39                   : origin = 0x5C4E, length = 0x0002
    INT40                   : origin = 0x5C50, length = 0x0002
    INT41                   : origin = 0x5C52, length = 0x0002
    INT42                   : origin = 0x5C54, length = 0x0002
    INT43                   : origin = 0x5C56, length = 0x0002
    INT44                   : origin = 0x5C58, length = 0x0002
    INT45                   : origin = 0x5C5A, length = 0x0002
    INT46                   : origin = 0x5C5C, length = 0x0002
    INT47                   : origin = 0x5C5E, length = 0x0002
    INT48                   : origin = 0x5C60, length = 0x0002
    INT49                   : origin = 0x5C62, length = 0x0002
    INT50                   : origin = 0x5C64, length = 0x0002
    INT51                   : origin = 0x5C66, length = 0x0002
    INT52                   : origin = 0x5C68, length = 0x0002
    INT53                   : origin = 0x5C6A, length = 0x0002
    INT54                   : origin = 0x5C6C, length = 0x0002
    INT55                   : origin = 0x5C6E, length = 0x0002
    INT56                   : origin = 0x5C70, length = 0x0002
    INT57                   : origin = 0x5C72, length = 0x0002
    INT58                   : origin = 0x5C74, length = 0x0002
    INT59                   : origin = 0x5C76, length = 0x0002
    INT60                   : origin = 0x5C78, length = 0x0002
    INT61                   : origin = 0x5C7A, length = 0x0002
    INT62                   : origin = 0x5C7C, length = 0x0002
    RESET                   : origin = 0x5C7E, length = 0x0002
    
    /* Reserved main interrupt vectors space. */
    MAININTVEC     	        : origin = 0xFF80, length = 0x0080
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
    .const     : {} > FLASH | FLASH2     /* CONSTANT DATA                     */
    .cio       : {} > RAM                /* C I/O BUFFER                      */

    .pinit     : {} > FLASH              /* C++ CONSTRUCTOR TABLES            */

    .infoA     : {} > INFOA              /* MSP430 INFO FLASH MEMORY SEGMENTS */
    .rstdata   : {} > INFOB  
    .infoB     : {} > INFOB  
    .infoC     : {} > INFOC
    .infoD     : {} > INFOD

    .int00   : {} > INT00                /* MSP430 INTERRUPT VECTORS          */
    .int01   : {} > INT01
    .int02   : {} > INT02
    .int03   : {} > INT03
    .int04   : {} > INT04
    .int05   : {} > INT05
    .int06   : {} > INT06
    .int07   : {} > INT07
    .int08   : {} > INT08
    .int09   : {} > INT09
    .int10   : {} > INT10
    .int11   : {} > INT11
    .int12   : {} > INT12
    .int13   : {} > INT13
    .int14   : {} > INT14
    .int15   : {} > INT15
    .int16   : {} > INT16
    .int17   : {} > INT17
    .int18   : {} > INT18
    .int19   : {} > INT19
    .int20   : {} > INT20
    .int21   : {} > INT21
    .int22   : {} > INT22
    .int23   : {} > INT23
    .int24   : {} > INT24
    .int25   : {} > INT25
    .int26   : {} > INT26
    .int27   : {} > INT27
    .int28   : {} > INT28
    .int29   : {} > INT29
    .int30   : {} > INT30
    .int31   : {} > INT31
    .int32   : {} > INT32
    .int33   : {} > INT33
    .int34   : {} > INT34
    .int35   : {} > INT35
    .int36   : {} > INT36
    .int37   : {} > INT37
    .int38   : {} > INT38
    .int39   : {} > INT39
    .int40   : {} > INT40
    .int41   : {} > INT41
    .int42   : {} > INT42
    .int43   : {} > INT43
    .int44   : {} > INT44
    .int45   : {} > INT45
    .int46   : {} > INT46
    .int47   : {} > INT47
    .int48   : {} > INT48
    .int49   : {} > INT49
    .int50   : {} > INT50
    .int51   : {} > INT51
    .int52   : {} > INT52
    .int53   : {} > INT53
    .int54   : {} > INT54
    .int55   : {} > INT55
    .int56   : {} > INT56
    .int57   : {} > INT57
    .int58   : {} > INT58
    .int59   : {} > INT59
    .int60   : {} > INT60
    .int61   : {} > INT61
    .int62   : {} > INT62
    .reset   : {} > RESET              /* MSP430 RESET VECTOR               */ 
}

/****************************************************************************/
/* INCLUDE PERIPHERALS MEMORY MAP                                           */
/****************************************************************************/

-l msp430f5438a.cmd

