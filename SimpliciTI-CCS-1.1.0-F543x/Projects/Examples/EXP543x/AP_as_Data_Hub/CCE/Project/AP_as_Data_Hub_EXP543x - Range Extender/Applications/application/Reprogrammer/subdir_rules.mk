################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Applications/application/Reprogrammer/interrupt\ proxy.obj: ../Applications/application/Reprogrammer/interrupt\ proxy.asm $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	@echo 'Flags: --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Range_Extender/smpl_config.dat" --silicon_version=mspx -g -O2 --define=MRFI_CC1100 --define=__MSP430F5438__ --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --diag_warning=225 --printf_support=minimal --preproc_with_compile'
	@echo 'Flags (cont-d): --preproc_dependency="Applications/application/Reprogrammer/interrupt proxy.pp" --obj_directory="Applications/application/Reprogrammer"'
	$(shell echo --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Range_Extender/smpl_config.dat" --silicon_version=mspx -g -O2 --define=MRFI_CC1100 --define=__MSP430F5438__ --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --diag_warning=225 --printf_support=minimal --preproc_with_compile > "Applications/application/Reprogrammer/interrupt proxy_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Applications/application/Reprogrammer/interrupt proxy.pp" --obj_directory="Applications/application/Reprogrammer" >> "Applications/application/Reprogrammer/interrupt proxy_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Applications/application/Reprogrammer/interrupt proxy_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Applications/application/Reprogrammer/interrupt proxy_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Applications/application/Reprogrammer/interrupt proxy_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Applications/application/Reprogrammer/reprogrammer.obj: ../Applications/application/Reprogrammer/reprogrammer.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	@echo 'Flags: --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Range_Extender/smpl_config.dat" --silicon_version=mspx -g -O2 --define=MRFI_CC1100 --define=__MSP430F5438__ --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --diag_warning=225 --printf_support=minimal --preproc_with_compile'
	@echo 'Flags (cont-d): --preproc_dependency="Applications/application/Reprogrammer/reprogrammer.pp" --obj_directory="Applications/application/Reprogrammer"'
	$(shell echo --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Range_Extender/smpl_config.dat" --silicon_version=mspx -g -O2 --define=MRFI_CC1100 --define=__MSP430F5438__ --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/cygwin64/home/blico3/Wireless-Reprogramming/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --diag_warning=225 --printf_support=minimal --preproc_with_compile > "Applications/application/Reprogrammer/reprogrammer_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Applications/application/Reprogrammer/reprogrammer.pp" --obj_directory="Applications/application/Reprogrammer" >> "Applications/application/Reprogrammer/reprogrammer_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Applications/application/Reprogrammer/reprogrammer_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Applications/application/Reprogrammer/reprogrammer_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Applications/application/Reprogrammer/reprogrammer_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


