################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/Applications/main_AP_Async_Listen.c 

OBJS += \
./Applications/application/Access\ Point/main_AP_Async_Listen.obj 

C_DEPS += \
./Applications/application/Access\ Point/main_AP_Async_Listen.pp 

OBJS__QTD += \
".\Applications\application\Access Point\main_AP_Async_Listen.obj" 

C_DEPS__QTD += \
".\Applications\application\Access Point\main_AP_Async_Listen.pp" 

C_SRCS_QUOTED += \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/Applications/main_AP_Async_Listen.c" 


# Each subdirectory must supply rules for building sources it contributes
Applications/application/Access\ Point/main_AP_Async_Listen.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/Applications/main_AP_Async_Listen.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo -g >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo -O2 >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Applications/application/Access Point/main_AP_Async_Listen.pp" >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(shell echo --obj_directory="Applications/application/Access Point" >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Applications/application/Access Point/main_AP_Async_Listen_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


