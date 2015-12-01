################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/Applications/main_manyEDs.c 

OBJS += \
./Applications/application/End\ Device/main_manyEDs.obj 

C_DEPS += \
./Applications/application/End\ Device/main_manyEDs.pp 

OBJS__QTD += \
".\Applications\application\End Device\main_manyEDs.obj" 

C_DEPS__QTD += \
".\Applications\application\End Device\main_manyEDs.pp" 

C_SRCS_QUOTED += \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/Applications/main_manyEDs.c" 


# Each subdirectory must supply rules for building sources it contributes
Applications/application/End\ Device/main_manyEDs.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/Applications/main_manyEDs.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/End_Device/smpl_config.dat" > "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo -vmspx >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo -g >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo -O2 >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438A__ >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/Components/Apps" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU22 >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU21 >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU23 >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU40 >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Applications/application/End Device/main_manyEDs.pp" >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(shell echo --obj_directory="Applications/application/End Device" >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Applications/application/End Device/main_manyEDs_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Applications/application/End Device/main_manyEDs_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


