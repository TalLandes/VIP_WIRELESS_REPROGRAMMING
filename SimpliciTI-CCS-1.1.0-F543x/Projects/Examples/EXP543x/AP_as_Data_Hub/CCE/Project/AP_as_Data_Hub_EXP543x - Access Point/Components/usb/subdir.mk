################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Components/usb/usb.c 

OBJS += \
./Components/usb/usb.obj 

C_DEPS += \
./Components/usb/usb.pp 

OBJS__QTD += \
".\Components\usb\usb.obj" 

C_DEPS__QTD += \
".\Components\usb\usb.pp" 

C_SRCS_QUOTED += \
"../Components/usb/usb.c" 


# Each subdirectory must supply rules for building sources it contributes
Components/usb/usb.obj: ../Components/usb/usb.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo -g >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/usb/usb.pp" >> "Components/usb/usb_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/usb" >> "Components/usb/usb_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/usb/usb_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/usb/usb_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/usb/usb_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


