################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/mrfi/mrfi.c 

OBJS += \
./Components/mrfi/mrfi.obj 

C_DEPS += \
./Components/mrfi/mrfi.pp 

OBJS__QTD += \
".\Components\mrfi\mrfi.obj" 

C_DEPS__QTD += \
".\Components\mrfi\mrfi.pp" 

C_SRCS_QUOTED += \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/mrfi/mrfi.c" 


# Each subdirectory must supply rules for building sources it contributes
Components/mrfi/mrfi.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/mrfi/mrfi.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo -g >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/mrfi/mrfi.pp" >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/mrfi" >> "Components/mrfi/mrfi_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/mrfi/mrfi_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/mrfi/mrfi_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/mrfi/mrfi_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


