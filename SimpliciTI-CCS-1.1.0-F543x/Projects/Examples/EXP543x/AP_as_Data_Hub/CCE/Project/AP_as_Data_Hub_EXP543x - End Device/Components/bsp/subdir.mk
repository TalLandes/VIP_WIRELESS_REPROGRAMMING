################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/bsp/bsp.c \
../Components/bsp/bsp_rtc.c 

OBJS += \
./Components/bsp/bsp.obj \
./Components/bsp/bsp_rtc.obj 

C_DEPS += \
./Components/bsp/bsp.pp \
./Components/bsp/bsp_rtc.pp 

OBJS__QTD += \
".\Components\bsp\bsp.obj" \
".\Components\bsp\bsp_rtc.obj" 

C_DEPS__QTD += \
".\Components\bsp\bsp.pp" \
".\Components\bsp\bsp_rtc.pp" 

C_SRCS_QUOTED += \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/bsp/bsp.c" \
"../Components/bsp/bsp_rtc.c" 


# Each subdirectory must supply rules for building sources it contributes
Components/bsp/bsp.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/bsp/bsp.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/End_Device/smpl_config.dat" > "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo -vmspx >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo -g >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438A__ >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/Components/Apps" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU22 >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU21 >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU23 >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU40 >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/bsp/bsp.pp" >> "Components/bsp/bsp_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/bsp" >> "Components/bsp/bsp_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/bsp/bsp_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/bsp/bsp_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/bsp/bsp_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/bsp/bsp_rtc.obj: ../Components/bsp/bsp_rtc.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/End_Device/smpl_config.dat" > "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo -vmspx >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo -g >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438A__ >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/Components/Apps" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU22 >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU21 >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU23 >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU40 >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/bsp/bsp_rtc.pp" >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/bsp" >> "Components/bsp/bsp_rtc_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/bsp/bsp_rtc_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/bsp/bsp_rtc_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/bsp/bsp_rtc_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


