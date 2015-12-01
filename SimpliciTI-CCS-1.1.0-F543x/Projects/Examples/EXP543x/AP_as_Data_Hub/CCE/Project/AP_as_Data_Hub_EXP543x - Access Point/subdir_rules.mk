################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
lnk_msp430f5438a.out: ../lnk_msp430f5438a.cmd $(GEN_CMDS)
	@echo 'Building file: $<'
	@echo 'Invoking: Linker'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat"  --silicon_version=mspx -g -O2 --define=MRFI_CC2520 --define=__MSP430F5438__ --diag_warning=225 --printf_support=minimal -z -m"Project.map" --stack_size=160 --heap_size=160 --use_hw_mpy=F5 --warn_sections -i"C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/lib" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --reread_libs --rom_model -o "$@" "$<" "../lnk_msp430f5438a.cmd"
	@echo 'Finished building: $<'
	@echo ' '


